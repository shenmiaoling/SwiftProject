//
//  DetailViewController.swift
//  25_CustomTransition
//
//  Created by vara shen on 2017/6/30.
//  Copyright © 2017年 vara shen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UINavigationControllerDelegate {
    
    var bannerImageView: UIImageView!
    var img: UIImage!
    
    let RothkoDesciption = "大卫·罗伯特·约瑟夫·贝克汉姆，OBE（英语：David Robert Joseph Beckham ，1975年5月2日－）[2][3]，已退役英格兰足球运动员、前英格兰足球代表队队长，该队守门员位置以外的上场纪录保持者[4]，1999年及2001年世界足球先生亚军[5]。世界足坛最佳英格兰巨星之一。"
    fileprivate var percentDrivenTransition: UIPercentDrivenInteractiveTransition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerImageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 400, height: 400))
        bannerImageView.center.x = self.view.center.x
        bannerImageView.contentMode = UIViewContentMode.scaleAspectFit
        self.view.addSubview(bannerImageView)
        
        let textView = UITextView(frame: CGRect(x: 0, y: 300, width: self.view.frame.width, height: self.view.frame.height - 500))
        textView.text = RothkoDesciption
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.backgroundColor = UIColor.black
        textView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.view.addSubview(textView)
        
        self.navigationController?.delegate = self
        
        //手势监听器
        let edgePanGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(edgePanGestrueAction(_:)))
        edgePanGesture.edges = UIRectEdge.left
        self.view.addGestureRecognizer(edgePanGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == UINavigationControllerOperation.pop {
            return CustomPopTransition()
        }else {
            return nil
        }
    }
    
    func edgePanGestrueAction(_ edgPan:UIScreenEdgePanGestureRecognizer){
        let  progress = edgPan.translation(in: self.view).x / self.view.bounds.width
        
        if edgPan.state == UIGestureRecognizerState.began {
            self.percentDrivenTransition = UIPercentDrivenInteractiveTransition()
            self.navigationController?.popViewController(animated: true)
        }else if edgPan.state == UIGestureRecognizerState.changed {
            self.percentDrivenTransition?.update(progress)
        }else if edgPan.state == UIGestureRecognizerState.cancelled || edgPan.state == UIGestureRecognizerState.ended {
            if progress > 0.5 {
                self.percentDrivenTransition?.finish()
            }else {
                self.percentDrivenTransition?.cancel()
            }
            self.percentDrivenTransition = nil
        }
        
    }
}
