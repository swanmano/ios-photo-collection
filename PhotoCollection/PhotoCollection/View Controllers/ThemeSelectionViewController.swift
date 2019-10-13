//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Craig Swanson on 10/11/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import UIKit

protocol ChangeThemeUpdate {
    func updateTheme()
}

class ThemeSelectionViewController: UIViewController {
    
    // MARK: Properties
    var themeHelper: ThemeHelper?
    var delegate: ChangeThemeUpdate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Actions
    // Run the setThemePreference methods and then return to the PhotosCollectionViewController and run setTheme() via the delegate.
    @IBAction func selectDarkThemeButton(_ sender: UIButton) {
        guard let themeHelper = themeHelper else { return }
        themeHelper.setThemePreferenceToDark()
        delegate?.updateTheme()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectGreenThemeButton(_ sender: UIButton) {
        guard let themeHelper = themeHelper else { return }
        themeHelper.setThemePreferenceToGreen()
        delegate?.updateTheme()
        dismiss(animated: true, completion: nil)
    }

}
