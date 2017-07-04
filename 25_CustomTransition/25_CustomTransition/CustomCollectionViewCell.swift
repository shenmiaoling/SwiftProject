//
//  CustomCollectionViewCell.swift
//  25_CustomTransition
//
//  Created by vara shen on 2017/6/30.
//  Copyright © 2017年 vara shen. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    var imageView:UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configCell(model: CustomCollectionViewCellModel){
        imageView = UIImageView(frame: self.bounds)
        imageView.image = model.image
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        self.addSubview(imageView)
    }
}
