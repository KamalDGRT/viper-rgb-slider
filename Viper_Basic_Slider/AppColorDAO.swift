//
//  AppColorDAO.swift
//  Viper_Basic_Slider
//
//  Created by Kamal Sharma R on 25/06/22.
//
// App Color Data Acces Object

// This is the Entity in the HomeView Viper structure

import UIKit

class AppColorDAO {
    func save(rgb: (CGFloat, CGFloat, CGFloat)) -> (Void) {
        UserDefaults.standard.set(rgb.0, forKey: "Red")
        UserDefaults.standard.set(rgb.1, forKey: "Green")
        UserDefaults.standard.set(rgb.2, forKey: "Blue")
    }
    
    func fetch() -> ((CGFloat, CGFloat, CGFloat)) {
        let red = CGFloat(UserDefaults.standard.float(forKey: "Red"))
        let green = CGFloat(UserDefaults.standard.float(forKey: "Green"))
        let blue = CGFloat(UserDefaults.standard.float(forKey: "Blue"))
        
        return (red, green, blue)
    }
}
