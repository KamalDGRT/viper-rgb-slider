//
//  HomeViewInteractor.swift
//  Viper_Basic_Slider
//
//  Created by Kamal Sharma R on 25/06/22.
//

import UIKit


/// Interactors' whole purpose is to solve a use case
class HomeInteractor: HomeUseCase {
    var appColorDao: AppColorDAO?
    init(dao: AppColorDAO = AppColorDAO()) {
        appColorDao = dao
    }
 
    /**
     Load current color use case handled here
     - Returns: 
        - (CGFloat, CGFloat, CGFloat)
    */
    func loadCurrentColor() -> (CGFloat, CGFloat, CGFloat) {
        let currentRgb = appColorDao?.fetch()
        return currentRgb!
    }
    
    
    /**
     Save current color use case handled here
     - Parameters:
        - Red `CGFloat`
        - Green `CGFloat`
        - Blue `CGFloat`
     */
    func saveCurrentColor(rgb: (CGFloat, CGFloat, CGFloat)) -> (Void) {
        appColorDao?.save(rgb: rgb)
    }
}
