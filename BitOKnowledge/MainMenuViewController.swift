//
//  ViewController.swift
//  BitOKnowledge
//
//  Created by Isaac on 5/3/18.
//  Copyright © 2018 Isaac Pitblado. All rights reserved.
//

import UIKit

enum GameType : String {
//    typealias RawValue = String
    
    case Binary, Decimal, Hexadecimal
    
    static var count = 6
    var description: String {
        switch self {
        case .Binary      : return "Binary"
        case .Decimal     : return "Decimal"
        case .Hexadecimal : return "Hexadecimal"
        default           : return ""
        }
    }
}

var GameOption : GameType = GameType.Binary

class MainMenuViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let PickerData = [GameType.Binary, GameType.Hexadecimal, GameType.Decimal]
    var fromOption : String = "Binary"
    var toOption   : String = "Decimal"

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PickerData.count
    }
    
    
    
    @IBOutlet weak var FromPicker: UIPickerView!
    @IBOutlet weak var ToPicker: UIPickerView!
    
    @IBAction func PlayPressed(_ sender: Any) {
        // Is also attached to segue in storyboard
//        var row : Int = 0
//        var component : Int = 0
//        var fromOption = pickerView(FromPicker, didSelectRow: row, inComponent: component)
//        var toOption  = pickerView(ToPicker, didSelectRow: row, inComponent: component)
//        print(fromOption)
//        print("toOption   = \(toOption)")
        
        fromOption = self.pickerView(FromPicker, titleForRow: FromPicker.selectedRow(inComponent: 0), forComponent: 0)
        toOption   = self.pickerView(ToPicker, titleForRow: ToPicker.selectedRow(inComponent: 0), forComponent: 0)
        print("MainMenuVC : fromOption = \(fromOption)")
        print("MainMenuVC : toOption   = \(toOption)")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? GameViewController {
            vc.fromOption = fromOption
            vc.toOption   = toOption
        }
    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) -> String? {
//        return (PickerData[row])
//    }
    
    
    //MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        return PickerData[row].description
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        FromPicker.dataSource = self
        ToPicker.dataSource = self
        FromPicker.delegate = self
        ToPicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


//    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        myLabel.text = PickerData[row.rawValue]
//    }


}

