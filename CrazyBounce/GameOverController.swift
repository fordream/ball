//
//  GameMenuController.swift
//  CrazyBounce
//
//  Created by ShadowDreamer on 6/29/14.
//  Copyright (c) 2014 1-xing. All rights reserved.
//

import UIKit

class GameOverController: UIViewController{
    
    @IBOutlet var overCurrentScoreLable: UILabel
    
    @IBOutlet var overBestScoreLable: UILabel
    
    var overCurrentScore:Int!
    var overBestScore:Int!
    
    
//    @IBAction func pushShareButton(sender: AnyObject) {
//        
//        var vc:UIActivityViewController!
//        var vcList: [String] = ["CrazyBounce"]
//        vc=UIActivityViewController(activityItems: vcList, applicationActivities: nil)
//        self.presentViewController(vc, animated: true, completion: nil)
//        
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var backgroundImage = UIImage(named: "backGroundImage")
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        overBestScoreLable.text="BEST:\(overBestScore)"
        overCurrentScoreLable.text="\(overCurrentScore)"
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject) {
        
        var gameFrameController:GameFrameController = segue.destinationViewController as GameFrameController
        gameFrameController.bestScore=overBestScore
        
    }
    
    
}
