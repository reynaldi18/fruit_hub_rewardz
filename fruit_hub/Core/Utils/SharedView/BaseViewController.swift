//
//  BaseViewController.swift
//  fruit_hub
//
//  Created by Reynaldi Pamungkas on 13/11/23.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if navigationController != nil {
            navigationController?.interactivePopGestureRecognizer?.delegate = self
            navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        }
    }
}
