//
//  ViewController.swift
//  Trax
//
//  Created by Martin Mandl on 07.03.15.
//  Copyright (c) 2015 m2m server software gmbh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = NSNotificationCenter.defaultCenter()
        let queue = NSOperationQueue.mainQueue()
        let appDelegate = UIApplication.sharedApplication().delegate

        center.addObserverForName(GPXURL.Notification, object: appDelegate, queue: queue)  { notification in
            if let url = notification?.userInfo?[GPXURL.Key] as? NSURL {
                self.textView.text = "Received \(url)"
            }
        }
    }
    
    @IBAction func test(sender: AnyObject) {
        let path = NSBundle.mainBundle().pathForResource("ViennaMarathon", ofType: "gpx")
        let url = NSURL(fileURLWithPath: path!)
        UIApplication.sharedApplication().delegate?.application!(UIApplication.sharedApplication(), handleOpenURL: url!)
    }
}

