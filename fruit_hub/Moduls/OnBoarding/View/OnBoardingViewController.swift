//
//  OnBoardingViewController.swift
//  fruit_hub
//
//  Created by Reynaldi Pamungkas on 13/11/23.
//

import UIKit

class OnBoardingViewController: BaseViewController {
    // MARK: - Outlets
    
    // MARK: - Variables
    var didSendEventClosure: ((OnBoardingViewController.Event) -> Void)?
    var viewModel: OnBoardingViewModelProtocol?
    
    init(viewModel: OnBoardingViewModelProtocol?) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("OnBoardingViewController deinit")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        didSendEventClosure?(.auth)
    }
}

extension OnBoardingViewController {
    enum Event {
        case onBoarding
        case auth
    }
}
