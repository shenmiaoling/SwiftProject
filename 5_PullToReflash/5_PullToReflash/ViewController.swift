//
//  ViewController.swift
//  5_PullToReflash
//
//  Created by vara shen on 2017/6/26.
//  Copyright © 2017年 vara shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var dataSource = Array<Date>()
    let refresh = UIRefreshControl()
    var table : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        table = UITableView(frame: self.view.bounds)
        table.frame.origin.y = 44
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        addNewElementToArray()
        refresh.attributedTitle = NSAttributedString(string:"加载中。。。")
        refresh.addTarget(self, action: #selector(pullTheRefresh), for: UIControlEvents.valueChanged)
        table.addSubview(refresh)
        table.reloadData()
    }
    
    func addNewElementToArray() {
        dataSource.insert(NSDate() as Date, at: 0)
    }
    func pullTheRefresh() {
        addNewElementToArray()
        table.reloadData()
        refresh.endRefreshing()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:.default,reuseIdentifier: "reuseCellForPullToRefresh")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年mm月dd日hh时mm分ss秒"
        let  dateStr = dateFormatter.string(from:dataSource[indexPath.row])
        cell.textLabel?.text = dateStr
        return cell
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.dataSource.remove(at: indexPath.row)
            self.table.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            self.table.reloadData()
        }
        
        let share = UITableViewRowAction(style: .normal, title: "Disable") { (action, indexPath) in
            print("tapped disable!")
        }
        
        share.backgroundColor = UIColor.blue
        
        return [delete, share]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

