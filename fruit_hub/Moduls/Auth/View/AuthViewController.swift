//
//  AuthViewController.swift
//  fruit_hub
//
//  Created by Reynaldi Pamungkas on 13/11/23.
//

import UIKit

class AuthViewController: BaseViewController {
    // MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameErrorLabel: UILabel!
    
    // MARK: - Variables
    var didSendEventClosure: ((AuthViewController.Event) -> Void)?
    var viewModel: AuthViewModelProtocol?
    
    init(viewModel: AuthViewModelProtocol?) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("AuthViewController deinit")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func startButtonPressed(_ sender: UIButton) {
        var textFieldRequestFocus: UIResponder?
        let nameText = nameTextField.text
        
        if let name = nameText {
            if name.isEmptyAfterTrim {
                textFieldRequestFocus = nameTextField
                nameErrorLabel.isHidden = false
            }
        }
        
        if let textFieldRequestFocus = textFieldRequestFocus {
            textFieldRequestFocus.becomeFirstResponder()
        } else {
            nameErrorLabel.isHidden = true
            Session.shared.name = nameText
            didSendEventClosure?(.dashboard)
        }
    }
}

extension AuthViewController {
    enum Event {
        case login
        case dashboard
    }
}
