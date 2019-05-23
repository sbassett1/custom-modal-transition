//
//  ViewController.swift
//  CustomModalTransitions
//
//  Created by Stephen Bassett on 5/22/19.
//  Copyright © 2019 Stephen Bassett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var showButton: UIButton!
    @IBOutlet var bottomButtonConstraint: NSLayoutConstraint!
    
    var onscreenValue: CGFloat = 90
    var offscreenValue: CGFloat = -60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showButton.alpha = 0.2
        self.bottomButtonConstraint.constant = self.offscreenValue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 0.6) {
            self.showButton.alpha = 1
            self.bottomButtonConstraint.constant = self.onscreenValue
            self.view.layoutIfNeeded()
        }
    }

    @IBAction func showNewVC(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.showButton.alpha = 0
            self.bottomButtonConstraint.constant = self.offscreenValue
            self.view.layoutIfNeeded()
        }
        performSegue(withIdentifier: "ShowNewVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? NewViewController {
            destinationVC.transitioningDelegate = self
        }
    }
    
}

extension ViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
    
}
