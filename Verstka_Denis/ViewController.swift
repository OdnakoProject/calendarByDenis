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
        var cells : [CellOfData] = monthYearToCells(year: 2015, month: 7)
        for cell1 in cells{
            print ( "\(String(cell1.activeLy))    \(String(cell1.chislo))     \(String(cell1.today))\n")
        }
    
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
    
    private func monthYearToCells (year:Int , month: Int) -> [CellOfData] {
        let getDate = Date()
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy, HH:mm:ss"
        print(dateFormatter.string(from: getDate))
        dateFormatter.dateFormat = "dd, MMMM yyyy hh:mm" // в кавычках задается формат в котором хочешь видеть дату. В твоем случае надо dd/MM
        print (dateFormatter.string(from: getDate))
        dateFormatter.setLocalizedDateFormatFromTemplate("EEE MMM d yyyy")
        print(dateFormatter.string(from: getDate))
        
        
        
        
        let basicCell = CellOfData(activeLy: false, chislo: 0, today: false)
        var cellsOfData : [CellOfData] = Array <CellOfData> (repeating:basicCell ,count: 35)
        
        
        //----------------------------Col-vo cells---------------------------------
        
        var dateComponents = DateComponents(year: year, month: month)
        var calendar = Calendar.current
        var date = calendar.date(from: dateComponents)!

        let range = calendar.range(of: .day, in: .month, for: date)!
        let colvoDays = range.count
        
        //--------------------------first cell and kalendar---------------------------
        dateComponents = DateComponents(year: year, month: month, day: 1)
        calendar = Calendar.current
        date = calendar.date(from: dateComponents)!
        dateFormatter = DateFormatter()
        dateFormatter.setLocalizedDateFormatFromTemplate("EEE")
        let dayNedely = dateFormatter.string(from: date)
        
        var numberOfFirstCell : Int
        
        switch dayNedely {
            case "Пн":
                numberOfFirstCell = 1
            case "Вт":
                numberOfFirstCell = 2
            case "Ср":
                numberOfFirstCell = 3
            case "Чт":
                numberOfFirstCell = 4
            case "Пт":
                numberOfFirstCell = 5
            case "Сб":
                numberOfFirstCell = 6
            case "Вс":
                numberOfFirstCell = 7
            default :
                numberOfFirstCell = 0
                print("default")
        }
        
        
        
        for i in numberOfFirstCell...colvoDays {
            cellsOfData [i] = CellOfData(activeLy: true,  chislo: i-numberOfFirstCell+1, today: false)
        }
        
        
        return cellsOfData
    }
    
    
    
    
    
    private class CellOfData {
        let activeLy : Bool
        let chislo : Int
        let today : Bool
        
        
        init (activeLy: Bool,  chislo : Int, today: Bool){
            self.activeLy = activeLy
            self.chislo = chislo
            self.today = today
        }
    }
    
    
    
    
    
    

}

