//
//  OnBoardingCoordinator.swift
//  fruit_hub
//
//  Created by Reynaldi Pamungkas on 13/11/23.
//

import UIKit

protocol OnBoardingCoordinatorProtocol: Coordinator {
    func showOnBoardingViewController()
    func showAuthViewController()
    func showHomeViewController()
}

class OnBoardingCoordinator: OnBoardingCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType { .onBoarding }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func start() {
        showOnBoardingViewController()
    }
    
    deinit {
        print("LoginCoordinator deinit")
    }
    
    func showOnBoardingViewController() {
        let onBoardingVC: OnBoardingViewController = .init(viewModel: OnBoardingInjection.provideOnBoardingViewModel())
        onBoardingVC.didSendEventClosure = { [weak self] event in
            switch event {
            case .onBoarding:
                self?.finish()
            case .auth:
                self?.showAuthViewController()
            }
        }
        navigationController.pushViewController(onBoardingVC, animated: true)
    }
    
    func showAuthViewController() {
        let authVC: AuthViewController = .init(viewModel: AuthInjection.provideAuthViewModel())
        authVC.didSendEventClosure = { [weak self] event in
            switch event {
            case .login:
                self?.finish()
            case .dashboard:
                self?.showHomeViewController()
            }
        }
        navigationController.pushViewController(authVC, animated: true)
    }
    
    func showHomeViewController() {
        // Implement Dashbaord (Tab bar) FLow
        let tabCoordinator = HomeCoordinator.init(navigationController)
        tabCoordinator.finishDelegate = self
        tabCoordinator.start()
        childCoordinators.append(tabCoordinator)
    }
}

extension OnBoardingCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        
        return
    }
}
