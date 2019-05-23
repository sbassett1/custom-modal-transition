//
//  PresentAnimator.swift
//  CustomModalTransitions
//
//  Created by Stephen Bassett on 5/22/19.
//  Copyright © 2019 Stephen Bassett. All rights reserved.
//

import UIKit

class PresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let fromView = transitionContext.view(forKey: .from) else { return }
        guard let toView = transitionContext.view(forKey: .to) else { return }
        
        toView.transform = CGAffineTransform(scaleX: 0, y: 0)
        toView.alpha = 0

        transitionContext.containerView.addSubview(fromView)
        transitionContext.containerView.addSubview(toView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toView.transform = CGAffineTransform.identity
            toView.alpha = 1
        }) { _ in
            transitionContext.completeTransition(true)
        }
        
    }
    
}
