//
//  VariableCostCoreDataStore.swift
//  FixedCostManager
//
//  Created by youtaMorisaki on 2022/01/10.
//

import Foundation
import CoreData

struct VariableCostCoreDataStore {
    let container: NSPersistentContainer
    let entityName = "VariableCostEntity"
    
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
    
    func fetch() -> [VariableCostEntity] {
        var variableCosts:[VariableCostEntity] = []
        let request:NSFetchRequest = VariableCostEntity.fetchRequest()
        do {
            variableCosts = try container.viewContext.fetch(request)
        } catch {
            // TODO 例外処理
            //logger.error("error in fetching data from coredata")
            
        }
        return variableCosts
    }
    
    func create(id:UUID, name: String) {
        let description = NSEntityDescription.entity(forEntityName: entityName, in: container.viewContext)!
        let newCDItem = VariableCostEntity(entity: description, insertInto: container.viewContext)
        newCDItem.id = id
        newCDItem.name = name
        save()
    }
    
    func update(id: UUID, name: String){
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:entityName)
        fetchRequest.predicate = NSPredicate(format: "id = %@", id as CVarArg)

        do {
            let myResults = try container.viewContext.fetch(fetchRequest)

            for myData in myResults {
                myData.setValue(name, forKeyPath: "name")
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


