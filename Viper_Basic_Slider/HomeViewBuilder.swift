//
//  HomeViewBuilder.swift
//  Viper_Basic_Slider
//
//  Created by Kamal Sharma R on 25/06/22.
//

import UIKit

/// This is the class responsible for creating the initial view controller.
class HomeViewBuilder {
    
    /**
         This static function will create a view controller using the `Main` storyboard.
        
         ### Usage Example:
         ```
         let initialVC = HomeViewBuilder.assembleModule()
         ```
    */
    
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
