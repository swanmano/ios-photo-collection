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

        // Do any additional setup after loading the view.
    }
    
    // MARK: Actions
    @IBAction func addPhoto(_ sender: UIButton) {
    }
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
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