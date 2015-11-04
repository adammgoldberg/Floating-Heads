//
//  FloatingButton.swift
//  FloatingHeads
//
//  Created by Adam Goldberg on 2015-11-04.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func flatWhiteColor() -> UIColor { return UIColor(red: 0.9274, green: 0.9436, blue: 0.95, alpha: 1.0) }
    static func flatBlackColor() -> UIColor { return UIColor(red: 0.1674, green: 0.1674, blue: 0.1674, alpha: 1.0) }
    static func flatBlueColor() -> UIColor { return UIColor(red: 0.3132, green: 0.3974, blue: 0.6365, alpha: 1.0) }
    static func flatRedColor() -> UIColor {return UIColor(red: 0.9115, green: 0.2994, blue: 0.2335, alpha: 1.0) }
    
    
    func pixelImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(), self.CGColor)
        CGContextFillRect(UIGraphicsGetCurrentContext(), CGRect(x: 0, y: 0, width: 1.0, height: 1.0))
        let buttonImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return buttonImage
        
    }

    
        
    
}

class FloatingButton: UIButton {
    
    init(frame: CGRect, image : UIImage, backgroundColor: UIColor) {
        super.init(frame: frame)
        self.frame = frame
        self.imageView!.image = image
        self.backgroundColor = backgroundColor
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }



    
    
    func setup() {
        self.tintColor = UIColor.whiteColor()
        self.backgroundColor = UIColor.flatBlueColor()
        self.layer.cornerRadius = 21
        self.layer.masksToBounds = true
        setBackgroundImage(UIColor.flatBlackColor().pixelImage(), forState: UIControlState.Highlighted)
        
    
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    

  

    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
