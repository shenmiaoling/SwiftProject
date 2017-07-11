//
//  ViewController.swift
//  movePenguin
//
//  Created by vara shen on 2017/7/8.
//  Copyright © 2017年 vara shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var penguin: UIImageView!
    @IBOutlet weak var slideButton: UIButton!
    
    var isLookingRight: Bool = true {
        didSet {
            let xScale: CGFloat = isLookingRight ? 1 : -1
            penguin.transform = CGAffineTransform(scaleX: xScale, y: 1)
            slideButton.transform = penguin.transform
        }
    }
    var penguinY: CGFloat!
    
    var walkSize: CGSize!
    var slideSize: CGSize!
    
    var animationDuration = 1.0
    
    var walkFrames = [
        UIImage(named: "walk01.png")!,
        UIImage(named: "walk02.png")!,
        UIImage(named: "walk04.png")!
    ]
    
    var slideFrames = [
        UIImage(named: "slide01.png")!,
        UIImage(named: "slide02.png")!,
        UIImage(named: "slide01.png")!
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        walkSize = walkFrames[0].size
        slideSize = slideFrames[0].size
        
        penguinY = penguin.frame.origin.y
        loadWalkAnimation()
    }
    
    func loadWalkAnimation() {
        penguin.animationImages = walkFrames
        penguin.animationDuration = animationDuration / 3
        penguin.animationRepeatCount = 3
    }
    func loadSlideAnimation() {
        penguin.animationImages = slideFrames
        penguin.animationDuration = animationDuration
        penguin.animationRepeatCount = 1
    }
    @IBAction func actionLeft(_ sender: Any) {
        penguin.startAnimating()
        isLookingRight = false
        penguin.startAnimating()
        
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: .curveEaseOut, animations: {
            self.penguin.center.x -= self.walkSize.width
        },completion: nil)
    }
    @IBAction func actionRight(_ sender: Any) {
        isLookingRight = true
        penguin.startAnimating()
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: .curveEaseOut, animations: {self.penguin.center.x += self.walkSize.width}, completion: nil)
    }
    @IBAction func actionSlide(_ sender: Any) {
        loadSlideAnimation()
        penguin.frame = CGRect(
            x: penguin.frame.origin.x,
            y: penguinY + (walkSize.height - slideSize.height),
            width: slideSize.width,
            height: slideSize.height)
        
        penguin.startAnimating()
        UIView.animate(withDuration: animationDuration - 0.02, delay: 0.0, options: .curveEaseOut, animations: {
            self.penguin.center.x += self.isLookingRight ? self.slideSize.width : -self.slideSize.width
        }, completion: {_ in self.penguin.frame = CGRect(
            x: self.penguin.frame.origin.x,
            y: self.penguinY,
            width: self.walkSize.width,
            height: self.walkSize.height)
            self.loadWalkAnimation()
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

