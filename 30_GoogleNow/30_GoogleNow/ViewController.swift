//
//  ViewController.swift
//  30_GoogleNow
//
//  Created by vara shen on 2017/7/5.
//  Copyright © 2017年 vara shen. All rights reserved.
//

import UIKit
import BubbleTransition
class ViewController: UIViewController,UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var speakButton: UIButton!


    let transition = BubbleTransition()
    var triggerButton: UIButton!

    @IBAction func speakTransition(_ sender: Any) {
        let anotherVC = AnotherViewController()
        anotherVC.transitioningDelegate = self
        anotherVC.modalPresentationStyle = .custom
        self.navigationController?.present(anotherVC, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        speakButton.layer.cornerRadius = speakButton.frame.width / 2
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .custom
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = speakButton.center
        transition.bubbleColor = speakButton.backgroundColor!
        transition.duration = 0.4
        return transition
    }
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = speakButton.center
        transition.bubbleColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        transition.duration = 0.4
        return transition
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

