//
//  NewDeskViewController.swift
//  DeskDo
//
//  Created by Vendly on 27/04/22.
//

import UIKit

class NewDeskViewController: UIViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var deskNameTxt: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addDeskBtn: UIButton!
    
    @IBOutlet weak var addStuffBtn: UIBarButtonItem!
    
    var deskDo: [DeskDoItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
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
    
    @IBAction func onClickStuffBtn(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Desk", message: "Add steps and Stuff to Your Desk", preferredStyle: .alert)
        alert.addTextField()
        
        let submitBtn = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let txtField = alert.textFields![0]
            
            let newDesk = DeskDoItem(context: self.context)
            newDesk.deskName = self.deskNameTxt.text
            newDesk.stuffName = txtField.text
            
            do {
                try self.context.save()
            } catch {
                print(error)
            }
            
            self.fetchData()
        }
        
        alert.addAction(submitBtn)
        present(alert, animated: true)
    }
    
    @IBAction func onClickDesk(_ sender: Any) {
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail" {
            let detailVC = segue.destination as? DetailDeskViewController
            detailVC?.deskTitle = deskNameTxt.text!
        }
    }
}

extension NewDeskViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.deskDo?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stuffCellID", for: indexPath)
        
        let deskItem = self.deskDo![indexPath.row]
        cell.textLabel?.text = deskItem.stuffName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let deskItem = self.deskDo![indexPath.row]
        
        let alert = UIAlertController(title: "Edit Desk", message: "Edit step and stuff", preferredStyle: .alert)
        alert.addTextField()
        
        let txtField = alert.textFields![0]
        txtField.text = deskItem.stuffName
        
        let saveBtn = UIAlertAction(title: "Save", style: .default) { (action) in
            let textField = alert.textFields![0]
            deskItem.stuffName = textField.text
            
            do {
                try self.context.save()
            } catch {
                print(error)
            }
            
            self.fetchData()
        }
        
        alert.addAction(saveBtn)
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            
            let deskToRemove = self.deskDo![indexPath.row]
            self.context.delete(deskToRemove)
            
            do {
                try self.context.save()
            } catch {
                print(error)
            }
            
            self.fetchData()
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
}
