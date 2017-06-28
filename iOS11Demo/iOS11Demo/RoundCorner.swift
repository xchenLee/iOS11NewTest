//
//  RoundCorner.swift
//  iOS11Demo
//
//  Created by danlan on 2017/6/28.
//  Copyright © 2017年 lxc. All rights reserved.
//

import UIKit

class RoundCorner: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.contentView.clipsToBounds = true
        
    }

    @IBAction func allClick(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.contentView.layer.cornerRadius = 20
            self.contentView.layer.maskedCorners = [.layerMinXMinYCorner , .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
    }
    @IBAction func topClick(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.contentView.layer.cornerRadius = 20
            self.contentView.layer.maskedCorners = [.layerMinXMinYCorner , .layerMaxXMinYCorner]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
