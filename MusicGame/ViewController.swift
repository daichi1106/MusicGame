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
    @IBOutlet var baseImageView: UIImageView!
    //バッターの画像を表示するImageView
    var baterImage: UIImage!
    @IBOutlet var baterImageView: UIImageView!
    
    var count: Float = 0.0
    var timer: Timer = Timer()
    
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
        
        baterImageView.image = baterImage
        
    }
    
    @IBAction func reset() {
        
        
    }
    
    
    @IBAction func start() {
        
        if !timer.isValid {
        }
        
        
        
        ballImageView = UIImageView(frame: CGRect(x: 0,y: 0,width: 0,height: 0))
        let ballImage = UIImage(named: "1335779391.png")
        ballImageView.image = ballImage
        ballImageView.backgroundColor = UIColor.clear
        
        let angle:CGFloat = CGFloat((30.0 * M_PI) / 180.0)
        batButton.transform = CGAffineTransform(rotationAngle: angle)
        
        
        self.view.addSubview(ballImageView)
        
        
        let appframe: CGRect = UIScreen.main.applicationFrame
        speed = Float(appframe.size.height) / 1.2
        
        //音楽フアイルの指定
        let audioPath = NSURL(fileURLWithPath: Bundle.main.path(forResource: "baseBGM",ofType: "mp3")!)
        //再生の準備
        audio = AVPlayer(url: audioPath as URL)
        //音楽を再生
        audio.play()
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                     target: self,
                                     selector: #selector(ViewController.up),
                                     userInfo: nil,
                                     repeats: true            )
        startButton.alpha = 0.0
    }
    
    
    
    
    func up() {
        count = count + 0.01
        timeLabel.text = String(format:"%.2f" , count)
        
        if 10.0 - 1.2 <= count {
            
            var number : Float = (self.count - 10.0 + 1.2) * speed - 75
            ballImageView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            
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
            
            performSegue(withIdentifier: "toViewController2", sender: self)
            return "ホームラン"
        } else if count > number - 0.30 && count < number + 0.30 {
            //もし経過時間が9.5秒〜10.5秒だったら
            homerun = false
            twobasehit = false
            hit = true
            fall = false
            performSegue(withIdentifier: "toViewController2", sender: self)
            return "ヒット"//ツーベースヒットと表示
        } else if count > number - 0.40 && count > number + 0.40{
            
            //もし経過時間が9.0秒〜11.0秒だったら
            homerun = false
            twobasehit = false
            hit = false
            fall = true
            strikeLabel.text = "⚫︎"
            return "フアール"//フアールと表示
        }
        strikeLabel.text = "⚫︎"
        
        return "ファール"
    }
    //
    //        if strikeNumber　== "⚫︎"{
    //            strikeLabel.backnumber color = UIColor.yellowColor()
    //
    //
    //+"⚫︎"　ストライクカウント
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
    
    override func prepare(for segue: UIStoryboardSegue, sender seder: Any?) {
        
        if segue.identifier == "toViewController2" {
            let viewController: ViewController2 = segue.destination as! ViewController2
            viewController.number = 0
        }
        
    }
    
    
    @IBAction func pushButton() {
        timer.invalidate()
        
        hanteiLabel.text = self.hantei(number: 10.0)
        let angle:CGFloat = CGFloat((-30.0 * M_PI) / 180.0)
        
        // アニメーションの秒数を設定
        UIView.animate(withDuration: 0.3,
                       
                       animations: { () -> Void in
                        
                        // 回転用のアフィン行列を生成.
                        self.batButton.transform = CGAffineTransform(rotationAngle: angle)
        },
                       completion: { (Bool) -> Void in
                        
                        self.batButton.transform = CGAffineTransform(rotationAngle: -angle)
                        
        })
    }
    
    
}

