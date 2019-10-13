//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Craig Swanson on 10/9/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String = "SetThemePreference"
    var themePreference: String? {
        let userDefaults = UserDefaults.standard
        return userDefaults.string(forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        }
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToGreen() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Green", forKey: themePreferenceKey)
    }
}
