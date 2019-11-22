//
//  Mortgage.swift
//  mort-calc
//
//  Created by Lambda_School_Loaner_219 on 11/20/19.
//  Copyright © 2019 Lambda_School_Loaner_219. All rights reserved.
//

import Foundation

struct Mortgage: Codable{
    var loan:Int
    var term:Int
    var interestRate:Double
    var startDate:String
    var endDate:String?
    
    init(loan:Int, term:Int, interestRate:Double, startDate:String, endDate:String = "1/1/2001"){
        self.loan = loan
        self.term = term
        self.interestRate = interestRate
        self.startDate = startDate
        self.endDate = endDate 
    }
   // var endDate:Date {
        //return startDate.advanced(by: //31536000 * term) // number //of seconds in a year times //the amount of years in the term.
    }




//let modifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: today)
