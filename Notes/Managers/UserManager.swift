//
//  UserManager.swift
//  Notes
//
//  Created by Mahmudul Hasan on 25/12/22.
//

import Foundation
import CoreData

struct UserManager {
    
        private let _userDataRepository = UserDataRepository ()
    
        func createUser(user: iUser) {
            _userDataRepository.create(user: user)
        }

        func fetchUser() -> [iUser]? {
           
            return _userDataRepository.getAll()
        }
    
        func fetchUser(byIdentifier id: UUID) -> iUser? {
            return _userDataRepository.get(byIdentifier: id)
        }

        func updateUser(user: iUser) -> Bool {
            
            return _userDataRepository.update(user: user)
        }

        func deleteUser(user: iUser) -> Bool {
            
            return _userDataRepository.delete(record: user)
        }
}
