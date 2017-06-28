//
//  PasswordAutoFill.swift
//  iOS11Demo
//
//  Created by danlan on 2017/6/28.
//  Copyright © 2017年 lxc. All rights reserved.
//

import UIKit

class PasswordAutoFill: UIViewController {
    
    @IBOutlet weak var accountField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapBg(_ sender: Any) {
        self.accountField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
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
