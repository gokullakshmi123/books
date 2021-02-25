//
//  Books+CoreDataProperties.swift
//  ASsignment
//
//  Created by VENKATARAMA LAKAMRAJU on 2/22/21.
//  Copyright © 2021 VENKATARAMA LAKAMRAJU. All rights reserved.
//
//

import Foundation
import CoreData


extension Books {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Books> {
        return NSFetchRequest<Books>(entityName: "Books")
    }

    @NSManaged public var password: String?
    @NSManaged public var username: String?

}
