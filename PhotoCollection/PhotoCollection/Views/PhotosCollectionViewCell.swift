//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Craig Swanson on 10/11/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: Outlets
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    
    func updateViews() {
        guard let photo = photo else { fatalError("A photo image was not loaded in the cell.")}
        photoImage.image = UIImage(data: photo.imageData)
        photoLabel.text = photo.title
    }
}
