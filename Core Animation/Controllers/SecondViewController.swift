//
//  SecondViewController.swift
//  Core Animation
//
//  Created by Shahzaib Mumtaz on 17/02/2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var viewDrag: UIView!
    
    var panGesture = UIPanGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(SecondViewController.draggedView(_:)))
        viewDrag.isUserInteractionEnabled = true
        viewDrag.addGestureRecognizer(panGesture)
    }
    
    @objc func draggedView(_ sender:UIPanGestureRecognizer){
        self.view.bringSubviewToFront(viewDrag)
        let translation = sender.translation(in: self.view)
        viewDrag.center = CGPoint(x: viewDrag.center.x + translation.x, y: viewDrag.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
    }
    
}
