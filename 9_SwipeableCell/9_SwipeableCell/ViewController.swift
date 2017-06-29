//
//  ViewController.swift
//  9_SwipeableCell
//
//  Created by vara shen on 2017/6/28.
//  Copyright © 2017年 vara shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let cellHeight:CGFloat = 66
    let colorRatio:CGFloat = 10
    var actionController:UIAlertController!
    var table:UITableView!
    let lyric = "when i was young i'd listen to the radio,waiting for my favorite songs,when they played i'd sing along,it make me smile,those were sunch happy times and not so long ago,how i wondered where they'd gone,but they're back again just like a long lost friend,all the songs i love so well,every shalala every wo'wo,still shines,every shing-a-ling-a-ling"
    var dataSource:Array<String>!
    override func viewDidLoad() {
        super.viewDidLoad()
        table = UITableView(frame: self.view.frame)
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        self.dataSource = lyric.characters.split(separator: ",").map(String.init)
        actionController = UIAlertController(title:"",message:"",preferredStyle: .alert)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
        let cells = table.visibleCells
        let tableHeight: CGFloat = table.bounds.size.height
        //给每个表格增加物理弹簧动画效果
        for(index,cell) in cells.enumerated() {
            cell.frame.origin.y = tableHeight
        //  usingSpringWithDamping：弹簧动画的阻尼值，也就是相当于摩擦力的大小，该属性的值从0.0到1.0之间，越靠近0，阻尼越小，弹动的幅度越大，反之阻尼越大，弹动的幅度越小，如果大道一定程度，会出现弹不动的情况
        // initialSpringVelocity：弹簧动画的速率，或者说是动力。值越小弹簧的动力越小，弹簧拉伸的幅度越小，反之动力越大，弹簧拉伸的幅度越大。这里需要注意的是，如果设置为0，表示忽略该属性，由动画持续时间和阻尼计算动画的效果。
            UIView.animate(withDuration: 1.0, delay: 0.04 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: { cell.frame.origin.y = 0 }, completion: nil)
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier:"animationInTableViewCell")
        
        cell.textLabel?.text = self.dataSource[indexPath.row]
        cell.textLabel?.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width,height: self.cellHeight))
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bgView.frame

        let lowerColor:CGColor = UIColor(red:(CGFloat(indexPath.row * 2) * self.colorRatio)/255.0, green: 20/255.0,blue:(CGFloat(indexPath.row * 2) * self.colorRatio)/255.0,alpha:1).cgColor
        let upperColor:CGColor = UIColor(red:(CGFloat(indexPath.row * 2) * self.colorRatio + self.colorRatio)/255.0, green: 20/255.0,blue:(CGFloat(indexPath.row * 2) * self.colorRatio)/255.0,alpha:1).cgColor
        
        gradientLayer.colors = [lowerColor,upperColor]
        bgView.layer.addSublayer(gradientLayer)
        cell.addSubview(bgView)
        //  此方法将指定的视图移动到子视图属性中视图数组的开头,即移动到文字cell的后面，否则 cell 的内容将被遮挡住
        cell.sendSubview(toBack: bgView)
        // 设置表格单元可编辑
        cell.isUserInteractionEnabled = true
        return cell
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let likeAction = UITableViewRowAction(style: .normal,title:"👍") {
            action, index in
            self.actionController.title = "Tips"
            self.actionController.message = "Thanks for your Love😃"
            self.showAlertController()
        }
        likeAction.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let dislikeAction = UITableViewRowAction(style: .normal,title:"👎") {
            action, index in
            self.actionController.message = "Tell me why? 😵"
            self.showAlertController()
        }
        dislikeAction.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        let unknowAction = UITableViewRowAction(style: .normal,title:"🖖") {
            action, index in
            self.actionController.message = "What do you mean? 🤔"
            self.showAlertController()
        }
        unknowAction.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return [likeAction,dislikeAction,unknowAction]
    }
    
    func showAlertController() {
        present(self.actionController,animated: true,completion: {
            //设置一个定时器，即在规定时间后执行 block 的方法
            let dismissTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: {(timer) in self.actionController.dismiss(animated: true, completion: nil)})
            RunLoop.main.add(dismissTimer, forMode: .commonModes)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

