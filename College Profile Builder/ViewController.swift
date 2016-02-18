//
//  ViewController.swift
//  College Profile Builder
//
//  Created by mphipps on 1/25/16.
//  Copyright © 2016 mphipps. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var myTableView: UITableView!
    var colleges : [CollegeClass] = []
    
    override func viewWillAppear(animated: Bool)
    {
        myTableView.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        colleges.append(CollegeClass(Name: "University of Illinois", Location: "Champagne Urbana, IL.", NumStudents: 2, URL: NSURL(string: "http://illinois.edu/")!))
        colleges.append(CollegeClass(Name: "Colombia", Location: "Chicago, IL.", NumStudents: 2))
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myCell.textLabel!.text = colleges[indexPath.row].name
        myCell.detailTextLabel!.text = colleges[indexPath.row].location
        return myCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        //Presents Alert view
        let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        myAlert.addTextFieldWithConfigurationHandler{(collegeTextfield) -> Void in
            collegeTextfield.placeholder = "College Name"
        }
        myAlert.addTextFieldWithConfigurationHandler{(locationTextfield) -> Void in
            locationTextfield.placeholder = "College Location"
        }
        myAlert.addTextFieldWithConfigurationHandler{(numStuTextfield) -> Void in
            numStuTextfield.placeholder = "Number of students"
        }
        myAlert.addTextFieldWithConfigurationHandler{(numStuTextfield) -> Void in
            numStuTextfield.placeholder = "College Webpage"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let numStuTF = myAlert.textFields![2] as UITextField
            let collegeTF = myAlert.textFields![0] as UITextField
            let locationTF = myAlert.textFields![1] as UITextField
            let webPageTF = myAlert.textFields![3] as UITextField
            let toNSURL = NSURL(string: webPageTF.text!)!
            let toInt = Int(numStuTF.text!)!
            self.colleges.append(CollegeClass(Name: collegeTF.text!, Location: locationTF.text!, NumStudents: toInt,  URL: toNSURL))
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        if editButton.tag == 0
        {
            myTableView.editing = true
            editButton.tag = 1
        }
        else
        {
            myTableView.editing = false
            editButton.tag = 0
        }
    }
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailView = segue.destinationViewController as! DetailViewController
        let selectedRow = myTableView.indexPathForSelectedRow!.row
        detailView.college = colleges[selectedRow]
    }
}

