//
//  ViewController.swift
//  10_StretchyHeader
//
//  Created by vara shen on 2017/6/29.
//  Copyright © 2017年 vara shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    private let cellHeight: CGFloat = 66
    var table:UITableView!
    var bannerImageView:UIImageView!
    let lyric = "when i was young,i'd listen to the radio, waiting for my favorite songs,when they played i'd sing along,it make me smile"
    private var dataSource:Array<String>!
    override func viewDidLoad() {
        super.viewDidLoad()
        table = UITableView()
        table.frame = CGRect(x: 0, y: self.view.frame.width + 10, width: self.view.frame.width, height: self.view.frame.height - 10 - self.view.frame.width)
        self.view.addSubview(table)
        
        table.delegate = self
        table.dataSource = self
        bannerImageView = UIImageView(image: #imageLiteral(resourceName: "banner"))
        bannerImageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width)
        self.view.addSubview(bannerImageView)
        
        self.dataSource = lyric.characters.split(separator: ",").map(String.init)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
        //返回table视觉区域内的cell的行数
        let cells = table.visibleCells
        let tableHeight:CGFloat = table.bounds.height
        
        for (index, cell) in cells.enumerated() {
            cell.frame.origin.y = tableHeight
            UIView.animate(withDuration: 1.0, delay: 0.04 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {cell.frame.origin.y = 0}, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let cell = UITableViewCell(style: .default,reuseIdentifier:"cell")
        cell.textLabel?.text = self.dataSource[indexPath.row]
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let maxOffsetY = table.frame.height
        let validateOffsetY = -offsetY/maxOffsetY
        let scaleFactor = 1 + validateOffsetY
        bannerImageView.transform = CGAffineTransform(scaleX: scaleFactor,y: scaleFactor)
    }
}

