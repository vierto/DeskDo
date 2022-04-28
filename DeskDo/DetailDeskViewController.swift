//
//  DetailDeskViewController.swift
//  DeskDo
//
//  Created by Vendly on 28/04/22.
//

import UIKit

class DetailDeskViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var deskNameLbl: UILabel!
    
    @IBOutlet weak var deskDetailImg: UIImageView! {
        didSet {
            deskDetailImg.layer.masksToBounds = true
            let overlay = UIView()
                        overlay.backgroundColor = UIColor(white: 0, alpha: 0.3)
                        overlay.frame = CGRect(x: 0, y: 0, width: deskDetailImg.frame.width, height: deskDetailImg.frame.height)

            deskDetailImg.addSubview(overlay)
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var deskDo: [DeskDoItem]?
    var deskTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        deskNameLbl.text = deskTitle
        
        deskDetailImg.image = UIImage(named: "gaming_desk_1")
        
        fetchData()
    }
    
    func fetchData() {
        
        do {
            self.deskDo = try context.fetch(DeskDoItem.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print(error)
        }
        
    }
    
}

extension DetailDeskViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.deskDo?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "detailDeskCellID"))!

        let deskItem = self.deskDo![indexPath.row]
        cell.textLabel?.text = deskItem.stuffName

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        if cell?.accessoryType == UITableViewCell.AccessoryType.none {
            cell?.accessoryType = .checkmark
        } else {
            cell?.accessoryType = .none
        }
    }
    
}
