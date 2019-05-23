//
//  NewViewController.swift
//  CustomModalTransitions
//
//  Created by Stephen Bassett on 5/22/19.
//  Copyright © 2019 Stephen Bassett. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet var hideButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideButton.alpha = 0
        
        UIView.animate(withDuration: 0.6) {
            self.hideButton.alpha = 1
        }
    }
    
    @IBAction func hideNewVC(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.hideButton.alpha = 0
        }
        dismiss(animated: true, completion: nil)
    }
    

}
