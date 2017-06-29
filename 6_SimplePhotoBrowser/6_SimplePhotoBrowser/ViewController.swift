//
//  ViewController.swift
//  6_SimplePhotoBrowser
//
//  Created by vara shen on 2017/6/28.
//  Copyright © 2017年 vara shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    var imageView:UIImageView!
    var scrollView:UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(frame: self.view.bounds)
        imageView.image = UIImage(named: "blue")
        imageView.isUserInteractionEnabled = true
        scrollView = UIScrollView(frame: self.view.frame)
        scrollView.maximumZoomScale = 4.0
        scrollView.minimumZoomScale = 1
        scrollView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        scrollView.contentSize = imageView.bounds.size
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // 在滚动视图中即将发生缩放时，请求代理视图进行缩放。
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }

}

