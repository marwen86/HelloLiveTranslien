//
//  trainsViewController.swift
//  LiveTrain2.0
//
//  Created by Mohamed Marouane YOUSSEF on 08/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//


import UIKit

class TrainsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let trainLiveDownloader = LiveTrainDownloader()

        trainLiveDownloader.downloadListTrain(87276030) { (trains) -> () in
            //list des tarin
            _ = trains
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
