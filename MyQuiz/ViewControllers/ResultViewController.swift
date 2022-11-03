//
//  ResultViewController.swift
//  MyQuiz
//
//  Created by Max Franz Immelmann on 11/2/22.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    
    var result: Answer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = "You are - \(String(result.type.rawValue))"
        infoLabel.text = result.type.definition
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        // option 1
//        view.window?.rootViewController?.dismiss(animated: true)
        
        // option 2
        navigationController?.dismiss(animated: true)
    }
    
    // memory check
    deinit {
        print("ResultViewController has been deallocated")
    }
}
