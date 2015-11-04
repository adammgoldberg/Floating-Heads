//
//  ViewController.swift
//  FloatingHeads
//
//  Created by Adam Goldberg on 2015-11-04.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var floatingButton: FloatingButton!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showBlur" {
            let fmvc = segue.destinationViewController as! FloatingMenuControllerViewController
            fmvc.fromView = self.floatingButton
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

