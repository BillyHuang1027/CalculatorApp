//
//  ViewController.swift
//  CalculatorApp
//
//  Created by 黃昌齊 on 2021/7/29.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nextPageButton: UIButton!
    @IBOutlet weak var nameAndButtonStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        nextPageButton.titleLabel?.adjustsFontSizeToFitWidth = true
        nextPageButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        nextPageButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        nameAndButtonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameAndButtonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }


}

