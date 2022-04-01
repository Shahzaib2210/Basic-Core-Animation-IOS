//
//  ViewController.swift
//  Core Animation
//
//  Created by Shahzaib Mumtaz on 17/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let view1 = UIView()
    let view2 = UIView()
    
    var pause = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view1.backgroundColor = UIColor.blue
        view.addSubview(view1)
        
        view2.backgroundColor = UIColor.systemGreen
        view.addSubview(view2)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        view1.addGestureRecognizer(tap)
        
        let tapped = UITapGestureRecognizer(target: self, action: #selector(self.handleTapped(_:)))
        view.addGestureRecognizer(tapped)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view1.frame = CGRect(x: 0, y: 40, width: 180, height: 50)
        view2.frame = CGRect(x: 0, y: 150, width: 200, height: 150)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        
        if !pause {
            UIView.animate(withDuration: 8.0, animations: {
                self.view2.frame = CGRect(x: 180, y: 150, width: 200, height: 150)
            }, completion: { done in
                if done {
                    self.view2.frame = CGRect(x: 0, y: 150, width: 200, height: 150)
                }
            })
        } else {
            
            let pausedTime: CFTimeInterval = self.view2.layer.duration
            let timeSincePause: CFTimeInterval = view2.layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
            view2.layer.beginTime = timeSincePause
        }
    }
    
    @objc func handleTapped(_ sender: UITapGestureRecognizer? = nil) {
        let cgpoint = sender?.location(in: view)
        view2.frame = CGRect(x: cgpoint!.x, y: cgpoint!.y, width: 200, height: 150)
    }
}

