//
//  Ball.swift
//  CrazyBounce
//
//  Created by ShadowDreamer on 6/20/14.
//  Copyright (c) 2014 1-xing. All rights reserved.
//

import UIKit



class Ball: UIView {

    var speed:CGVector!
    
    var ball:UIImageView!
    var moveableFrame:CGRect!
    var live:Bool!
    init(center:CGPoint,moveableFrame:CGRect,image:UIImage) {
        super.init(frame: CGRect())
        self.center=center
        self.moveableFrame=moveableFrame
        live=true

        speed = CGVectorMake(CGFloat(arc4random()%7) , 5)
        ball=UIImageView(image: image)
        self.frame.size=CGSize(width: 20, height: 20)
        self.addSubview(ball)
        

    }
    
    func move(){
        self.frame=CGRect(origin: CGPoint(x: self.frame.origin.x+speed.dx,y: self.frame.origin.y+speed.dy), size: self.frame.size)
        if self.center.y>moveableFrame.size.height{
            live=false
        }else {
            if (self.center.x<moveableFrame.origin.x)||(self.center.x>moveableFrame.size.width){
                speed = CGVectorMake(-speed.dx, speed.dy)
            }
            if self.center.y<moveableFrame.origin.y{
                speed = CGVectorMake(speed.dx, -speed.dy)
            }
        }
    }
    func isLive()->Bool{
        return live
        }
    
    func bounce(){
        speed = CGVectorMake(speed.dx, -abs(speed.dy))
    }
}