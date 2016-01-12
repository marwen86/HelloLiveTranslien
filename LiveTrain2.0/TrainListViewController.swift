//
//  TrainListViewController.swift
//  LiveTrain2.0
//
//  Created by Mohamed Marouane YOUSSEF on 12/01/2016.
//  Copyright © 2016 Mohamed Marouane YOUSSEF. All rights reserved.
//

import UIKit

class TrainListViewController: UIViewController{

    let tarinCellIdentifier = "trainCell"
    @IBOutlet weak var TrainsListTableView: UITableView!
    var trainList  = [Train]() {
       
        didSet {
            self.TrainsListTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.trainList.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return basicCellAtIndexPath(indexPath)
    }
    
    func basicCellAtIndexPath(indexPath:NSIndexPath) -> TrainDataTableViewCell {
        let cell = self.TrainsListTableView.dequeueReusableCellWithIdentifier(tarinCellIdentifier) as! TrainDataTableViewCell
        let trainTmp = self.trainList[indexPath.row]
        cell.trainDateLabel.text = trainTmp.trainDate as String!
        cell.trainNameLabel.text = trainTmp.trainMiss as String!
        cell.trainTerminusLabel.text = trainTmp.trainTerm  as String!
        
        return cell
    }
    
    func configureTableView() {
        self.TrainsListTableView.rowHeight = UITableViewAutomaticDimension
         self.TrainsListTableView.estimatedRowHeight = 160.0
    }
    
    
}
