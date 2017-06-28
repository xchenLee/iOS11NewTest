//
//  DragAndDrop.swift
//  iOS11Demo
//
//  Created by danlan on 2017/6/28.
//  Copyright © 2017年 lxc. All rights reserved.
//

import UIKit

class DragAndDrop: UIViewController, UIDragInteractionDelegate, UIDropInteractionDelegate {
    
    
    func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        
        let image = UIImage(named: "wwdc17")
        let provider = NSItemProvider(object: image!)
        let item = UIDragItem(itemProvider: provider)
        item.localObject = image!
        return [item]
    }
    

    @IBOutlet weak var dragview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.largeTitleDisplayMode = .automatic
        
        let drag = UIDragInteraction(delegate: self)
        self.dragview.addInteraction(drag)
        
        let drop = UIDropInteraction(delegate: self)
        self.dragview.addInteraction(drop)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}












