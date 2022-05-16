//
//  ShoppingModel.swift
//  MyTable3Weeks
//
//  Created by bro on 2022/05/16.
//

import Foundation
import RealmSwift

class Shopping: Object {
    //PK(필수) : Int, String, UUID, ObjectId -> AutoIncrement
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var title: String
    
    
    convenience init(title: String) {
        self.init()
        
        self.title = title
    }
    
}
