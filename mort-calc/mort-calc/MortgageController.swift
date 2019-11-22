//
//  MortgageController.swift
//  mort-calc
//
//  Created by Lambda_School_Loaner_219 on 11/21/19.
//  Copyright © 2019 Lambda_School_Loaner_219. All rights reserved.
//

import Foundation
class MortgageController{
    var  mortgages:[Mortgage] = []
    func createMortgage(loan:Int, term:Int, interestRate:Double, startDate:String) -> Mortgage{
        let newMortgage = Mortgage(loan: loan, term: term, interestRate: Double(interestRate), startDate: startDate) //append new enddate when saved
        mortgages.append(newMortgage)
       return newMortgage
        
    }
    
    private var mortgageListURL: URL? {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let fileName = "mortgageList.plist"
        
        return documentDirectory?.appendingPathComponent(fileName)
    }
    
    private func saveToPersistentStore() {
        
        let plistEncoder = PropertyListEncoder()
        
        do {
            let notebooksData = try plistEncoder.encode(mortgages)
            
            guard let fileURL = mortgageListURL else { return }
            
            try notebooksData.write(to: fileURL)
        } catch {
            NSLog("Error encoding memories to property list: \(error)")
        }
    }
    
    private func loadFromPersistentStore() {
        
        do {
            guard let fileURL = mortgageListURL else { return }
            
            let notebooksData = try Data(contentsOf: fileURL)
            
            let plistDecoder = PropertyListDecoder()
            
            self.mortgages = try plistDecoder.decode([Mortgage].self, from: notebooksData)
        } catch {
            NSLog("Error decoding memories from property list: \(error)")
        }
    }
    
}


