//
//  DismissAnimator.swift
//  CustomModalTransitions
//
//  Created by Stephen Bassett on 5/22/19.
//  Copyright © 2019 Stephen Bassett. All rights reserved.
//

import UIKit

class DismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        guard let toView = transitionContext.view(forKey: .to) else { return }
        
        transitionContext.containerView.addSubview(toView)
        transitionContext.containerView.bringSubviewToFront(fromView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            fromView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            fromView.alpha = 0
        }) { _ in
            transitionContext.completeTransition(true)
        }
        
    }
    
}
