//
//  AppCoordinator.swift
//  fruit_hub
//
//  Created by Reynaldi Pamungkas on 13/11/23.
//

import UIKit

// Define what type of flows can be started from this Coordinator
protocol AppCoordinatorProtocol: Coordinator {
    func showOnBoardingFlow()
}

// App coordinator is the only one coordinator which will exist during app's life cycle
class AppCoordinator: AppCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate? = nil
    
    var navigationController: UINavigationController
    
    var childCoordinators = [Coordinator]()
    
    var type: CoordinatorType { .app }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(false, animated: true)
    }
    
    func start() {
        return showOnBoardingFlow()
    }
    
    func showOnBoardingFlow() {
        // Implement On Boarding FLow
        let onBoardingCoordinator = OnBoardingCoordinator.init(navigationController)
        onBoardingCoordinator.finishDelegate = self
        onBoardingCoordinator.start()
        childCoordinators.append(onBoardingCoordinator)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        
        switch childCoordinator.type {
        default:
            return
        }
    }
}
