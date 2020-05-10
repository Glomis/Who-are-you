//
//  ResultsViewController.swift
//  Who are you
//
//  Created by Tatyana on 09.05.2020.
//  Copyright © 2020 Max&Co. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    // Mark: - IB Outlets
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDescription: UILabel!
    
    // MARK: - Public Properties
    var responses:[Answer]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
    }
    
    

}
