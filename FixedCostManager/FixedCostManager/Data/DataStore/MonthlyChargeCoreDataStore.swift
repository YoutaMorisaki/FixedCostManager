//
//  MonthlyChargeCoreDataStore.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/10.
//

import Foundation
import CoreData

struct MonthlyChargeCoreDataStore {
    let container: NSPersistentContainer
    let entityName = "MonthlyChargeEntity"
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "FixedCostManager")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
    
    func fetch() -> [MonthlyChargeEntity] {
        var monthlyCharges:[MonthlyChargeEntity] = []
        let request:NSFetchRequest = MonthlyChargeEntity.fetchRequest()
        do {
            monthlyCharges = try container.viewContext.fetch(request)
        } catch {
            // TODO 例外処理
            //logger.error("error in fetching data from coredata")
            
        }
        return monthlyCharges
    }
    
    func get(month:Int) -> [MonthlyChargeEntity]{
        var monthlyCharges:[MonthlyChargeEntity] = []
        let request:NSFetchRequest = MonthlyChargeEntity.fetchRequest()
        request.predicate = NSPredicate.init(format: "month == %@", month)
        do {
            monthlyCharges = try container.viewContext.fetch(request)
        } catch {
            // TODO 例外処理
            //logger.error("error in fetching data from coredata")
            
        }
        return monthlyCharges
    }

    func get(id:UUID) -> MonthlyChargeEntity?{
        var monthlyCharge:MonthlyChargeEntity? = nil
        let request:NSFetchRequest = MonthlyChargeEntity.fetchRequest()
        request.predicate = NSPredicate.init(format: "id == %@", id as CVarArg)
        do {
            let result = try container.viewContext.fetch(request)
            
            if result.count > 0{
                monthlyCharge = result.first
            }
            else{
                monthlyCharge = nil
            }
        } catch {
            // TODO 例外処理
            //logger.error("error in fetching data from coredata")
            
        }
        return monthlyCharge
    }
    
    func update(id: UUID, cost: Int){
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:entityName)
        fetchRequest.predicate = NSPredicate(format: "id = %@", id as CVarArg)

        do {
            let myResults = try container.viewContext.fetch(fetchRequest)

            for myData in myResults {
                myData.setValue(cost, forKeyPath: "cost")
            }

            save()
        } catch let error as NSError {
            print("\(error), \(error.userInfo)")
        }
    }
    
    func create(id:UUID, cost: Int, year:Int, month:Int, variableCostId:UUID) {
        let description = NSEntityDescription.entity(forEntityName: entityName, in: container.viewContext)!
        let newCDItem = MonthlyChargeEntity(entity: description, insertInto: container.viewContext)
        newCDItem.id = id
        newCDItem.cost = Int32(cost)
        newCDItem.year = Int32(year)
        newCDItem.month = Int32(month)
        newCDItem.variableCostId = variableCostId
        save()
    }

    func save() {
        if !container.viewContext.hasChanges { return }
        do {
            try container.viewContext.save()
        } catch {
            print(error)
        }
    }

}
