//
//  AppViewController.swift
//  Appointment
//
//  Created by Stringham on 10/22/18.
//  Copyright © 2018 Stringham. All rights reserved.
//

import UIKit
class AppViewController: UITableViewController {
    var itemShop: ItemShop!
    var imageStore: ImageStore!
    
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        let newItem = itemShop.createItem()
        
        if let index = itemShop.allItems.index(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
   
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return itemShop.allItems.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell",for: indexPath) as! ItemCell
        
        let item = itemShop.allItems[indexPath.row]
        
        cell.typeLabel.text = item.appType
        cell.dateLabel.text = item.appDate
        cell.timeLabel.text = item.appTime
        cell.locationLabel.text = item.appLocation
        
        return cell }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.rowHeight = 75
    }
    
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let item = itemShop.allItems[indexPath.row]
            let title = "Delete \(item.appType)?"
            let message = "Are you sure you want to delete this Appointment?"
            let ac = UIAlertController(title: title,
                                       message: message,
                                       preferredStyle: .actionSheet)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive,
                                             handler: { (action) -> Void in
            
            self.itemShop.removeItem(item)
            self.imageStore.deleteImage(forKey: item.itemKey)
            
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
            ac.addAction(deleteAction)
            present(ac, animated: true, completion: nil)
        }
    }
    override func tableView(_ tableView: UITableView,moveRowAt sourceIndexPath: IndexPath,
                            
        to destinationIndexPath: IndexPath) {
        itemShop.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "showitem"?:
            
            if let row = tableView.indexPathForSelectedRow?.row {
                
                let item = itemShop.allItems[row]
                let detailViewController
                    = segue.destination as! DetailViewController
                detailViewController.item = item
                detailViewController.imageStore = imageStore
            } default:
                preconditionFailure("Unexpected segue identifier.")
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        navigationItem.leftBarButtonItem = editButtonItem
    }

}
