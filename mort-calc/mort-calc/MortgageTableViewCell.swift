//
//  MortgageTableViewCell.swift
//  mort-calc
//
//  Created by Lambda_School_Loaner_219 on 11/22/19.
//  Copyright © 2019 Lambda_School_Loaner_219. All rights reserved.
//

import UIKit

class MortgageTableViewCell: UITableViewCell {
    @IBOutlet weak var idOutlet: UILabel!
    
    @IBOutlet weak var notesOutlet: UILabel!
    
  
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

    
        
        func updateViews(){
            guard let mortgage = mortgage else {return}
        
           
            idOutlet.text = "ID:\(String(mortgage.code))"
            
            guard let unwrappedNote = (mortgage.note) else {return}
            notesOutlet.text = "Notes: \(unwrappedNote)"
        }

        // Configure the view for the selected state
    
    var mortgage:Mortgage?{
         didSet {
             updateViews()
         }
     }
}


