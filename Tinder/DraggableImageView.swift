//
//  DraggableImageView.swift
//  Tinder
//
//  Created by Arthur Burgin on 4/26/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet var draggableImageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews(){
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        
        nib.instantiate(withOwner: self, options: nil)
        
        contentView.frame = bounds
        
        addSubview(contentView)
        
        
    }
    
    var image: UIImage{
        get{
            return draggableImageView.image!
        }
        set{
            draggableImageView.image = newValue
        }
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
