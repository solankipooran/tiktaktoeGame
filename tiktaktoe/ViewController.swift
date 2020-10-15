//
//  ViewController.swift
//  tiktaktoe
//
//  Created by POORAN SUTHAR on 26/03/20.
//  Copyright © 2020 POORAN SUTHAR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var activeplayer = 1 //cross
    var gamestate = [0,0,0,0,0,0,0,0,0]
    var gameisactive = true
    var winningcombination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBAction func action(_ sender: AnyObject) {
        if gamestate[sender.tag-1] == 0 && gameisactive == true {
            gamestate[sender.tag-1] = activeplayer
            if activeplayer == 1 {
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State())
                activeplayer = 2
            }else {
                sender.setImage(UIImage(named: "zero.png"), for: UIControl.State())
                activeplayer = 1
            }
        }
        for combination in winningcombination{
            var count = 1
            if gamestate[combination[0]] != 0 && gamestate[combination[0]] == gamestate[combination[1]] && gamestate[combination[1]] == gamestate[combination[2]] {
                gameisactive = false
                if gamestate[combination[0]] == 1 {
                    self.showalert(message: "Cross Won")
                    break
                }else if gamestate[combination[0]] == 2 {
                    self.showalert(message: "Zero Won")
                    break
                }
            } else {
                if gameisactive == true {
                    for i  in gamestate {
                        count = i*count
                    }
                    
                    if count != 0{
                        showalert(message: "Match Drawn")
                        break
                    }
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func resetValues(){
        gamestate = [0,0,0,0,0,0,0,0,0]
        gameisactive = true
        activeplayer = 1
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    func showalert(message :String){
        let alert = UIAlertController(title: "Result", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: {ACTION in self.resetValues()}))
        self.present(alert , animated: true)
    }
}

