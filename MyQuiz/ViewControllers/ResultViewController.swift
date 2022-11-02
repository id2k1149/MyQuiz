//
//  ResultViewController.swift
//  MyQuiz
//
//  Created by Max Franz Immelmann on 11/2/22.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
