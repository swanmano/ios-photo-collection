//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Craig Swanson on 10/11/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    // MARK: Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    // MARK: Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoDescription: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    // MARK: Actions
    @IBAction func addPhoto(_ sender: UIButton) {
    }
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
    }
    
    // MARK: Methods
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
            switch themePreference {
            case "Dark":
                view.backgroundColor = UIColor.systemGray5
            case "Green":
                view.backgroundColor = UIColor.systemGreen
            default:
                view.backgroundColor = UIColor.clear
            }
    }
    
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        let data = photo.imageData
        let photoImage = UIImage(data: data)
        photoImageView.image = photoImage
        photoDescription.text = photo.title
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
