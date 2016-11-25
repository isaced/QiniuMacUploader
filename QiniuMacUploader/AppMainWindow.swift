//
//  AppMainWindow.swift
//  QiniuMacUploader
//
//  Created by feeling on 2016/11/24.
//
//

import AppKit

class AppMainWindow: NSWindow {
    
    override init(contentRect: NSRect, styleMask style: NSWindowStyleMask, backing bufferingType: NSBackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: style, backing: bufferingType, defer: flag)
    
        self.titlebarAppearsTransparent = true
    }
}
