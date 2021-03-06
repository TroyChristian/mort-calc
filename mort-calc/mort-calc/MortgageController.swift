//
//  MortgageController.swift
//  mort-calc
//
//  Created by Lambda_School_Loaner_219 on 11/21/19.
//  Copyright © 2019 Lambda_School_Loaner_219. All rights reserved.
//

import Foundation
class MortgageController{
    init() {
          loadFromPersistentStore()
      }
    var  mortgages:[Mortgage] = []
    func createMortgage(loan:Int, term:Int, interestRate:Double, startDate:String) -> Mortgage{
        let number = Int.random(in: 0 ... 1000)
        let newMortgage = Mortgage(loan: loan, term: term, interestRate: Double(interestRate), startDate: startDate, code:number) //append new enddate when saved
        mortgages.append(newMortgage)
        saveToPersistentStore()
       return newMortgage
        
    }
    
    func deleteMortgage(mortgage:Mortgage){
        guard let index = mortgages.firstIndex(of:mortgage) else { return }
        mortgages.remove(at:index)
        saveToPersistentStore()
        
    }
    
    func updateMortgage(mortgage:Mortgage, newNote:String){
        guard let index = mortgages.firstIndex(of:mortgage) else {return}
        var scratch = mortgage
          
          scratch.note = newNote
          
          
          mortgages.remove(at: index)
          mortgages.insert(scratch, at: index)
        saveToPersistentStore()
        
    }
    
    func clearMortgages(arg:MortgageController){
        self.mortgages = []
        saveToPersistentStore()
    }
    
    @discardableResult func searchByID(arg:Int) -> Mortgage? {
        for item in mortgages{
            if item.code == arg {
                return item
            }
            
        }
        return nil
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


