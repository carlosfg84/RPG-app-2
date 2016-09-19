//
//  Character.swift
//  rpgapp2
//
//  Created by Carlos Flores Guardado on 9/16/16.
//  Copyright © 2016 Carlos Flores Guardado. All rights reserved.
//

import Foundation

class Character {
    private var _hp: Int
    private var _attackPower: Int
    
    var hp: Int {
        return _hp
    }
    
    var attackPower: Int {
        return _attackPower
    }
    
    var isAlive: Bool {
        if hp <= 0 {
            return false
        } else {
            return true
        }
    }
    
    init(startingHp: Int, startingAp: Int) {
        _hp = startingHp
        _attackPower = startingAp
    }
    
    func attemptAttack(attackPwr: Int) {
        _hp -= attackPwr
    }
    
}


