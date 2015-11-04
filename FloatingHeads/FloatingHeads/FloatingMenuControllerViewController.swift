//
//  FloatingMenuControllerViewController.swift
//  FloatingHeads
//
//  Created by Adam Goldberg on 2015-11-04.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

import UIKit

enum Direction : String {
    case Up
    case Left
}


protocol FloatingMenuDelegate {
 
    func floatingMenuViewController(viewController: FloatingMenuControllerViewController, index: Int)
    
}

class FloatingMenuControllerViewController: UIViewController {

    var buttonDirection : Direction = .Up
    
    var fromView : UIView!
    
    var delegate : FloatingMenuDelegate?
    
    var spacing : CGFloat = 20.0
    
    let width : CGFloat = 42.0
    
    let height : CGFloat = 42.0
    
    var buttonItems = [FloatingButton]()
    
    var buttonInfo : CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
//        let blurredView = UIVisualEffectView(effect: blurEffect)
//        blurredView.frame = self.view.bounds
//        
//        self.view.addSubview(blurredView)
        

        let buttonPosition = CGRectMake(CGRectGetMaxX(view.bounds) - width - spacing, CGRectGetMaxY(view.bounds) - height - spacing, width, height)
        
        buttonInfo = buttonPosition

        
        let closeButton = FloatingButton(frame: buttonPosition, image: UIImage(named: "icon-close")!, backgroundColor: UIColor.flatRedColor())
        
        closeButton.tag = 0
        
        self.view.addSubview(closeButton)
        
        closeButton.addTarget(self, action: "dismissBlur:", forControlEvents: UIControlEvents.TouchUpInside)
        
        createButtons()
        
        for aButton in buttonItems {
            self.view.addSubview(aButton)
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func createButtons() {
        var counter = 2
        let modelImages = ["model-4", "model-5", "model-6", "model-7", "model-8"]

        for modelString in modelImages {
            let modelImage = UIImage(named: modelString)

            
            let yPosition : CGFloat = self.height + self.spacing
            let yMultiplied = (Int(yPosition)  * Int(counter))
            var newPosition = self.buttonInfo
            newPosition.origin.y -= CGFloat(yMultiplied)
            
            let aFloatingButton = FloatingButton(frame: newPosition, image: modelImage!, backgroundColor: UIColor.whiteColor())
            aFloatingButton.tag = counter
            aFloatingButton.addTarget(self, action: "dismissBlur:", forControlEvents: .TouchUpInside)
            counter += 1
            


            buttonItems.append(aFloatingButton)
        }
        
        print(buttonItems)
    }
    
    
    func dismissBlur(sender: FloatingButton) {
        self.delegate?.floatingMenuViewController(self, index: sender.tag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
