//
//  ViewController.swift
//  QiniuMacUploader
//
//  Created by feeling on 2016/11/24.
//
//

import Cocoa
import QiniuUpload

class ViewController: NSViewController {

    @IBOutlet weak var dragDropView: DragDropView!
    
    @IBOutlet weak var urlTextField: NSTextField!
    
    let scope = ""          // Bucket
    let accessKey = ""      // AK
    let secretKey = ""      // SK
    let rootDomain = ""     // Domain, for join final link and show
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        QiniuToken.register(withScope: self.scope, secretKey: self.secretKey, accesskey: self.accessKey)
        
        dragDropView.dragDropFileURLs = { urls in
            print(urls)
            if let url = urls.first {
                if let uploadToken = QiniuToken.shared().uploadToken(){
                    if let file = QiniuFile(path: url.path) {
                        print("start upload : \(url)")
                        
                        self.urlTextField.stringValue = ""
                        
                        let uploader = QiniuUploader()
                        uploader.addFile(file)
                        uploader.startUpload(withAccessToken: uploadToken)
                        uploader.uploadOneFileSucceeded = { index, key, info in
                            print("upload succeeded : \(index) - \(key)")
                            
                            let url = "\(self.rootDomain)/\(key)"
                            self.urlTextField.stringValue = url
                        }
                        uploader.uploadOneFileFailed = { index, error in
                            print("upload Failed : \(index) - \(error)")
                            
                            self.urlTextField.stringValue = ""
                        }
                        uploader.uploadAllFilesComplete = {
                            print("upload complete...")
                        }
                    }
                }
            }
        }
        

    }
    
    @IBAction func _tapCopyButton(_ sender: NSButton) {
        if self.urlTextField.stringValue.characters.count > 0 {
            NSPasteboard.general().declareTypes([NSStringPboardType], owner: nil)
            NSPasteboard.general().setString(self.urlTextField.stringValue, forType: NSStringPboardType)
        }
    }
}

