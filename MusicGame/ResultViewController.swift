//
//  ResultViewController.swift
//  MusicGame
//
//  Created by 早見　大地 on 2016/02/14.
//  Copyright (c) 2016年 早見　大地. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var baseballman:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func batarfirst () {
        baseballman = 1
    }
    @IBAction func batarsecond () {
        baseballman = 2
        
    }
    @IBAction func batarshort () {
        baseballman = 3
    }
    @IBAction func batarthird () {
        baseballman = 4
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier ==  "baseballgame" {
            let VC = segue.destinationViewController as ViewController
            VC.baseballman = self.baseballman
        }
        
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
