//
//  AdvancedAnimation.swift
//  iOS11Demo
//
//  Created by danlan on 2017/6/28.
//  Copyright © 2017年 lxc. All rights reserved.
//

import UIKit

class AdvancedAnimation: UIViewController {

    @IBOutlet weak var animatedView: UIView!
    
    var animator: UIViewPropertyAnimator!
    var progressWhenInterrupted: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pangesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(recognizer:)))
        self.animatedView.addGestureRecognizer(pangesture)
    }
    
    // MARK:  Step 1
    /*func handlePan(recognizer: UIPanGestureRecognizer) {
        
        switch recognizer.state {
        case .began:
            animator = UIViewPropertyAnimator(duration: 1, curve: .easeOut, animations: {
                self.animatedView.frame = self.animatedView.frame.offsetBy(dx: 180, dy: 0)
            })
            animator.pauseAnimation()
        case .changed:
            let translation = recognizer.translation(in: self.animatedView)
            self.animator.fractionComplete = translation.x / 180
        case .ended:
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            
            
        case .possible:
            print("")
        case .cancelled:
            print("")
        case .failed:
            print("")
        }
    }*/
    
    func animateTransitionIfNeeded(duration: TimeInterval) {
        
    }
    
    // MARK:  Step 2
    func handlePan(recognizer: UIPanGestureRecognizer) {
        
        switch recognizer.state {
        case .began:
            animator = UIViewPropertyAnimator(duration: 1, curve: .easeOut, animations: {
                self.animatedView.frame = self.animatedView.frame.offsetBy(dx: 180, dy: 0)
            })
            animator.pausesOnCompletion = true
            animator.pauseAnimation()
            progressWhenInterrupted = animator.fractionComplete
            
        case .changed:
            let translation = recognizer.translation(in: self.animatedView)
            self.animator.fractionComplete = translation.x / 180 + progressWhenInterrupted
        case .ended:
            let timing = UICubicTimingParameters(animationCurve: .easeOut)
            animator.continueAnimation(withTimingParameters: timing, durationFactor: 0)
            
            
        case .possible:
            print("")
        case .cancelled:
            print("")
        case .failed:
            print("")
        }
    }
    
    
    @IBAction func baseClick(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.animatedView.frame = self.animatedView.frame.offsetBy(dx: 180, dy: 0)
        }
    }
    @IBAction func proClick(_ sender: Any) {
        
        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn) {
            self.animatedView.frame = self.animatedView.frame.offsetBy(dx: 180, dy: 0)
        }
        animator.startAnimation()
    }
    
    @IBAction func advan1Click(_ sender: Any) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
