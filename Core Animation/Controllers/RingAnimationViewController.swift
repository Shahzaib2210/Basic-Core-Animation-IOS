//
//  RingAnimationViewController.swift
//  Core Animation
//
//  Created by Shahzaib Mumtaz on 21/02/2022.
//

import UIKit

class RingAnimationViewController: UIViewController {
    
    let shape = CAShapeLayer()
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "Calories"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 36, weight: .light)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.sizeToFit()
        view.addSubview(label)
        label.center = view.center
        
        let circlePath = UIBezierPath(arcCenter: view.center,
                                      radius: 150,
                                      startAngle: -(.pi / 2),
                                      endAngle: .pi * 2,
                                      clockwise: true)
        
        let trackShape = CAShapeLayer()
        trackShape.path = circlePath.cgPath
        trackShape.lineWidth = 15
        if #available(iOS 13.0, *) {
            trackShape.strokeColor = UIColor.systemGray3.cgColor
        } else {
            // Fallback on earlier versions
        }
        trackShape.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(trackShape)
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 15
        shape.strokeColor = UIColor.red.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        view.layer.addSublayer(shape)
        
        let button = UIButton(frame: CGRect(x: 20, y: view.frame.size.height - 70, width: view.frame.size.width - 40, height: 50))
        button.setTitle("Animate", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(AnimateTapped), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func AnimateTapped() {
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 30
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
    }
}
