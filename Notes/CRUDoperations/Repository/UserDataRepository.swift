//
//  UserDataRepository.swift
//  Notes
//
//  Created by Mahmudul Hasan on 24/12/22.
//

import Foundation
import CoreData
//let swifty = URLComponents(string: "https://swift.org")!

// Print something useful about the URL
protocol UserRepository {
    func create(user: iUser)
    func getAll () -> [iUser]?
    func get(byIdentifier Id: UUID) -> iUser?
    func update(user: iUser) -> Bool
    func delete(record: iUser) -> Bool
}

struct UserDataRepository: UserRepository {
        
        func create(user: iUser) {
            let cdUser = User(context: PersistentStorage.shared.context)
            cdUser.email = user.email
            cdUser.id = user.id
            cdUser.name = user.name
            cdUser.profilePic = user.profilePicture

            PersistentStorage.shared.saveContext()
        }
    
    func getAll() -> [iUser]? {
        let result = PersistentStorage.shared.fetchManagedObject(managedObject: User.self)
        var user : [iUser] = []
        
        result?.forEach({ (cdUser) in
            user.append(cdUser.convertToiUser())
        })
        
        return user
    }
    
    func get(byIdentifier id: UUID) -> iUser? {
        let result = getUser(byidentifier: id)
        guard result != nil else {return nil}
        return result?.convertToiUser()
        
        
    }
    
    func update(user: iUser) -> Bool {
        let result = getUser(byidentifier: user.id)
        guard result != nil else {return false}
        
        result?.email = user.email
        result?.name = user.name
        result?.profilePic = user.profilePicture
        
        PersistentStorage.shared.saveContext()
        
        return true
    }
    
    func delete(record: iUser) -> Bool {
        let result = getUser(byidentifier: record.id)
        guard result != nil else {return false}
        
        PersistentStorage.shared.context.delete(result!)
        return true
    }
    
    private func getUser(byidentifier id: UUID) -> User? {
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
        let predicate = NSPredicate(format: "id==%@" as CVarArg as! String)
        
        fetchRequest.predicate = predicate
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            guard result != nil else {return nil}
            return result
        } catch let error{
            print(error)
        }
        return nil
    }
  

}
