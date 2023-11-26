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
    @IBOutlet weak var Cell1: UIButton!
    @IBOutlet weak var Cell2: UIButton!
    @IBOutlet weak var Cell3: UIButton!
    @IBOutlet weak var Cell4: UIButton!
    @IBOutlet weak var Cell5: UIButton!
    @IBOutlet weak var Cell6: UIButton!
    @IBOutlet weak var Cell7: UIButton!
    @IBOutlet weak var Cell8: UIButton!
    @IBOutlet weak var Cell9: UIButton!
    @IBOutlet weak var Cell10: UIButton!
    @IBOutlet weak var Cell11: UIButton!
    @IBOutlet weak var Cell12: UIButton!
    @IBOutlet weak var Cell13: UIButton!
    @IBOutlet weak var Cell14: UIButton!
    @IBOutlet weak var Cell15: UIButton!
    @IBOutlet weak var Cell16: UIButton!
    @IBOutlet weak var Cell17: UIButton!
    @IBOutlet weak var Cell18: UIButton!
    @IBOutlet weak var Cell19: UIButton!
    @IBOutlet weak var Cell20: UIButton!
    @IBOutlet weak var Cell21: UIButton!
    @IBOutlet weak var Cell22: UIButton!
    @IBOutlet weak var Cell23: UIButton!
    @IBOutlet weak var Cell24: UIButton!
    @IBOutlet weak var Cell25: UIButton!
    @IBOutlet weak var Cell26: UIButton!
    @IBOutlet weak var Cell27: UIButton!
    @IBOutlet weak var Cell28: UIButton!
    @IBOutlet weak var Cell29: UIButton!
    @IBOutlet weak var Cell30: UIButton!
    @IBOutlet weak var Cell31: UIButton!
    @IBOutlet weak var Cell32: UIButton!
    @IBOutlet weak var Cell33: UIButton!
    @IBOutlet weak var Cell34: UIButton!
    @IBOutlet weak var Cell35: UIButton!
    @IBOutlet weak var Cell36: UIButton!
    @IBOutlet weak var Cell37: UIButton!
    
    @IBOutlet weak var Month: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPopupButtom1()
        setPopupButtom2()
        let cells : [CellOfData] = monthYearToCells(year: 2015, month: 4)
    
        let cellsView : [UIButton] = uniteCells()
        for i in 1...37{
            cellsView[i-1].configuration!.title = String(cells[i-1].chislo)
            cellsView[i-1].isEnabled = cells[i-1].activeLy
            cellsView[i-1].isHidden = !cells[i-1].activeLy
        }
        Month.text = "\(menuBottom1.currentTitle!)  \( menuBottom2.currentTitle!)"
    }

    
    func setPopupButtom1(){
        let optionClosure = {(action : UIAction) in print (action.title)}
        
        menuBottom1.menu = UIMenu(children : [
            UIAction(title:"2015", state : .on ,  handler: optionClosure),
            UIAction(title:"2016",  handler: optionClosure),
            UIAction(title:"2017",  handler: optionClosure),
            UIAction(title:"2018",  handler: optionClosure),
            UIAction(title:"2019",  handler: optionClosure),
            UIAction(title:"2020",  handler: optionClosure),
            UIAction(title:"2021",  handler: optionClosure),
            UIAction(title:"2022",  handler: optionClosure),
            UIAction(title:"2023", handler: optionClosure),
            UIAction(title:"2024",  handler: optionClosure),
            UIAction(title:"2025",  handler: optionClosure)
        ])
        
            
        menuBottom1.showsMenuAsPrimaryAction = true
        menuBottom1.changesSelectionAsPrimaryAction = true
    }
    
    func setPopupButtom2(){
        let optionClosure = {(action : UIAction) in print (action.title)}
        menuBottom2.menu = UIMenu(children : [
            UIAction(title:"Январь", state : .on,  handler: optionClosure),
            UIAction(title:"Февраль",  handler: optionClosure),
            UIAction(title:"Март",  handler: optionClosure),
            UIAction(title:"Апрель",  handler: optionClosure),
            UIAction(title:"Май",  handler: optionClosure),
            UIAction(title:"Июнь",  handler: optionClosure),
            UIAction(title:"Июль",  handler: optionClosure),
            UIAction(title:"Август",  handler: optionClosure),
            UIAction(title:"Сентябрь",  handler: optionClosure),
            UIAction(title:"Октябрь",  handler: optionClosure),
            UIAction(title:"Ноябрь", handler: optionClosure),
            UIAction(title:"Декабрь",  handler: optionClosure),
        ])
        
    
        menuBottom2.showsMenuAsPrimaryAction = true
        menuBottom2.changesSelectionAsPrimaryAction = true
    }
    
    func uniteCells () ->  [UIButton]{
        return [Cell1, Cell2, Cell3, Cell4, Cell5, Cell6, Cell7, Cell8, Cell9, Cell10, Cell11, Cell12, Cell13, Cell14, Cell15, Cell16, Cell17, Cell18, Cell19, Cell20, Cell21, Cell22, Cell23, Cell24, Cell25, Cell26, Cell27, Cell28, Cell29, Cell30, Cell31, Cell32, Cell33, Cell34, Cell35, Cell36, Cell37]
        
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
        var cellsOfData : [CellOfData] = Array <CellOfData> (repeating:basicCell ,count: 37)
        
        
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
        
        
        
        for i in numberOfFirstCell...(colvoDays+numberOfFirstCell) {
            cellsOfData [i-1] = CellOfData(activeLy: true,  chislo: i-numberOfFirstCell+1, today: false)
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

