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
    
    init(themePreferenceKey: String) {
        self.themePreferenceKey = themePreferenceKey
    }
    
    func setThemePreferenceToDark() {
        UserDefaults.standard.set("Dark", forKey: themePreferenceKey)
    }
}
