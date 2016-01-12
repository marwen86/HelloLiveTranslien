//
//  LiveTrainDownloader.swift
//  LiveTrain2.0
//
//  Created by Mohamed Marouane YOUSSEF on 08/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

import UIKit
import Alamofire
import SWXMLHash

public class Train : NSObject {
    
    public var trainNum : String?
    public var trainMiss : String?
    public var trainTerm : String?
    public var trainDate : String?
    public var trainEtat : String?
    
    init ( trainNum : String , trainMiss : String , trainTerm : String , trainDate : String) {
       
         self.trainNum = trainNum
         self.trainMiss = trainMiss
         self.trainTerm = trainTerm
         self.trainDate = trainDate
      
    }
    

}


public class LiveTrainDownloader: NSObject {

    private func loadStationXml (parsingClosureCompletion : (xmlToParse : String?) ->())
    {
        var  xmlToParse : String?
        
        let xmlURL = NSBundle(forClass: LiveTrainDownloader.self).URLForResource("departures", withExtension: "xml")
        
        if xmlURL != nil {
            let data = NSData(contentsOfURL: xmlURL!)
            if data != nil {
                xmlToParse = String(data: data!, encoding: NSUTF8StringEncoding)
            }
        }
        parsingClosureCompletion(xmlToParse: xmlToParse)
    }
    
    public func downloadListTrain ( stationIdDeparture : NSInteger? , stationIdArrival : NSInteger? , trainFetchedCompeltion : (trains : [Train]) ->()) {
    
        
        let parsingClosure: (xmlToParse : String?) ->() =  { (xmlToParse) -> () in
          
            let xml = SWXMLHash.parse(xmlToParse! as String)
            var trains = [Train]()
            
            for train in xml["passages"]["train"].all
            {
                
                let trainNum = String(train["num"].element?.text)
                let trainMiss = String(train["miss"].element?.text)
                let trainTerm = String(train["term"].element?.text)
                let trainDate = String(train["date"].element?.text)
                
                let trainTmp = Train.init(trainNum: trainNum, trainMiss: trainMiss, trainTerm: trainTerm, trainDate: trainDate)
                
                trains.append(trainTmp)
            }
            trainFetchedCompeltion(trains: trains)

    }

        
        #if DEBUG
            localXMLDepartures (parsingClosure)
        #else
            let dict = NSProcessInfo.processInfo().environment
            let credentials = dict["TRANSILIEN_CREDENTIALS"] as String!
            let credentialsAsData = credentials.dataUsingEncoding(NSUTF8StringEncoding)
            let base64Credentials = credentialsAsData!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
            let headers = [
                "Authorization": "Basic \(base64Credentials)"
            ]
            
            Alamofire.request(.GET, "http://api.transilien.com/gare/\(stationIdDeparture!)/depart/\(stationIdArrival!)/", headers: headers)
                .response { response in
                    let stringXml : String = NSString(data: response.2!, encoding: NSUTF8StringEncoding)! as String
                    parsingClosure(xmlToParse: stringXml)
            }
        #endif
    }
    
    private func stringDateConverter (StringDate : String?) ->(NSDate)
    {
    
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let date = dateFormatter.dateFromString(StringDate!)
        return date!
    }
}


