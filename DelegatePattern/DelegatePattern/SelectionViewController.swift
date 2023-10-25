//
//  SelectionViewController.swift
//  DelegatePattern
//
//  Created by yeonsu on 10/25/23.
//

import UIKit

class SelectionViewController: UIViewController {
    
    var phoneSelectionDelegate: PhoneSelectionDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func iPhoneTapped(_ sender: Any) {
        phoneSelectionDelegate.didTapChoice(image: UIImage(named:"iPhone")!, name: "아이폰")
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func samsungTapped(_ sender: Any) {
        phoneSelectionDelegate.didTapChoice(image: UIImage(named:"samsung")!, name: "삼성")
        
        dismiss(animated: true, completion: nil)
    }
}
