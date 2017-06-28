//
//  DemoListController.swift
//  iOS11Demo
//
//  Created by danlan on 2017/6/22.
//  Copyright © 2017年 lxc. All rights reserved.
//

import UIKit

/*
 
 http://chariotsolutions.com/blog/post/implementing-drag-drop-ios-11/
 
 http://www.jianshu.com/p/1167d2ecd0ac
 
 
 */
class DemoListController: UITableViewController {
    
    let datas = [
        ("Drag and Drop", "dad"),
        ("UI Refinements", "largesearch"),
        ("Advanced Animation", "animation"),
        ("Round Corner", "corner"),
        ("Password Auto-fill", "autofill"),
        ("Core ML", "cml"),
        ("New Camera", "")
    ]
    
    var mutatingDatas = [(String, String)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clearsSelectionOnViewWillAppear = false
        
        let rightBtnItem = UIBarButtonItem.init(title: "Reset", style: .plain, target: self, action: #selector(resetList)
        )
        self.navigationItem.rightBarButtonItem = rightBtnItem
        
        self.mutatingDatas = Array(self.datas)
        // By default, this will return YES on iPad and NO on iPhone
        if #available(iOS 11.0, *) {
            self.tableView.dragInteractionEnabled = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.mutatingDatas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let (title, _) = self.mutatingDatas[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "democell", for: indexPath)
        cell.textLabel?.text = title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //self.mutatingDatas.remove(at: indexPath.row)
            //tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            
        }
    }
    
    // MARK: - iOS11 之前的方法，定义action
    /*override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "delete") { (action, indexPath) in
            self.mutatingDatas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        let customAction = UITableViewRowAction(style: .normal, title: "custom") { (action, indexPath) in
            
        }
        return [deleteAction, customAction];
    }*/
    
    @available(iOS 11.0, *)
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let leftAction = UIContextualAction(style: .normal, title: "leading") { (action, view, finished) in
            finished(true)
        }
        
        // can modify
        leftAction.title = "leading action"
        leftAction.backgroundColor = UIColor.black
        //leftAction.image =
        
        return UISwipeActionsConfiguration(actions: [leftAction])
    }
    
    @available(iOS 11.0, *)
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "delete") { (action, view, finished) in
            
            self.mutatingDatas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            // must be called！
            finished(true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let (_, identifierId) = self.mutatingDatas[indexPath.row]
        
        let controller =
            UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: identifierId)
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    // Override to support rearranging the table view.
    /*
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
    */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK - click event
    func resetList() {
        self.mutatingDatas = Array(self.datas)
        self.tableView.reloadData()
    }
}

