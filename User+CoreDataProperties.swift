//
//  User+CoreDataProperties.swift
//  Notes
//
//  Created by Mahmudul Hasan on 24/12/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var profilePic: Data?
    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var email: String?

    func convertToiUser() -> iUser {
      return iUser(name: self.name , email: self.email , profilePicture: self.profilePic, id: self.id!)
        
        
        
        
    }
}

extension User : Identifiable {

}


