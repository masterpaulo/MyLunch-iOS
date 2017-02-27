//
//  SelectPhotosController.swift
//  MyLunch
//
//  Created by Jackielynn Ramos on 24/02/2017.
//  Copyright © 2017 Jackielynn Ramos. All rights reserved.
//

import UIKit

class SelectPhotosController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        button1.tag = 1
        button2.tag = 2
        button3.tag = 3
        button4.tag = 4
        
        button2.isHidden = true
        button3.isHidden = true
        button4.isHidden = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPhotoAction(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            imagePicker.restorationIdentifier = "\(sender.tag)"
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            if let identifier = picker.restorationIdentifier {
                switch identifier {
                case "Optional(1)":
                    imageView1.image = image
                    button1.isHidden = true
                    button2.isHidden = false
                    break
                case "Optional(2)":
                    imageView2.image = image
                    button2.isHidden = true
                    button3.isHidden = false
                    break
                case "Optional(3)":
                    imageView3.image = image
                    button3.isHidden = true
                    button4.isHidden = false
                    break
                case "Optional(4)":
                    imageView4.image = image
                    button4.isHidden = true
                    break
                default:
                    NSLog("Something is wrong");
                    break
                }
            }
        } else{
            NSLog("Something went wrong")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
