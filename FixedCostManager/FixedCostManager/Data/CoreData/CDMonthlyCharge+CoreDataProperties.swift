//
//  CDMonthlyCharge+CoreDataProperties.swift
//  FixedCostManager
//
//  Created by 盛崎耀太 on 2022/01/04.
//
//

import Foundation
import CoreData


extension CDMonthlyCharge {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMonthlyCharge> {
        return NSFetchRequest<CDMonthlyCharge>(entityName: "CDMonthlyCharge")
    }

    @NSManaged public var id: UUID
    @NSManaged public var cost: Int32
    @NSManaged public var year: Int32
    @NSManaged public var month: Int32
    @NSManaged public var variableCostId: UUID

}

extension CDMonthlyCharge : Identifiable {

}
