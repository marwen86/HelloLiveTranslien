//
//  trainsViewController.swift
//  LiveTrain2.0
//
//  Created by Mohamed Marouane YOUSSEF on 08/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//


import UIKit

class trainsViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var startStation: UITextField?
    @IBOutlet weak var endStation: UITextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let trainLiveDownloader = LiveTrainDownloader()

        trainLiveDownloader.downloadListTrain(87276030) { (trains) -> () in
            //list des tarin
            _ = trains
        }
        
    }
    
    @IBAction func searchAction(sender: UIButton) {
        print("search Action");
    }
    
    // Delegate UITextField
    func textFieldDidBeginEditing(textField: UITextField) {    //delegate method
        
        if (self.startStation == textField)
        {
            print("click text StartStation TextField")
        }else
        {
            print("click text EndStation TextField")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
