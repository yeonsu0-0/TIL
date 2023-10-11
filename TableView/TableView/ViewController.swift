//
//  ViewController.swift
//  TableView
//
//  Created by yeonsu on 10/11/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrImageName: [String] = ["image1", "image2", "image3", "image4", "image5"]
    
    var arrFruitName: [String] = ["Apple", "Banana", "Peach", "Grape", "Strawberry"]
    
    var arrFruitInfo: [String] = ["Lorem Ipsum is simply dummy text", "Lorem Ipsum has been the industry's standard dummy ", "It is a long established fact", "sometimes on purpose (injected humour and the like", "discovered the undoubtable source"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: "FruitTableViewCell", bundle: nil)
           tableView.register(nibName, forCellReuseIdentifier: "FruitTableViewCell")
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // TableView item 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrImageName.count
    }
    
    // TableView Cell의 Object
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FruitTableViewCell", for: indexPath) as! FruitTableViewCell
        
        cell.thumbnail.image = UIImage(named: arrImageName[indexPath.row])
        cell.name.text = arrFruitName[indexPath.row]
        cell.subText.text = arrFruitInfo[indexPath.row]
        
        return cell
        
    }
}
