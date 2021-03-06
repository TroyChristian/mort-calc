//
//  MortgageTableViewController.swift
//  mort-calc
//
//  Created by Lambda_School_Loaner_219 on 11/22/19.
//  Copyright © 2019 Lambda_School_Loaner_219. All rights reserved.
//

import UIKit

class MortgageTableViewController: UITableViewController {
    var mortgageController = MortgageController() 
    var tableMortgage:Mortgage?
    override func viewDidLoad() {
        tableView.backgroundView = UIImageView(image: UIImage(named: "background"))
       
        super.viewDidLoad()
            let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(toggleEditing)) // create a bat button
            navigationItem.rightBarButtonItem = editButton // assign button
        }

        @objc private func toggleEditing() {
            tableView.setEditing(tableView.isEditing, animated: true) // Set opposite value of current editing status
            navigationItem.rightBarButtonItem?.title = tableView.isEditing ? "Done" : "Edit" // Set title depending on the editing status
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    

    // MARK: - Table view data source

   
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return  mortgageController.mortgages.count
     
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mortgageCell", for: indexPath) as? MortgageTableViewCell else {return UITableViewCell()}
        
      
        
        // bookController.readBooks[indexPath.row]
        let mortgage = mortgageController.mortgages[indexPath.row]
        cell.backgroundColor =  UIColor.clear
        cell.mortgage = mortgage
   
        
        

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        let mortgage = mortgageController.mortgages[indexPath.row]
        //mortgageController.updateMortgage(mortgage: mortgage, newNote: <#T##String#>)
        return true
    }
    

    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
           // tableView.deleteRows(at: [indexPath], with: .fade)
            let mortgage = mortgageController.mortgages[indexPath.row]
            mortgageController.deleteMortgage(mortgage: mortgage)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */




    } }
