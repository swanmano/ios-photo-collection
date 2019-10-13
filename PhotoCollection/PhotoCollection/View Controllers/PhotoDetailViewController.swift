//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Craig Swanson on 10/11/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import UIKit



class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    let imagePicker = UIImagePickerController()
    
    // MARK: Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var photoDescription: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        imagePicker.delegate = self
    }

    // MARK: Actions
    @IBAction func addPhoto(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        guard let photoController = photoController,
            let photoImage = photoImageView.image,
            let photoDescription = photoDescription.text else { return }
        // Take the image from the UIImageView and convert it to data. In this case using pngData().
        let imageData = photoImage.pngData()!
        // Make a photo and run the method from PhotoController to append it to the array.
        let photo = Photo(imageData: imageData, title: photoDescription)
        photoController.create(photo)
        // TODO: change save button to allow for update method
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Methods
    
    // Change the background color based on the user selected color theme
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
        // If there is a photo, convert the data to a UIImage and set that as the photoImageView image, and set the photoDescription text field to the photo title.
        guard let photo = photo else { return }
        let data = photo.imageData
        let photoImage = UIImage(data: data)
        photoImageView.image = photoImage
        photoDescription.text = photo.title
    }
    
    // Most of the imagePicker code was found online.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoImageView.contentMode = .scaleAspectFit
            photoImageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

}
