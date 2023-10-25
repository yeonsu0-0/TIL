//
//  ViewController.swift
//  DelegatePattern
//
//  Created by yeonsu on 10/25/23.
//

import UIKit

protocol PhoneSelectionDelegate {
    func didTapChoice(image: UIImage, name: String)
}

class ViewController: UIViewController, PhoneSelectionDelegate {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var chooseButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func chooseButtonTapped(_ sender: Any) {
        let selectionVC = storyboard?.instantiateViewController(withIdentifier: "SelectionScreen") as! SelectionViewController
        selectionVC.phoneSelectionDelegate = self
        present(selectionVC, animated: true, completion: nil)
    }
    
    func didTapChoice(image: UIImage, name: String) {
        imageView.image = image
        nameLabel.text = name
    }
    
}

