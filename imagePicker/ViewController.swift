//
//  ViewController.swift
//  imagePicker
//
//  Created by Ripon sk on 13/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(imageTap))
        imageview.isUserInteractionEnabled = true
        imageview.addGestureRecognizer(gesture)
    }
    
    @objc func imageTap(){
        let imgController = UIImagePickerController()
        imgController.delegate = self
        imgController.allowsEditing = true
        imgController.sourceType = .photoLibrary
        self.present(imgController, animated: true)
    }


}
extension ViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let img = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            imageview.image = img
            self.dismiss(animated: true)
            
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
    
}

