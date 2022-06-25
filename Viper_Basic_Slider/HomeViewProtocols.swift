//
//  HomeViewProtocols.swift
//  Viper_Basic_Slider
//
//  Created by Kamal Sharma R on 25/06/22.
//

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

// router protocol
protocol HomeViewWireframe: AnyObject {
    var viewController: UIViewController? { get }
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
