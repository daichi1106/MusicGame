//
//  PlayerViewController.swift
//  MusicGame
//
//  Created by 早見　大地 on 2016/06/12.
//  Copyright (c) 2016年 早見　大地. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    
    //Playerを表示させるLabel
    @IBOutlet var バッターイメージ２: UIButton!
    @IBOutlet var バッターイメージ３: UIButton!
    @IBOutlet var バッターイメージ４: UIButton!
    @IBOutlet var バッターイメージ５: UIButton!
    var image : UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func player2Button() {
        //してほしい動作
        image = UIImage(named:"バッターイメージ２.png")
        self.performSegue(withIdentifier: "Segue2", sender: nil)
    }
    @IBAction func player３Button() {
        //してほしい動作
        image = UIImage(named:"バッターイメージ3.png")
        self.performSegue(withIdentifier: "Segue2", sender: nil)
    }
    @IBAction func player４Button() {
        //してほしい動作
        image = UIImage(named:"バッターイメージ4.png")
        self.performSegue(withIdentifier: "Segue2", sender: nil)
    }
    
    @IBAction func player5Buttonn() {
        //してほしい動作
        image = UIImage(named:"バッターイメージ５.png")
        self.performSegue(withIdentifier: "segue2", sender: nil)
        
    }
    
    @IBAction func player1Button() {
        //してほしい動作
        image = UIImage(named:"バッターイメージ.png")
        self.performSegue(withIdentifier: "segue2", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?) {
        if segue.identifier == "segue2"{
            
            _ = segue.destination as! ViewController
        }
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
