//
//  InputViewController.swift
//  mort-calc
//
//  Created by Lambda_School_Loaner_219 on 11/20/19.
//  Copyright © 2019 Lambda_School_Loaner_219. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    var inputMortgage:Mortgage?
    let mortgageController = MortgageController()
    var result:Mortgage?
//    var fixedMA:String?
//    var fixedTerm:String?
//    var fixedIR:String?
//    var startDate:String?
    @IBOutlet weak var idSearch: UITextField!
    @IBAction func loadMortgageByID(_ sender: Any) {
        guard let potentialID = idSearch.text else {return}
        guard let intPotentialID = Int(potentialID) else {return}
        result = mortgageController.searchByID(arg: intPotentialID)
        
        
        if result != nil{
            
            shouldPerformSegue(withIdentifier: "loadingID", sender: self)
        }
        
    }
    @IBAction func CalculateButton(_ sender: Any) {
        // unwrap tf values, convert to integers use create func, populate detailviewcontroller with that new morts propertys. make instance of controlle here. in segue we are going to pass that newMortgage.

         guard let fixedMA = Int(inputMortgageAmount.text!) else {return}
         guard let fixedTerm = Int(inputTerm.text!) else {return}
         guard let fixedIR =  Double(IROutlet.text!) else {return}
         guard let startDate = startDateOutlet.text else {return}
          inputMortgage = mortgageController.createMortgage(loan:fixedMA, term: fixedTerm, interestRate: fixedIR, startDate:startDate)
          
             
        //  performSegue(withIdentifier: "detailSegue", sender: sender)}
    }
    
    @IBOutlet weak var inputTerm: UITextField!
    @IBOutlet weak var inputMortgageAmount: UITextField!
    
    @IBOutlet weak var IROutlet: UITextField!
    @IBOutlet weak var startDateOutlet: UITextField!


        
        
        
        
        
    
    
   
    
    override func viewDidLoad() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
          backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
          self.view.insertSubview(backgroundImage, at: 0)
        super.viewDidLoad()
        
        
        //DATE PICKER
        startDateOutlet.inputView = datePicker
        datePicker.setDate(Date(), animated:false)
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(datePickerChanged(datePicker:)), for: .valueChanged)
        view.endEditing(true)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)

        // Do any additional setup after loading the view.
    }
    
      @objc
       func datePickerChanged(datePicker:UIDatePicker){
           let selectedDate = datePicker.date
           
           let dateFormatter = DateFormatter()
           dateFormatter.dateStyle = .medium
           let formattedDateString = dateFormatter.string(from: selectedDate)
           startDateOutlet.text = formattedDateString
       }
     var datePicker = UIDatePicker()
    @objc
    func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
        
        
 

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  
        
       
            
        }
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" && segue.identifier != "loadingID" {
                      guard let vc = segue.destination as? DetailViewController else {return}
                   vc.mortgageController = mortgageController
            if inputMortgage != nil {
                      vc.detailMortgage = inputMortgage
            }
            else {
                vc.detailMortgage = result
            }
                    if segue.identifier == "loadingID"{
                        guard let vc = segue.destination as? DetailViewController else {return}
                        
                        vc.detailMortgage = result
                        print("I'm line 118")
                        print(result?.code)
                    }
                    
                  
            
                 }

                }
         

            
        
}

        



