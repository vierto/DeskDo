//
//  ViewController.swift
//  DeskDo
//
//  Created by Vendly on 26/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addNewDeskBtn: UIBarButtonItem!
    
    var desk: [DeskModel] = []
    var deskDo: [DeskDoItem]?
    var selectedIdx: IndexPath = IndexPath(row: 0, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        desk = DeskDataDB().insertData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        registerCell()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func registerCell() {
        tableView.register(UINib(nibName: "YourDeskCell", bundle: nil), forCellReuseIdentifier: "yourDeskCellID")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = (tableView.dequeueReusableCell(withIdentifier: "yourDeskCellID") as? YourDeskCell)!
        
        cell.deskName.text = desk[indexPath.row].deskName
        cell.deskImg.image = UIImage(named: desk[indexPath.row].deskImg ?? "")
        
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return desk.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIdx = indexPath
        
        performSegue(withIdentifier: "homeToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeToDetail" {
            let detailVC = segue.destination as? DetailDeskViewController
            detailVC?.deskTitle = desk[selectedIdx.row].deskName ?? ""
        }
    }
}
