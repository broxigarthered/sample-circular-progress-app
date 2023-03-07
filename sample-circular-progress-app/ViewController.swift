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
    }

    @IBAction func didTapOnOpenCircularProgressView(_ sender: Any) {
        let controller = CircularProgressVC(nib: "CircularProgressVC", bundle: nil, timer: 3)
        self.presentAsModalWindow(controller)
    }
}

