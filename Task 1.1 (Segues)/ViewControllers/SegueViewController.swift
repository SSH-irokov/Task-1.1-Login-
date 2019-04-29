//
//  SegueViewController.swift
//  Task 1.1 (Segues)
//
//  Created by Паша on 29/04/2019.
//  Copyright © 2019 Паша. All rights reserved.
//

import UIKit

class SegueViewController: UIViewController {
    @IBOutlet weak var NavigationText: UINavigationItem!
    @IBOutlet weak var label: UILabel!
    
    var NavigationT = ""
    var TextofLabel = ""
}

//MARK: - ViewDidLoad
extension SegueViewController {
    override func viewDidLoad() {
        label.text = TextofLabel
        NavigationText.title = NavigationT
        
    }
}
