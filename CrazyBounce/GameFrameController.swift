//
//  ViewController.swift
//  CrazyBounce
//
//  Created by ShadowDreamer on 6/20/14.
//  Copyright (c) 2014 1-xing. All rights reserved.
//

import UIKit






class  GameFrameController: UIViewController{
    
    
    
    var gameFrameTimer:NSTimer?
    var ballList = [Ball]()
    let fps :Double = 60
    let createBallPerSecond :Double = 1.2
    var tempRandomTimer = 0
    var bestScore = 0
    var newBallPosition:CGPoint!
    var barOrigionalHeightScale:CGFloat=0.75
    var bar:UILabel!;
    var die=false
    
    let ballImageList: [String] = ["BlueBallImage", "OrangeBallImage","YellowBallImage"]
    
    
    @IBOutlet var scoreLable: UILabel
    @IBOutlet var bestScoreLable: UILabel
    
    @IBOutlet var gameOverView: UIView
    @IBOutlet var overScoreLable: UILabel
    @IBOutlet var overBestScoreLable: UILabel
    
    @IBAction func move(sender: UIPanGestureRecognizer) {
        if sender.state==UIGestureRecognizerState.Changed{
            var senderCenterX=sender.locationInView(self.view).x
            bar.center=CGPoint(x: senderCenterX, y: bar.center.y)
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject) {
        
        var gameOverController:GameOverController = segue.destinationViewController as GameOverController
        gameOverController.overCurrentScore=ballList.count
        gameOverController.overBestScore=bestScore
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        bar=UILabel(frame:CGRect(x: 0,y: 0,width: 130,height: 25));
        bar.center=CGPoint(x: self.view.frame.width/2, y: CGFloat(self.view.frame.height*barOrigionalHeightScale));
        bar.backgroundColor=UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        self.view.addSubview(bar);
        var backgroundImage = UIImage(named: "backGroundImage")
        self.view.backgroundColor = UIColor(patternImage: backgroundImage)
        bestScoreLable.text="Best:\(bestScore)"
        
        gameStart()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func gameStart(){
        gameFrameTimer=NSTimer.scheduledTimerWithTimeInterval(CDouble(1/fps), target: self, selector: "gameFrame", userInfo: nil, repeats: true);
        }
    
    
    func gameFrame(){
        if tempRandomTimer == 0 {
            var a=CGPoint(x: 22, y: 22)
            newBallPosition = CGPoint(x: CGFloat(arc4random()%300+10), y: 20)
            var newBall=Ball(center: newBallPosition,moveableFrame: self.view.frame,image: UIImage(named:ballImageList[Int(arc4random()%UInt32(ballImageList.count))]))
            ballList += newBall
            self.view.addSubview(ballList[ballList.count-1])
        }
        tempRandomTimer++
        if Double(tempRandomTimer) > Double(createBallPerSecond * fps) {
            tempRandomTimer=0
        }
        
        
        //Create new ball
        if !ballList.isEmpty{
            for i in ballList{
                i.move()
                if CGRectIntersectsRect(i.frame,bar.frame){
                    i.bounce()
                }
            }
        }
//        Move each ball

        if !ballList.isEmpty{
            var i=0
            while i<ballList.count{
                if !ballList[i].isLive(){
                    die=true
                }
                i++
            }
        }
        if die{
            gameFrameTimer?.invalidate()
            //gameFrameTimer=nil
            
          self.performSegueWithIdentifier("GameOverSegue", sender: self)
            
        
        }
        
        scoreLable.text="Score:\(ballList.count)"
        if ballList.count>bestScore{
            bestScore=ballList.count
            bestScoreLable.text="Best:\(bestScore)"
        }
    }
    
    func gameRestart(){
        for i in ballList{
            i.removeFromSuperview()
        }
        ballList.removeAll(keepCapacity: false)
        die = false
        gameFrameTimer = NSTimer.scheduledTimerWithTimeInterval(1/fps, target: self, selector: "gameFrame", userInfo: nil, repeats: true);
    }
}

