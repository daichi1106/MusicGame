//
//  PlayerViewController.swift
//  MusicGame
//
//  Created by 早見　大地 on 2017/05/28.
//  Copyright © 2017年 早見　大地. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    
    //Playerを表示させるLabel
    @IBOutlet var batterImage2: UIButton!
    @IBOutlet var batterImage3: UIButton!
    @IBOutlet var batterImage4: UIButton!
    @IBOutlet var batterImage5: UIButton!
    var image : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func player2Button() {
        //してほしい動作
        image = UIImage(named:"batterImage2.png")
        self.performSegue(withIdentifier: "Segue2", sender: nil)
        
    }
    
    @IBAction func player３Button() {
        //してほしい動作
        image = UIImage(named:"batterImage3.png")
        self.performSegue(withIdentifier: "Segue2", sender: nil)
    }
    
    @IBAction func player４Button() {
        //してほしい動作
        image = UIImage(named:"batterImage4.png")
        self.performSegue(withIdentifier: "Segue2", sender: nil)
    }
    
    @IBAction func player5Buttonn() {
        //してほしい動作
        image = UIImage(named:"batterImage5.png")
        self.performSegue(withIdentifier: "Segue2", sender: nil)
        
    }
    
    @IBAction func player1Button() {
        //してほしい動作
        image = UIImage(named:"batterImage.png")
        self.performSegue(withIdentifier: "Segue2", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue,sender: Any?) {
        if segue.identifier == "Segue2"{
            
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
