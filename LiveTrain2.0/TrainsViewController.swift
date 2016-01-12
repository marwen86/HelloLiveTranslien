//
//  trainsViewController.swift
//  LiveTrain2.0
//
//  Created by Mohamed Marouane YOUSSEF on 08/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//


import UIKit

class TrainsViewController: UIViewController , UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var startStation: UITextField?
    @IBOutlet weak var endStation:   UITextField?
    @IBOutlet var pickerBizCat: UIPickerView! = UIPickerView()
    
    var stationsDict : NSDictionary!
    var startStationSelected = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerBizCat.hidden = true;
        
        
        if let path = NSBundle.mainBundle().pathForResource("stations", ofType: "plist") {
            stationsDict = NSDictionary(contentsOfFile: path)
        }
        if let _ = stationsDict {
            print("dict \(stationsDict.allKeys.count)")
        }
        
//        let trainLiveDownloader = LiveTrainDownloader()
//        trainLiveDownloader.downloadListTrain(87276030) { (trains) -> () in
//            //list des tarin
//            _ = trains
//        }
        
    }
    
    
    @IBAction func searchAction(sender: UIButton) {
        let idStartStation  = stationsDict[startStation!.text!]
        let idEndStation  = stationsDict[endStation!.text!]

        if let start = idStartStation
        {
             if let arrive = idEndStation
             {
                print("search Action \(start) \(arrive)");
            }
        }
    }
    

    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }

    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return stationsDict.allKeys.count
        }

        
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return  stationsDict.allKeys[row] as? String
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(startStationSelected)
        {
            startStation?.text = stationsDict.allKeys[row] as? String
            
        }else{
            endStation?.text = stationsDict.allKeys[row] as? String
        }
        
        pickerBizCat.hidden = true;
    }
    

    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
    if (self.startStation == textField)
    {
                    startStationSelected = true
    }else
    {
                startStationSelected = false
    }
        pickerBizCat.hidden = false
           return false
}

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
