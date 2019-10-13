//
//  UIImagePickerController.swift
//  PhotoCollection
//
//  Created by Craig Swanson on 10/12/19.
//  Copyright © 2019 Craig Swanson. All rights reserved.
//

import UIKit

class PhotoPickerController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self

        // Do any additional setup after loading the view.
    }

}
