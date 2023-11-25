//
//  ViewController.swift
//  Verstka_Denis
//
//  Created by New on 25.11.2023.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var menuBottom1: UIButton!
    
    @IBOutlet weak var menuBottom2: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setPopupButtom1()
        setPopupButtom2()
    }
    
    func setPopupButtom1(){
        let optionClosure = {(action : UIAction) in print (action.title)}
        menuBottom1.menu = UIMenu(children : [
            UIAction(title:"option1", state : .on , handler: optionClosure),
            UIAction(title:"option2",  handler: optionClosure),
            UIAction(title:"option3",  handler: optionClosure)
        ])
        menuBottom1.showsMenuAsPrimaryAction = true
        menuBottom1.changesSelectionAsPrimaryAction = true
    }
    
    func setPopupButtom2(){
        let optionClosure = {(action : UIAction) in print (action.title)}
        menuBottom2.menu = UIMenu(children : [
            UIAction(title:"option1", state : .on , handler: optionClosure),
            UIAction(title:"option2",  handler: optionClosure),
            UIAction(title:"option3",  handler: optionClosure)
        ])
        menuBottom2.showsMenuAsPrimaryAction = true
        menuBottom2.changesSelectionAsPrimaryAction = true
    }

}

