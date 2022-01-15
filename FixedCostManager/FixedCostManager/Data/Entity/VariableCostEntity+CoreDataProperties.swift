//
//  VariableCostEntity+CoreDataProperties.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/12.
//
//

import Foundation
import CoreData


extension VariableCostEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VariableCostEntity> {
        return NSFetchRequest<VariableCostEntity>(entityName: "VariableCostEntity")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String

}

extension VariableCostEntity : Identifiable {

}
