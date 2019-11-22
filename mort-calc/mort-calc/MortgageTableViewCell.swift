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
    
    var mortgage:Mortgage?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        func updateViews(){
            guard let unwrappedID = (mortgage?.code) else {return}
            idOutlet.text = String(unwrappedID)
            
            guard let unwrappedNote = (mortgage?.note) else {return}
            notesOutlet.text = unwrappedNote
        }

        // Configure the view for the selected state
    }

}
