//
//  AppDelegate.swift
//  Trax
//
//  Created by Martin Mandl on 07.03.15.
//  Copyright (c) 2015 m2m server software gmbh. All rights reserved.
//

import UIKit

struct GPXURL {
    static let Notification = "GPXURL Radio Station"
    static let Key = "GPXURL URL Key"
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{

    var window: UIWindow?

    func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool
    {
        let center = NSNotificationCenter.defaultCenter()
        let notification = NSNotification(name: GPXURL.Notification, object: self, userInfo: [GPXURL.Key:url])
        center.postNotification(notification)
        return true
    }


}

