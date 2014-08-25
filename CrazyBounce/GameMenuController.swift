//
//  GameMenuController.swift
//  CrazyBounce
//
//  Created by ShadowDreamer on 6/29/14.
//  Copyright (c) 2014 1-xing. All rights reserved.
//

import UIKit

class GameMenuController: UIViewController{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var backgroundImage = UIImage(named: "backGroundImage")
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}