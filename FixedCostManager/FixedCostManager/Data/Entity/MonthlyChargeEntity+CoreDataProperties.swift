//
//  MonthlyChargeEntity+CoreDataProperties.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/12.
//
//

import Foundation
import CoreData


extension MonthlyChargeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MonthlyChargeEntity> {
        return NSFetchRequest<MonthlyChargeEntity>(entityName: "MonthlyChargeEntity")
    }

    @NSManaged public var id: UUID
    @NSManaged public var cost: Int32
    @NSManaged public var year: Int32
    @NSManaged public var month: Int32
    @NSManaged public var variableCostId: UUID

}

extension MonthlyChargeEntity : Identifiable {

}
