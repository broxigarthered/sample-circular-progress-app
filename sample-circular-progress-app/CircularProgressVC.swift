//
//  CircularProgressVC.swift
//  sample-circular-progress-app
//
//  Created by Nikolay N. Dutskinov on 7.03.23.
//

import Cocoa
import CircularProgress

class CircularProgressVC: NSViewController {
    
    let circularProgress = CircularProgress(size: 200)
    let statusLabel: NSTextField = {
        let textField = NSTextField(frame: NSRect(x: 0, y: 0, width: 100, height: 20))
        textField.stringValue = "Loading..."
        textField.textColor = .white
        textField.backgroundColor = .clear
        textField.isEditable = false
        textField.isBezeled = false
        textField.drawsBackground = false
        textField.isSelectable = false
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    init(nib: String, bundle: Bundle?, timer seconds: Double) {
        super.init(nibName: nib, bundle: bundle)
     
        configureProgressView()
        completeProgressAfter(seconds: seconds)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Changes the background color to black
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = .black
    }
    
    /// This function simulates a service call, which would take two seconds.
    private func completeProgressAfter(seconds: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.completeProgress()
        }
    }
    
    /// Marks the progress as complete and performs close on the window after two seconds.
    private func completeProgress() {
        circularProgress.progress = 1
        statusLabel.stringValue = "Completed"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.view.window?.performClose(self)
        }
    }
    
    /// Creates the circular progress, sets constraints
    private func configureProgressView() {
        circularProgress.isCancellable = true
        circularProgress.isIndeterminate = true
        view.addSubview(circularProgress)
        view.addSubview(statusLabel)
        
        NSLayoutConstraint.activate([
            circularProgress.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            circularProgress.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),

            statusLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
}
