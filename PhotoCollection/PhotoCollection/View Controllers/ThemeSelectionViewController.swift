//
//  ThemeSelectionViewController.swift
//  PhotoCollection
//
//  Created by Craig Swanson on 10/11/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {
    
    // MARK: Properties
    var themeHelper: ThemeHelper?
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Actions
    // The intent of these actions is to run the setThemePreference functions and then return to the PhotosCollectionViewController, but it is doing that in the reverse order and executing the unwind, which updates the collection view and then it comes back here to call the setTheme code.
    @IBAction func selectDarkThemeButton(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectGreenThemeButton(_ sender: UIButton) {
        themeHelper?.setThemePreferenceToGreen()
        dismiss(animated: true, completion: nil)
    }

}
