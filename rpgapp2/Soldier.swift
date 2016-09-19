//
//  Soldier.swift
//  rpgapp2
//
//  Created by Carlos Flores Guardado on 9/16/16.
//  Copyright © 2016 Carlos Flores Guardado. All rights reserved.
//

import Foundation

class Soldier: Character {
    
    private var _name: String
    
    var name: String {
        return _name
    }
    
    init(name: String, hp: Int, ap: Int) {
        _name = name
        super.init(startingHp: hp, startingAp: ap)
    }
    
    
}