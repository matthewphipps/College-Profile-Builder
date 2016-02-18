//
//  CollegeClass.swift
//  College Profile Builder
//
//  Created by mphipps on 1/25/16.
//  Copyright © 2016 mphipps. All rights reserved.
//

import UIKit

class CollegeClass: NSObject
{
    var name = ""
    var location = ""
    var numStudents = 0
    var image =  UIImage(named:"School")!
    var uRL = NSURL(string: "https://www.google.com/")
    
    init(Name: String, Location: String, NumStudents: Int, Image: UIImage, URL: NSURL)
    {
        super.init()
        name = Name
        location = Location
        numStudents = NumStudents
        image = Image
        uRL = URL
    }
    init(Name: String, Location: String, NumStudents: Int)
    {
        super.init()
        name = Name
        location = Location
        numStudents = NumStudents
    }
    init(Name: String, Location: String, NumStudents: Int,  URL: NSURL)
    {
        super.init()
        name = Name
        location = Location
        numStudents = NumStudents
        uRL = URL
    }

}
