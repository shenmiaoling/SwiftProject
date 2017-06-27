//
//  ViewController.swift
//  4_Limit Input Text
//
//  Created by vara shen on 2017/6/26.
//  Copyright © 2017年 vara shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextViewDelegate {
    var limitedTextView: UITextView!
    var allowInputNumberLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.initNavigationBar()
        self.initInputField()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChangeFrame(note:)),name: .UIKeyboardDidChangeFrame,object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func initNavigationBar() {
        let leftItem = UIBarButtonItem(title: "close", style: .plain, target: self, action: nil)
        navigationItem.leftBarButtonItem = leftItem
        let rightItem = UIBarButtonItem(title: "Tweet", style: .plain, target: self, action: nil)
        rightItem.tintColor = UIColor.green
        navigationItem.rightBarButtonItem = rightItem
        
    }
    
    func initInputField() {
        let naviFrame = self.navigationController?.navigationBar.frame
        let statusBarFrame = UIApplication.shared.statusBarFrame
        let avatarImgView = UIImageView(frame: CGRect(x: 0, y: (naviFrame?.height)! + statusBarFrame.height + 10, width: 70, height: 70))
        avatarImgView.image = #imageLiteral(resourceName: "avatar")
        self.view.addSubview(avatarImgView)
        
        limitedTextView = UITextView(frame: CGRect(x: 80, y: avatarImgView.frame.height, width: self.view.frame.width - 70 - 20, height: 300))
        self.view.addSubview(limitedTextView)
        limitedTextView.font = UIFont.systemFont(ofSize: 20)
        limitedTextView.delegate = self
        
        allowInputNumberLabel = UILabel(frame: CGRect(x: self.view.frame.width - 50, y: self.view.frame.height - 40, width: 50, height: 40))
        self.view.addSubview(allowInputNumberLabel)
        allowInputNumberLabel.text = "140"
        allowInputNumberLabel.textAlignment = .right
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let currentCharactorCount = (textView.text?.characters.count)!
        if currentCharactorCount >= 140 {
            limitedTextView.resignFirstResponder()
        }
        allowInputNumberLabel.text = "\(140 - currentCharactorCount)"
        
    }
    
    func keyboardWillChangeFrame(note: Notification){
        //获取动画弹出的动画时间
        let duration = note.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
         //获取键盘坐标及高度
        let endFrame = (note.userInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        //获取键盘 Y 坐标
        let y = endFrame.origin.y
        //计算工具栏距离底部的间距
        let margin = UIScreen.main.bounds.height - y

        UIView.animate(withDuration: duration) {
            //间距大于0，说明键盘弹起
            if margin > 0 {
                self.allowInputNumberLabel.frame.origin.y = self.allowInputNumberLabel.frame.origin.y - margin
            }
            //键盘收起
            else {
                self.allowInputNumberLabel
                .frame.origin.y = self.view.frame.height - 40
            }
        }
    }
    
}

