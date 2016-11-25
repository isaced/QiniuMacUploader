//
//  AppDelegate.swift
//  QiniuMacUploader
//
//  Created by feeling on 2016/11/24.
//
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApplication.shared().keyWindow?.titlebarAppearsTransparent = true // gives it "flat" look
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

