//
//  KeyValue.swift
//  Oncology Medibase
//
//  Created by Hadi Yazdi on 1/11/17.
//  Copyright © 2017 Hadi Yazdi. All rights reserved.
//

import Foundation
import RealmSwift

class KeyValue: Object {
    
    static var realm = KeyValue.getDefaultRealm()
    
    dynamic var key = ""
    dynamic var stringValue: String?
    dynamic var dateValue: Date?
    let intValue = RealmOptional<Int>()
    let floatValue = RealmOptional<Float>()
    let doubleValue = RealmOptional<Double>()
    let boolValue = RealmOptional<Bool>()
    
    override static func primaryKey() -> String? {
        return "key"
    }
    
    
    static func setString(key: String, value: String) {
        let x = KeyValue()
        x.key = key
        x.stringValue = value
        x.save()
    }
    
    static func setInt(key: String, value: Int) {
        let x = KeyValue()
        x.key = key
        x.intValue.value = value
        x.save()
    }
    
    static func setFloat(key: String, value: Float) {
        let x = KeyValue()
        x.key = key
        x.floatValue.value = value
        x.save()
    }
    
    static func setDouble(key: String, value: Double) {
        let x = KeyValue()
        x.key = key
        x.doubleValue.value = value
        x.save()
    }
    
    static func setBool(key: String, value: Bool) {
        let x = KeyValue()
        x.key = key
        x.boolValue.value = value
        x.save()
    }
    
    static func setDate(key: String, value: Date) {
        let x = KeyValue()
        x.key = key
        x.dateValue = value
        x.save()
    }
    
    static func getObject(key: String) -> KeyValue? {
        return KeyValue.realm?.object(ofType: KeyValue.self, forPrimaryKey: key as AnyObject)
    }
    
    static func getString(key: String) -> String? {
        return KeyValue.realm?.object(ofType: KeyValue.self, forPrimaryKey: key as AnyObject)?.stringValue
    }
    
    static func getInt(key: String) -> Int? {
        return KeyValue.realm?.object(ofType: KeyValue.self, forPrimaryKey: key as AnyObject)?.intValue.value
    }
    
    static func getFloat(key: String) -> Float? {
        return KeyValue.realm?.object(ofType: KeyValue.self, forPrimaryKey: key as AnyObject)?.floatValue.value
    }
    
    static func getDouble(key: String) -> Double? {
        return KeyValue.realm?.object(ofType: KeyValue.self, forPrimaryKey: key as AnyObject)?.doubleValue.value
    }
    
    static func getBool(key: String) -> Bool? {
        return KeyValue.realm?.object(ofType: KeyValue.self, forPrimaryKey: key as AnyObject)?.boolValue.value
    }
    
    static func getDate(key: String) -> Date? {
        return KeyValue.realm?.object(ofType: KeyValue.self, forPrimaryKey: key as AnyObject)?.dateValue
    }
    
    static func keyExists(key: String) -> Bool {
        if KeyValue.getObject(key: key) != nil {
            return true
        }
        return false
    }
    
    private func save() {
        try! KeyValue.realm?.write {
            KeyValue.realm?.add(self, update: true)
        }
    }
    
    func delete() {
        try! KeyValue.realm?.write {
            KeyValue.realm?.delete(self)
        }
    }
    
    private static func getDefaultRealm() -> Realm? {
        
        var realm: Realm?
        
        do {
            realm = try Realm()
        } catch _ as NSError {
            return nil
        }
        
        return realm
    }
    
}
