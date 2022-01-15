//
//  CDVariableCosts+CoreDataProperties.swift
//  FixedCostManager
//
//  Created by 盛崎耀太 on 2022/01/04.
//
//

import Foundation
import CoreData


extension CDVariableCosts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDVariableCosts> {
        return NSFetchRequest<CDVariableCosts>(entityName: "CDVariableCosts")
    }
    
    @NSManaged public var id: UUID
    @NSManaged public var name: String

}

extension CDVariableCosts : Identifiable {

}
