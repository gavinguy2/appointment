//
//  DetailViewController.swift
//  Appointment
//
//  Created by Stringham on 10/22/18.
//  Copyright © 2018 Stringham. All rights reserved.
//

import UIKit
class DetailViewController: UIViewController,UITextFieldDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var typeField: UITextField!
    @IBOutlet var locationField: UITextField!
    @IBOutlet var dateField: UITextField!
    @IBOutlet var timeField: UITextField!
    @IBOutlet var imageView: UIImageView!
    
    var item: Item!{ didSet {
        navigationItem.title = item.appType
        }
    }
    var imageStore: ImageStore!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        typeField.text = item.appType
        locationField.text = item.appLocation
        dateField.text = item.appDate
        timeField.text = item.appTime
        let key = item.itemKey
        let imageToDisplay = imageStore.image(forKey: key)
        imageView.image = imageToDisplay
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        item.appType = typeField.text ?? ""
        item.appLocation = locationField.text ?? ""
        item.appDate = dateField.text ?? ""
        item.appTime = timeField.text ?? ""
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func takePicture(_ sender: UIBarButtonItem) {
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        } else {
            imagePicker.sourceType = .photoLibrary
        }
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    
    }
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String: Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageStore.setImage(image, forKey: item.itemKey)
        
        imageView.image = image
       
        dismiss(animated: true, completion: nil)
    }

}
