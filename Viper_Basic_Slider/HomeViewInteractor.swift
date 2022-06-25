//
//  HomeViewInteractor.swift
//  Viper_Basic_Slider
//
//  Created by Kamal Sharma R on 25/06/22.
//

import UIKit

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
