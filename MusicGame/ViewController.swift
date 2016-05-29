//
//  ViewController.swift
//  MusicGame
//
//  Created by 早見　大地 on 2015/09/20.
//  Copyright (c) 2015年 早見　大地. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //timerを表示させるLabel
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var hanteiLabel: UILabel!
    @IBOutlet var batButton :UIButton!
    @IBOutlet var sensyu: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var resetoButton: UIButton!
    //バッターの画像を表示するImageView
    @IBOutlet var batarImageView: UIImageView!
    
    var count: Float = 0.0
    var timer: NSTimer = NSTimer()
    
    var speed: Float = 0.0
    //
    var label: UILabel!
    var ballImageView: UIImageView!
    
    @IBOutlet var strikeLabel: UILabel!
    @IBOutlet var ballLabel: UILabel!
    @IBOutlet var outLabel: UILabel!
    
    var strikeNumber: Int!
    var ballNumber: Int!
    var outNumber: Int!
    var baseballman :  Int = 0
    var number: Float = 10.0
    var mode:Int!
    var audio:AVPlayer!
    
    var homerun: Bool!
    var twobasehit: Bool!
    var hit: Bool!
    var fall: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        strikeNumber = 0
        ballNumber = 0
        outNumber = 0
        
        strikeLabel.text = ""
        ballLabel.text = ""
        outLabel.text = ""
        
    }
    
    @IBAction func reset() {
        
    }

    
    @IBAction func start() {
        
        if !timer.valid {
        }
        
        
        
            ballImageView = UIImageView(frame: CGRectMake(-50, -50, 50, 50))
            let ballImage = UIImage(named: "1335779391.png")
            ballImageView.image = ballImage
            ballImageView.backgroundColor = UIColor.clearColor()
            
            let angle:CGFloat = CGFloat((30.0 * M_PI) / 180.0)
            batButton.transform = CGAffineTransformMakeRotation(angle)
            
            
            self.view.addSubview(ballImageView)
            
            
            var appframe: CGRect = UIScreen.mainScreen().applicationFrame
            speed = Float(appframe.size.height) / 1.2
            
            //音楽フアイルの指定
            let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("baseBGM",ofType: "mp3")!)
            //再生の準備
            audio = AVPlayer(URL: audioPath)
            //音楽を再生
            audio.play()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01,
                target: self,
                selector: Selector("up"),
                userInfo: nil,
                repeats: true            )
            startButton.alpha = 0.0
        }
    
    
    
    
    func up() {
        count = count + 0.01
        timeLabel.text = String(format:"%.2f" , count)
        
        if 10.0 - 1.2 <= count {
            
            var y:Float = (count - 10.0 + 1.2) * speed - 75
            ballImageView.frame = CGRectMake(135, CGFloat(y), 50, 50)
            
        }
        
        //        print(speed)
        
    }
    
    func hantei(number: Float) -> String {
        
        if count > number - 0.10 && count < number + 0.10 {
            //もし経過時間が9.9秒〜10.1秒だったら
            homerun = true
            twobasehit = false
            hit = false
            fall = false
            
            return "ホームラン"                                      //ヒットと表示
        } else if count > number - 0.20 && count < number + 0.20 {
            //もし経過時間が9.8秒〜10.2秒だったら
            homerun = false
            twobasehit = true
            hit = false
            fall = false
            
            return "ツーベースヒット"                                       //ホームランと表示
        } else if count > number - 0.30 && count < number + 0.30 {
            //もし経過時間が9.5秒〜10.5秒だったら
            homerun = false
            twobasehit = false
            hit = true
            fall = false
            
            return "ヒット"//ツーベースヒットと表示
        } else if count > number - 0.40 && count < number + 0.40{
            
            //もし経過時間が9.0秒〜11.0秒だったら
            homerun = false
            twobasehit = false
            hit = false
            fall = true
            
            strikeNumber = strikeNumber + 1
            if strikeNumber == 1 {
                strikeLabel.text = "⚫︎"
            }else if strikeNumber == 2 {
                strikeLabel.text = "⚫︎⚫︎"
                
            }else if strikeNumber == 3 {
                strikeNumber = 2
                strikeLabel.text = ""
            }
            
            if outNumber == 0 {
                outLabel.text = ""
            }else if outNumber == 1 {
                outLabel.text = "⚫︎"
            }else if outNumber == 2 {
                outLabel.text = "⚫︎⚫︎"
                
            }else if outNumber == 3 {
                outLabel.text = "⚫︎⚫︎⚫︎"
            }
            
            return "フアール"//フアールと表示
            
        }else{
            //もしそれ以外だったら
            hanteiLabel.text = "⚫︎⚫︎"
            return "ストライク"
        }
    }
//    
//        if strikeNumber　== "⚫︎"{
//            strikeLabel.backnumber color = UIColor.yellowColor()
//    
//         
//        
//        
//    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func modoru(){
        count = 0
    }
    func jidoudemodoru(){
        if count == 15{
            count = 0
            
        }
        if count == 0{
            sensyu.text = "早見大地"
        }
    }
    
    
    @IBAction func pushButton() {
        hanteiLabel.text = self.hantei(10.0)
        let angle:CGFloat = CGFloat((-30.0 * M_PI) / 180.0)
    
        // アニメーションの秒数を設定
        UIView.animateWithDuration(0.3,
            
            animations: { () -> Void in
                
                // 回転用のアフィン行列を生成.
                self.batButton.transform = CGAffineTransformMakeRotation(angle)
            },
            completion: { (Bool) -> Void in
                
                self.batButton.transform = CGAffineTransformMakeRotation(-angle)
                
        })
    }
    
    
}

