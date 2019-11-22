//
//  DetailViewController.swift
//  mort-calc
//
//  Created by Lambda_School_Loaner_219 on 11/20/19.
//  Copyright © 2019 Lambda_School_Loaner_219. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var MC:MortgageController?
    var detailMortgage:Mortgage?
    
  
    @IBOutlet weak var MortgageAmountOutlet: UILabel!
    
    @IBOutlet weak var monthlyPaymentOutlet: UILabel!
    
    @IBOutlet weak var totalNumberOfPaymentsOutlet: UILabel!
      
    
    @IBOutlet weak var startDateOutlet: UILabel!
    
    @IBOutlet weak var endDateOutlet: UILabel!
    
    
    @IBOutlet weak var totalInterestPaidOutlet: UILabel!
    
    @IBOutlet weak var totalPaymentOutlet: UILabel!
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
      
    
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    func updateViews(){
        guard isViewLoaded else { return }
        guard let mortgageAmount = detailMortgage else {return}
        
        MortgageAmountOutlet.text? = String(mortgageAmount.loan)
        print(mortgageAmount)
        
      guard let startDate =
          detailMortgage?.startDate else {return}
       startDateOutlet.text? = startDate
        
}

    func calculations(mortgage:Mortgage){
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
