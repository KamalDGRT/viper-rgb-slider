//
//  HomeViewBuilder.swift
//  Viper_Basic_Slider
//
//  Created by Kamal Sharma R on 25/06/22.
//

import Foundation
import UIKit

// View Controller protocol
protocol HomeView: AnyObject {
    func loadCurrentColor(rgb: (CGFloat, CGFloat, CGFloat)) -> (Void)
}

// Interactor Protocol
protocol HomeUseCase: AnyObject {
    func loadCurrentColor() -> (CGFloat, CGFloat, CGFloat)
    func saveCurrentColor(rgb: (CGFloat, CGFloat, CGFloat)) -> ()
}

// Interactors' whole purpose is to solve a use case
//

class HomeInteractor: HomeUseCase {
    var appColorDao: AppColorDAO?
    init(dao: AppColorDAO = AppColorDAO()) {
        appColorDao = dao
    }
    
    /*!
     * @discussion Load current color use case handled here
     * @params Void
     * @return (CGFloat, CGFloat, CGFloat)
     */

    func loadCurrentColor() -> (CGFloat, CGFloat, CGFloat) {
        let currentRgb = appColorDao?.fetch()
        return currentRgb!
    }
    
    
    /*!
     * @discussion Save current color use case handled here
     * @params (CGFloat, CGFloat, CGFloat) between 0-255
     * @return Void
     */
    func saveCurrentColor(rgb: (CGFloat, CGFloat, CGFloat)) -> (Void) {
        appColorDao?.save(rgb: rgb)
    }
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
    
    func onLoadCurrentColor() -> ()
    func onColorValueChange(rgb: (CGFloat, CGFloat, CGFloat)) -> ()
}

class HomeViewPresenter: HomeViewPresentation {
    
    weak var view: HomeView?
    var router: HomeViewWireframe?
    var interactor: HomeUseCase?
    
    /*!
     * @discussion Load current received from View Controller
     * @params Void
     * @return Void
     */

    func onLoadCurrentColor() {
        
//      Method 1
//      Presenter makes a call to the interactor
//        let currentRgb = interactor?.loadCurrentColor()
        
//      The result must be passed to the view
//        view?.loadCurrentColor(rgb: currentRgb!)

//      Method 2
//      you can delegate the call to the interactor in the background thread
//      and update the view load stuff in the main thread using Dispatch Queue
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            
            guard let `self` = self else { return }
            
            let currentRgb = self.interactor?.loadCurrentColor()
            DispatchQueue.main.async {
                self.view?.loadCurrentColor(rgb: currentRgb!)
            }
        }
    }
    
    
    /*!
     * @discussion When color value changes in view controller, it delgates the save work to presenter
     * @params Void
     * @return Void
     */
    func onColorValueChange(rgb: (CGFloat, CGFloat, CGFloat)) {
        
//        doing it in the background thread
        DispatchQueue.global(qos: .background).async { [weak self] in
            
            guard let `self` = self else { return }
            
            self.interactor?.saveCurrentColor(rgb: rgb)
        }
    }
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
