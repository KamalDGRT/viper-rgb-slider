//
//  HomeViewController.swift
//  Viper_Basic_Slider
//
//  Created by Kamal Sharma R on 22/06/22.
//

import UIKit

protocol ColorValueDelegate {
    func onColorValueChange() -> ()
}

class HomeViewController: UIViewController {
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet weak var lblRgbValue: UILabel!
    
    var presenter: HomeViewPresentation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCurrentColor()
    }
    
    @IBAction func onRedValueChange(_ sender: UISlider) {
        print("Red value received: \(sender.value)")
        onColorValueChange()
    }
    
    @IBAction func onGreenValueChange(_ sender: UISlider) {
        print("Green value received: \(sender.value)")
        onColorValueChange()
    }
    
    @IBAction func onBlueValueChange(_ sender: UISlider) {
        print("Blue value received: \(sender.value)")
        onColorValueChange()
    }
    
}

extension HomeViewController: HomeView {
    func loadCurrentColor(rgb: (CGFloat, CGFloat, CGFloat)) {
        lblRgbValue.text = "RGB (\(rgb.0), \(rgb.1), \(rgb.2))"
        
        sliderRed.value = Float(rgb.0)
        sliderGreen.value = Float(rgb.1)
        sliderBlue.value = Float(rgb.2)
        
        self.view.backgroundColor = UIColor(
            red: rgb.0/255,
            green: rgb.1/255,
            blue: rgb.2/255,
            alpha: 1
        )
    }
}


extension HomeViewController: ColorValueDelegate {
    /*!
     * @discussion Track color value changes
     * @params Void
     * @return Void
     */
    func onColorValueChange() {
        let step: Float = 1
        
        let red = CGFloat(round(sliderRed.value / step) * step)
        let green = CGFloat(round(sliderGreen.value / step) * step)
        let blue = CGFloat(round(sliderBlue.value / step) * step)
        
        lblRgbValue.text = "RGB (\(red), \(green), \(blue))"
        
        self.view.backgroundColor = UIColor(
            red: red/255,
            green: green/255,
            blue: blue/255,
            alpha: 1
        )
        
        saveCurrentColor(rgb: (red, green, blue))
    }
    
    /*!
     * @discussion RGB values to be saved. Values passed should be between 0 - 255
     * @params rgb
     * @return Void
     */
    func saveCurrentColor(rgb: (CGFloat, CGFloat, CGFloat)) -> (Void) {
        print("Current colors are saved!")
        presenter?.onColorValueChange(rgb: rgb)
    }
    
    /*!
     * @discussionLoad current color, RGB values will be between 0-255
     * @params Void
     * @return (CGFloat, CGFloat, CGFloat)
     */
    func loadCurrentColor() -> () {
        print("View Controller is delegating loadCurrentColor to presenter")
        presenter?.onLoadCurrentColor()
    }
}
