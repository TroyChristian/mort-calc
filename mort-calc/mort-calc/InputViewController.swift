//
//  InputViewController.swift
//  mort-calc
//
//  Created by Lambda_School_Loaner_219 on 11/20/19.
//  Copyright © 2019 Lambda_School_Loaner_219. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var startDateOutlet: UITextField!
    override func viewDidLoad() {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
