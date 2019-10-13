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
        let photo = photo else { return }
        photoController.create(photo)
        // TODO: change save button to allow for update method
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Methods
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
