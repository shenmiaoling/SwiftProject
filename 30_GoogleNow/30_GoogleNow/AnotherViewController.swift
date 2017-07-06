//
//  AnotherViewController.swift
//  30_GoogleNow
//
//  Created by vara shen on 2017/7/5.
//  Copyright © 2017年 vara shen. All rights reserved.
//

import UIKit

class AnotherViewController: UIViewController {

    @IBOutlet weak var speakingButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        speakingButton.layer.cornerRadius = speakingButton.frame.width/2
    }

    @IBAction func goback(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func closeView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
