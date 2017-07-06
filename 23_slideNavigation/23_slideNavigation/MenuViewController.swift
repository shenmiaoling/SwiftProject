//
//  MenuViewController.swift
//  23_slideNavigation
//
//  Created by vara shen on 2017/7/4.
//  Copyright © 2017年 vara shen. All rights reserved.
//

import UIKit

class MenuViewController: SWRevealViewController,UITableViewDelegate,UITableViewDataSource {
    var dataSource : Array<String>!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        dataSource = ["AnimatedDetail","Slot Machine","Limited Input"]
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let table = UITableView(frame: self.view.frame)
        table.contentInset = UIEdgeInsets(top: 50,left: 0,bottom: 0,right: 0)
        table.delegate = self
        table.dataSource = self
        self.view.addSubview(table)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier:"reuseableMenuViewControllerTableViewCell")
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var newViewController: UIViewController!
        switch indexPath.row {
        case 0:
            newViewController = ViewController()
        case 1:
            newViewController = SecondViewController()
        default:
            newViewController = ThirdViewController()
        }
        
        let navigationController = UINavigationController(rootViewController: newViewController)
        self.revealViewController().pushFrontViewController(navigationController, animated: true )
    }
}
