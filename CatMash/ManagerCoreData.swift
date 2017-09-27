//
//  ManagerCoreData.swift
//  CatMash
//
//  Created by Salah on 27/09/2017.
//  Copyright © 2017 Salah. All rights reserved.
//

import Foundation
import CoreData

class ManagerCoreData{
    
    static var shared = ManagerCoreData()
    
    let managedContext: NSManagedObjectContext
    
    init() {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let applicationDocumentsDirectory = urls[urls.endIndex-1] as URL
        let storeURL = applicationDocumentsDirectory.appendingPathComponent("DataStorage.sqlite")
        
        let managedModel = NSManagedObjectModel.mergedModel(from: nil)
        let storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedModel!)
        
        func addStore() -> NSError?{
            var error: NSError? = nil
            
            let result: NSPersistentStore?
            do {
                let options = [NSMigratePersistentStoresAutomaticallyOption: true, NSInferMappingModelAutomaticallyOption: true]
                result = try storeCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: options)
            } catch let error1 as NSError {
                error = error1
                result = nil
            }
            
            if (result == nil) {
                print("Create persistent store error occurred: \(error?.userInfo)")
            }
            
            return error
        }
        
        var error = addStore()
        if (error != nil) {
            print("Store scheme error. Will remove store and try again. TODO: add scheme migration.")
            do {
                try FileManager.default.removeItem(at: storeURL)
            } catch _ {
            }
            error = addStore()
            
            if (error != nil) {
                print("Unresolved critical error with persistent store: \(error?.userInfo)")
                abort()
            }
        }
        
        managedContext = NSManagedObjectContext()
        managedContext.persistentStoreCoordinator = storeCoordinator
        
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(ManagerCoreData.appDidEnterBackground),
                         name: NSNotification.Name.UIApplicationDidEnterBackground,
                         object: nil)
    }
    
    @objc(appDidEnterBackground)
    func appDidEnterBackground(){
        let error = self.saveContext()
        if (error != nil) {
            print("Application did not save data with reason: \(error?.userInfo)")
        }
    }
    
    //Save context
    func saveContext() -> NSError? {
        print("CoreData : Will save")
        var error: NSError? = nil
        
        if managedContext.hasChanges {
            do {
                try managedContext.save()
            } catch let error1 as NSError {
                error = error1
            }
        }
        
        return error
    }
    
}
