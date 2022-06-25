//
//  HomeViewBuilder.swift
//  Viper_Basic_Slider
//
//  Created by Kamal Sharma R on 25/06/22.
//

import Foundation
import UIKit

protocol HomeView: AnyObject {
    
}

protocol HomeUseCase: AnyObject {
    
}

// Interactors' whole purpose is to solve a use case
//

class HomeInteractor: HomeUseCase {
    
}

// router protocol
protocol HomeViewWireframe: AnyObject {
    var viewController: UIViewController? { get }
}

class HomeViewRouter: HomeViewWireframe {
    var viewController: UIViewController?
}

// presenter protocol
// presenter should have a strong reference to router
// it should not be the other way
protocol HomeViewPresentation: AnyObject {
    var view: HomeView? {get}
    var router: HomeViewWireframe? {get}
    var interactor: HomeUseCase? {get}
}

class HomeViewPresenter: HomeViewPresentation {
    
    weak var view: HomeView?
    var router: HomeViewWireframe?
    var interactor: HomeUseCase?
}

class HomeViewBuilder {
    static func assembleModule() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let view = storyboard.instantiateViewController(withIdentifier: "homeViewController") as? HomeViewController
        let presenter = HomeViewPresenter()
        let interactor = HomeInteractor()
        let router = HomeViewRouter()
        
        view?.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
    
        router.viewController = view
        
        return view!
    }
}
