//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Craig Swanson on 10/11/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import UIKit

// private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    // MARK: Properties
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.reloadData()
        setTheme()

//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    
    
    @IBAction func unwindToPhotoCollectionViewController(_ sender: UIStoryboardSegue) {
        collectionView.reloadData()
        setTheme()
    }
    
    


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ShowPhotoDetailSegue":
            guard let photoDetailVC = segue.destination as? PhotoDetailViewController else { fatalError() }
            guard let cell = sender as? UICollectionViewCell,
                let indexPath = self.collectionView.indexPath(for: cell) else {return}
                photoDetailVC.photo = photoController.photos[indexPath.item]
                photoDetailVC.themeHelper = themeHelper
                photoDetailVC.photoController = photoController

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

    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { fatalError("The cell was not found") }
        
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        return cell
    }

    // MARK: UICollectionViewDelegate


    
    // MARK: - Methods
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        switch themePreference {
        case "Dark":
            collectionView.backgroundColor = UIColor.systemGray5
        case "Green":
            collectionView.backgroundColor = UIColor.systemGreen
        default:
            collectionView.backgroundColor = UIColor.clear
        }
        collectionView.reloadData()
    }

}
