//
//  HomeViewPresenter.swift
//  Viper_Basic_Slider
//
//  Created by Kamal Sharma R on 25/06/22.
//

import UIKit

/// Delegates tasks to view and interactor
class HomeViewPresenter: HomeViewPresentation {
    
    weak var view: HomeView?
    var router: HomeViewWireframe?
    var interactor: HomeUseCase?
    
    /**
      Load current received from View Controller
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
    
    
    /**
      When color value changes in view controller, it delgates the save work to presenter
     */
    func onColorValueChange(rgb: (CGFloat, CGFloat, CGFloat)) {
        
        //        doing it in the background thread
        DispatchQueue.global(qos: .background).async { [weak self] in
            
            guard let `self` = self else { return }
            
            self.interactor?.saveCurrentColor(rgb: rgb)
        }
    }
}
