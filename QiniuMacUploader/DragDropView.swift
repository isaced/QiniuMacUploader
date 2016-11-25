//
//  DragDropView.swift
//  QiniuMacUploader
//
//  Created by feeling on 2016/11/24.
//
//

import Cocoa

class DragDropView: NSImageView {

    let acceptableTypes: Set<String> = [NSFilenamesPboardType]
    let filteringOptions = [NSPasteboardURLReadingContentsConformToTypesKey:NSImage.imageTypes()]
    var isReceivingDrag = false {
        didSet {
            needsDisplay = true
        }
    }
    var dragDropFileURLs:(([URL]) -> ())?
    
    //MARK: - Life
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        if isReceivingDrag {
            NSColor.selectedControlColor.set()
        }else{
            NSColor.lightGray.set()
        }
        
        let path = NSBezierPath(rect:bounds)
        path.lineWidth = 2
        path.stroke()
    }
    
    func setup() {
        register(forDraggedTypes: Array(acceptableTypes))
    }
    
    func shouldAllowDrag(_ draggingInfo: NSDraggingInfo) -> Bool {
        var canAccept = false
        let pasteBoard = draggingInfo.draggingPasteboard()
        if pasteBoard.canReadObject(forClasses: [NSURL.self], options: filteringOptions) {
            canAccept = true
        }
        return canAccept
        
    }
    
    //MARK: - <NSDraggingDestination>
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        let allow = shouldAllowDrag(sender)
        isReceivingDrag = allow
        return allow ? .copy : NSDragOperation()
    }
    
    override func draggingExited(_ sender: NSDraggingInfo?) {
        isReceivingDrag = false
    }
    
    override func prepareForDragOperation(_ sender: NSDraggingInfo) -> Bool {
        return shouldAllowDrag(sender)
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        isReceivingDrag = false
        let pasteBoard = sender.draggingPasteboard()
        if let urls = pasteBoard.readObjects(forClasses: [NSURL.self], options:filteringOptions) as? [URL], urls.count > 0 {
            self.dragDropFileURLs?(urls)
            return true
        }
        return false
    }
}
