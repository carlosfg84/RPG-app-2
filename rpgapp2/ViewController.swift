//
//  ViewController.swift
//  rpgapp2
//
//  Created by Carlos Flores Guardado on 9/15/16.
//  Copyright © 2016 Carlos Flores Guardado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var playerOneAttckBtn: UIButton!
    @IBOutlet weak var playerTwoAttckBtn: UIButton!
    @IBOutlet weak var restartBtn: UIButton!
    @IBOutlet weak var playerOneHpLbl: UILabel!
    @IBOutlet weak var playerTwoHpLbl: UILabel!
    @IBOutlet weak var playerOneImg: UIImageView!
    @IBOutlet weak var playerTwoImg: UIImageView!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var playerOneAttackLbl: UILabel!
    @IBOutlet weak var playerTwoAttackLbl: UILabel!
    
    var soldier: Soldier!
    var orc: Orc!
    var timer1: NSTimer = NSTimer()
    var timer2: NSTimer = NSTimer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGame()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startGame() {
        p1EnableButton()
        p2EnableButton()
        restartBtn.hidden = true
        playerOneImg.hidden = false
        playerTwoImg.hidden = false
        statusLbl.text = "ATTACK!!"
        soldier = Soldier(name: "Leonidas", hp: 110, ap: 20)
        orc = Orc(name: "Willy", hp: 120, ap: 20)
        playerOneHpLbl.hidden = false
        playerTwoHpLbl.hidden = false
        playerOneAttckBtn.hidden = false
        playerTwoAttckBtn.hidden = false
        playerOneAttackLbl.hidden = false
        playerTwoAttackLbl.hidden = false
        playerOneHpLbl.text = "\(orc.hp) HP"
        playerTwoHpLbl.text = "\(soldier.hp) HP"

    }
    
    func p1EnableButton() {
        playerOneAttckBtn.enabled = true
    }
    
    func p2EnableButton() {
        playerTwoAttckBtn.enabled = true
    }
    
    func startTimer1() {
        timer1 = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.p1EnableButton), userInfo: nil, repeats: false)
    }
    
    func startTimer2() {
        timer2 = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.p2EnableButton), userInfo: nil, repeats: false)
    }
    
    func restartTimer1() {
        timer1.invalidate()
        startTimer1()
    }
    
    func restartTimer2() {
        timer2.invalidate()
        startTimer2()
    }


    @IBAction func resetPressed(sender: AnyObject) {
        startGame()
    }
    
    @IBAction func attackOnePressed(sender: AnyObject) {
        
        playerTwoAttckBtn.enabled = false
        
        soldier.attemptAttack(orc.attackPower)
        
        if soldier.isAlive {
            playerTwoHpLbl.text = "\(soldier.hp) HP"
        } else {
            statusLbl.text = orc.name + " WON!"
            playerTwoImg.hidden = true
            playerTwoAttckBtn.hidden = true
            playerTwoAttackLbl.hidden = true
            playerTwoHpLbl.hidden = true
            restartBtn.hidden = false
        }
        
        restartTimer2()
        //NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.p2EnableButton), userInfo: nil, repeats: false)
        
        
    }
    
    
    @IBAction func attackTwoPressed(sender: AnyObject) {
        
        playerOneAttckBtn.enabled = false
        
        orc.attemptAttack(soldier.attackPower)
        
        if orc.isAlive {
            playerOneHpLbl.text = "\(orc.hp) HP"
        } else {
            statusLbl.text = soldier.name + " WON!"
            playerOneImg.hidden = true
            playerOneAttckBtn.hidden = true
            playerOneAttackLbl.hidden = true
            playerOneHpLbl.hidden = true
            restartBtn.hidden = false
        }
        
        restartTimer1()
        //NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.p1EnableButton), userInfo: nil, repeats: false)
    }

}

