//
//  HomeCoordinator.swift
//  fruit_hub
//
//  Created by Reynaldi Pamungkas on 13/11/23.
//

import Foundation
import UIKit

protocol HomeCoordinatorProtocol: Coordinator {
    func showHomeViewController()
}

class HomeCoordinator: HomeCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType { .dashboard }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func start() {
        showHomeViewController()
    }
    
    deinit {
        print("LoginCoordinator deinit")
    }
    
    func showHomeViewController() {
        let homeVC: HomeViewController = .init(viewModel: HomeInjection.provideHomeViewModel())
        homeVC.didSendEventClosure = { [weak self] event in
            switch event {
            case .finish:
                self?.finish()
            }
        }
        navigationController.pushViewController(homeVC, animated: true)
    }
}
