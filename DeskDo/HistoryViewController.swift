//
//  HistoryViewController.swift
//  DeskDo
//
//  Created by Vendly on 28/04/22.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var desk: [DeskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        desk = DeskDataDB().insertData()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "historyCellID")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.dragDelegate = self
        tableView.dragInteractionEnabled = true
    }
    
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "historyCellID"))!
        
        cell.textLabel?.text = desk[indexPath.row].deskName
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return desk.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            desk.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}

extension HistoryViewController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
       
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = desk[indexPath.row]
        
        return [dragItem]
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let move = desk[sourceIndexPath.row]
        desk.remove(at: sourceIndexPath.row)
        desk.insert(move, at: destinationIndexPath.row)
    }
    
}
