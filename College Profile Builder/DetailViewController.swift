//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by mphipps on 1/28/16.
//  Copyright © 2016 mphipps. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var numStu: UITextField!
    @IBOutlet weak var webPageTF: UITextField!
    let imagePicker = UIImagePickerController()
    
    var college : CollegeClass!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imagePicker.delegate = self
        nameTF.text = college.name
        locationTF.text = college.location
        numStu.text = String(college.numStudents)
        myImageView.image = college.image
        webPageTF.text = String(college.uRL!)
    }
    @IBAction func saveButtonTapped(sender: UIButton)
    {
        college.image = myImageView.image!
        college.name = nameTF.text!
        college.location = locationTF.text!
        college.numStudents = Int(numStu.text!)!
        college.uRL = NSURL(string: webPageTF.text!)
    }
    
    @IBAction func onPageButtonTapped(sender: UIButton)
    {
        let sVC = SFSafariViewController(URL: college.uRL!)
        sVC.delegate = self
        presentViewController(sVC, animated: true, completion: nil)
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onPictureTap(sender: UIButton)
    {
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        imagePicker.dismissViewControllerAnimated(true) { () -> Void in
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            self.myImageView.image = selectedImage
        }
    }
}
