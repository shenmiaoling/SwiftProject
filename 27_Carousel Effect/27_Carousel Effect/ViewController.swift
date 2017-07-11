//
//  ViewController.swift
//  27_Carousel Effect
//
//  Created by vara shen on 2017/7/6.
//  Copyright © 2017年 vara shen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var collectionView : UICollectionView!
    var dataSource : Array<CustomCollectionViewCellModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bgView = UIView(frame: self.view.bounds)
        let bgImageView = UIImageView(frame: self.view.bounds)
        bgImageView.image = #imageLiteral(resourceName: "bg")
        bgView.addSubview(bgImageView)
        
        let blurEffect: UIBlurEffect = UIBlurEffect(style: .light)
        let blurView: UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        bgView.addSubview(blurView)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: self.view.frame,collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.backgroundView = bgView
        collectionView.delegate = self
        
        collectionView.register(CustomCollectionView.self, forCellWithReuseIdentifier: "cell")
        
        self.view.addSubview(collectionView)
        
        let model1 = CustomCollectionViewCellModel()
        model1.image = #imageLiteral(resourceName: "Photo1")
        
        let model2 = CustomCollectionViewCellModel()
        model2.image = #imageLiteral(resourceName: "Photo2")
        
        let model3 = CustomCollectionViewCellModel()
        model3.image = #imageLiteral(resourceName: "Photo3")
        
        let model4 = CustomCollectionViewCellModel()
        model4.image = #imageLiteral(resourceName: "Photo4")
        
        let model5 = CustomCollectionViewCellModel()
        model5.image = #imageLiteral(resourceName: "Photo5")
        
        dataSource = Array(arrayLiteral: model1,model2,model3,model4,model5)
        
        //for segment View
        let segmentView = UISegmentedControl(items:["FlowLayout","CustomLayout"])
        let titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white as AnyObject]
        segmentView.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.black as AnyObject], for: UIControlState.selected)
        segmentView.tintColor = UIColor.white
        segmentView.isMomentary = false
        segmentView.frame = CGRect(x:10,y:50,width:(self.view.frame.width)-20,height:segmentView.bounds.height)
        segmentView.selectedSegmentIndex = 0
        segmentView.addTarget(self, action: #selector(action_segmentValueChanged(sender:)), for: UIControlEvents.valueChanged)
        self.view.addSubview(segmentView)
    }
    
    func action_segmentValueChanged(sender: UISegmentedControl) {
        let layout = sender.selectedSegmentIndex == 0 ? UICollectionViewFlowLayout() : CustomCollectionViewLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

