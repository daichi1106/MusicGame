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
    @IBOutlet var strikeFirstlabel: UIView!
    @IBOutlet var strikeSecondlabel: UIView!
    @IBOutlet var ballFirstlabel: UIView!
    @IBOutlet var ballSecondlabel: UIView!
    @IBOutlet var ballThirdlabel: UIView!
    @IBOutlet var outFirstlabel: UIView!
    @IBOutlet var outSecondlabel: UIView!
    var animationTimer: Timer = Timer()
    //バッターの画像を表示するImageView
    var baterImage: UIImage!
    @IBOutlet var baterImageView: UIImageView!
    
    var count: Float = 0.0
    var timer: Timer = Timer()
    var countUpTimer: Timer = Timer()
    
    var speed: Float = 0.0
    //
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
    var strikecount: Int = 0
    
    var countUpNumber: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        strikeFirstlabel.layer.cornerRadius = strikeFirstlabel.frame.width/2
        strikeSecondlabel.layer.cornerRadius = strikeSecondlabel.frame.width/2
        ballFirstlabel.layer.cornerRadius = ballFirstlabel.frame.width/2
        ballSecondlabel.layer.cornerRadius = ballSecondlabel.frame.width/2
        ballThirdlabel.layer.cornerRadius = ballThirdlabel.frame.width/2
        outFirstlabel.layer.cornerRadius = outFirstlabel.frame.width/2
        outSecondlabel.layer.cornerRadius = outSecondlabel.frame.width/2
        // Do any additional setup after loading the view, typically from a nib.
        
        _ = UILabel()//日常表示ラベルstrikeNumber = 0
        ballNumber = 0
        outNumber = 0
        
        strikeLabel.text = ""
        ballLabel.text = ""
        outLabel.text = ""
        baterImageView.image = baterImage
        //初回
        updateDateLabel()
        
        //一定間隔で実行
        countUpTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(countUp), userInfo: nil, repeats: true)
        countUpTimer.fire()
        
        //日時フオーマット
        var dateFormatter: DateFormatter {
            let formatter  = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
            return formatter
        }
        
        
        //Timerを破棄する
        timer.invalidate()
        let layer:CALayer = batButton.layer
        let animation:CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = Double.pi / 2.0
        animation.duration = 0.5           //0.5秒で90度回転
        animation.repeatCount = MAXFLOAT  //無限に繰り返す
        animation.isRemovedOnCompletion = true     //効果を累積
        layer.add(animation, forKey: nil)
        
        
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    func countUp() {
        
        countUpNumber = countUpNumber + 0.01
        timeLabel.text = String(countUpNumber)
    }
    
    
    //日常表示ラベル更新メソッド
    func updateDateLabel(){
        
    }
    
    func update(tm: Timer) {
        //do something
    }
    
    
    
    
    func stop() {
        if timer.isValid {
            //タイマーが動作していたら停止する
            timer.invalidate()
        }
    }
    
    
    
    
    func start() {
        
        if !timer.isValid {
        }
        
        
        
        ballImageView = UIImageView(frame: CGRect(x: 0,y: 0,width: 0,height: 0))
        let ballImage = UIImage(named: "1335779391.png")
        ballImageView.image = ballImage
        ballImageView.backgroundColor = UIColor.clear
        
        let angle:CGFloat = CGFloat((30.0 * Double.pi) / 180.0)
        batButton.transform = CGAffineTransform(rotationAngle: angle)
        
        
        self.view.addSubview(ballImageView)
        
        
        let appframe: CGRect = UIScreen.main.bounds
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
        timeLabel.text = String(format:"%.2f" , countUp as! CVarArg)
        
        if 10.0 - 1.2 <= count {
            _ = 0.0 + 1.2 * self.speed - 75
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
            
            performSegue(withIdentifier: "toViewController2", sender: SELF_LIBRARY_ORDINAL)
            return "ホームラン"
        } else if count > number - 0.30 && count < number + 0.30 {
            //もし経過時間が9.5秒〜10.5だったら
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
        }else {
            if strikecount == 0 {
                strikecount = 1
                
                strikeFirstlabel.backgroundColor = UIColor.yellow
            }else if strikecount == 1{
            strikecount = 2
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
    func reset(){
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
        let angle:CGFloat = CGFloat((-30.0 * Double.pi) / 180.0)
        
        // animationTimerを使って0.1秒ごとにanimationUpdateを呼び出す
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
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
    
    // 0.01秒ごとにanimationTimerによって呼ばれる
    func animationUpdate() {
        
        // ボールの座標とバットの座標が一致したら
        
        
    }
    
    func tapBatButton() {
        timer.invalidate()
        let layer:CALayer = batButton.layer
        let animation:CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = Double.pi / 2.0
        animation.duration = 0.5           //0.5秒で90度回転
        if count >= 10 {
            animation.duration = 1.0
        }
        animation.repeatCount = 1 //1回ループ
        animation.isRemovedOnCompletion = true     //効果を累積
        layer.add(animation, forKey: nil)
        
        
        
    }
    
    
    
    
}



