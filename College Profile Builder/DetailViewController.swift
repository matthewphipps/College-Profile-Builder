//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by mphipps on 1/28/16.
//  Copyright © 2016 aHuesing. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var numStu: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var college : CollegeClass!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameTF.text = college.name
        locationTF.text = college.location
        numStu.text = String(college.numStudents)
        myImageView.image = college.image
    }
    @IBAction func saveButtonTapped(sender: UIButton)
    {
        college.name = nameTF.text!
        college.location = locationTF.text!
        college.numStudents = Int(numStu.text!)!
        tableView.reloadData()
    }
}
