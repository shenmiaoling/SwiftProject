//
//  ViewController.swift
//  3DTransform
//
//  Created by vara shen on 2017/7/11.
//  Copyright © 2017年 vara shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerV: UIView!
    @IBOutlet weak var v1: UIView!
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var v3: UIView!
    @IBOutlet weak var v4: UIView!
    @IBOutlet weak var v5: UIView!
    @IBOutlet weak var v6: UIView!
    
    var angle = CGPoint.init(x:0,y:0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var trans = CATransform3DIdentity
        //m34:透视效果-d/500
        trans.m34 = 0
        
        var trans2 = CATransform3DTranslate(trans, 0, 0, 50)
        v1.layer.transform = trans2
        
        trans2 = CATransform3DTranslate(trans, 50, 0, 0)
        trans2 = CATransform3DRotate(trans2, CGFloat(Double.pi/2), 0, 1, 0)
        v2.layer.transform = trans2
        
        trans2 = CATransform3DTranslate(trans, 0, -50, 0)
        trans2 = CATransform3DRotate(trans2, CGFloat(Double.pi/2), 1, 0, 0)
        v3.layer.transform = trans2
        
        trans2 = CATransform3DTranslate(trans, 0, 50, 0)
        trans2 = CATransform3DRotate(trans2, CGFloat(-Double.pi/2), -1, 0, 0)
        v4.layer.transform = trans2
        
        trans2 = CATransform3DTranslate(trans, -50, 0, 0)
        trans2 = CATransform3DRotate(trans2, CGFloat(-Double.pi/2), 0, 1, 0)
        v5.layer.transform = trans2
        
        trans2 = CATransform3DTranslate(trans, 0, 0, -50)
        trans2 = CATransform3DRotate(trans2, CGFloat(Double.pi), 0, 1, 0)
        v6.layer.transform = trans2
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(_:)))
        containerV.addGestureRecognizer(pan)
    }
    func handlePan(_ sender:UIPanGestureRecognizer) {
        let p = sender.translation(in: containerV)
        let angle1 = angle.x+(p.x/30)
        let angle2 = angle.y-(p.y/30)
        
        var trans = CATransform3DIdentity
        trans.m34 = 0
        trans = CATransform3DRotate(trans, angle1 , 0, 1 , 0);
        trans = CATransform3DRotate(trans, angle2 , 1, 0 , 0);
        containerV.layer.sublayerTransform = trans
        
        print("拖动\(p)")
        if sender.state == .ended {
            angle.x = angle1
            angle.y = angle2
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

