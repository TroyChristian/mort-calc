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
        let newMortgage = Mortgage(loan: loan, term: term, interestRate: Double(interestRate), startDate: startDate)
        mortgages.append(newMortgage)
       return newMortgage
        
    }
    
}


/*   var loan:Int
 var term:Int
 var interestRate:Int
 var startDate:String*/
