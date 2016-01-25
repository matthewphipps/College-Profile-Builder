//
//  CollegeClass.swift
//  College Profile Builder
//
//  Created by mphipps on 1/25/16.
//  Copyright © 2016 aHuesing. All rights reserved.
//

import UIKit

class CollegeClass: NSObject
{
    var name = ""
    var location = ""
    var numStudents = 0
    var image = UIImage(named: "default")
    
    init(Name: String, Location: String, NumStudents: Int, Image: UIImage)
    {
        super.init()
        name = Name
        location = Location
        numStudents = NumStudents
        image = Image
    }
    init(Name: String, Location: String)
    {
        super.init()
        name = Name
        location = Location
    }
    init(Name: String, Location: String, NumStudents: Int)
    {
        super.init()
        name = Name
        location = Location
        numStudents = NumStudents
    }

}
