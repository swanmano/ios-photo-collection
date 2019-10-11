//
//  ThemeHelper.swift
//  PhotoCollection
//
//  Created by Craig Swanson on 10/9/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey: String
    var themePreference: String? {
        return UserDefaults.standard.string(forKey: themePreferenceKey)
    }
    
    init(themePreferenceKey: String) {
        self.themePreferenceKey = themePreferenceKey
    }
    
    func setThemePreferenceToDark() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Dark", forKey: themePreferenceKey)
    }
    
    func setThemePreferenceToYourColorHere() {
        let userDefaults = UserDefaults.standard
        userDefaults.set("Color", forKey: themePreferenceKey)
    }
}
