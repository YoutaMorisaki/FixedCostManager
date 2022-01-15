//
//  FixedCostCoreDataStore.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/10.
//

import Foundation
import CoreData

struct FixedCostCoreDataStore {
    let container: NSPersistentContainer
    let entityName = "FixedCostEntity"
    
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
    
    func fetch() -> [FixedCostEntity] {
        var fixedCosts:[FixedCostEntity] = []
        let request:NSFetchRequest = FixedCostEntity.fetchRequest()
        do {
            fixedCosts = try container.viewContext.fetch(request)
        } catch {
            // TODO 例外処理
        }
        return fixedCosts
    }
    
    func create(id: UUID, name:String, cost:Int) {
        let description = NSEntityDescription.entity(forEntityName: entityName, in: container.viewContext)!
        let newCDItem = FixedCostEntity(entity: description, insertInto: container.viewContext)
        newCDItem.id = id
        newCDItem.name = name
        newCDItem.cost = Int32(cost)
        save()
    }
    
    func update(id: UUID, name: String, cost:Int){
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:entityName)
        fetchRequest.predicate = NSPredicate(format: "id = %@", id as CVarArg)

        do {
            let myResults = try container.viewContext.fetch(fetchRequest)

            for myData in myResults {
                myData.setValue(name, forKeyPath: "name")
                myData.setValue(cost, forKeyPath: "cost")
            }

            save()
        } catch let error as NSError {
            print("\(error), \(error.userInfo)")
        }
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
