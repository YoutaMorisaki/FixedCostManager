//
//  FixedCostEntity+CoreDataProperties.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/12.
//
//

import Foundation
import CoreData


extension FixedCostEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FixedCostEntity> {
        return NSFetchRequest<FixedCostEntity>(entityName: "FixedCostEntity")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var cost: Int32
}

extension FixedCostEntity : Identifiable {

}
