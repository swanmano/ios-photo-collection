//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Craig Swanson on 10/11/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ShowPhotoDetailSegue":
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController else { fatalError() }
            
            // there is a high probability that this next line won't work
            if let indexPath = collectionView.indexPath(for: PhotosCollectionViewCell()) {
                photoDetailVC.photo = photoController.photos[indexPath.item]
                photoDetailVC.themeHelper = themeHelper
                photoDetailVC.photoController = photoController
            }
        case "AddNewPhotoSegue":
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController else { fatalError() }
                photoDetailVC.themeHelper = themeHelper
                photoDetailVC.photoController = photoController
        case "SelectThemeSegue":
            guard let themeSelectionVC = segue.destination as? ThemeSelectionViewController else {
                fatalError() }
            themeSelectionVC.themeHelper = themeHelper
        default:
            return
        }
    }

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { fatalError("The cell was not found") }
        
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    // MARK: - Methods
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        switch themePreference {
        case "Dark":
            self.view.backgroundColor = UIColor.darkGray
        case "Green":
            self.view.backgroundColor = UIColor.green
        default:
            self.view.backgroundColor = UIColor.clear
        }
    }

}
