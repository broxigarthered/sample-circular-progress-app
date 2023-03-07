//
//  ViewController.swift
//  sample-circular-progress-app
//
//  Created by Nikolay N. Dutskinov on 7.03.23.
//

import Cocoa
import CircularProgress

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let circularProgress = CircularProgress(size: 200)
//        self.view.window?.contentView?.addSubview(circularProgress)
        self.view.addSubview(circularProgress)
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

