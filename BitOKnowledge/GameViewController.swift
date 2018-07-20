//
//  BinToDecViewController.swift
//  BitOKnowledge
//
//  Created by Isaac on 5/3/18.
//  Copyright © 2018 Isaac Pitblado. All rights reserved.
//

import UIKit



class GameViewController: UIViewController {
    var fromOption : String = "Binary"
    var toOption   : String = "Decimal"
    var correctType : GameType = GameType.Binary
    var guessType   : GameType = GameType.Binary
    
    var score : Int = 0
    var lives : Int = 3

    var correctAnswer : String = ""
    var userGuess     : String = ""
    var value : Int = 0
    var decValue : String = ""
    var binValue : String = ""
    var hexValue : String = ""
    
    let max = 256
    let decLength : Int = 3
    let hexLength : Int = 2
    let binLength : Int = 8
    
    
    @IBOutlet weak var UserGuess: UITextField!
    
    @IBOutlet weak var debugOutput: UILabel!
    @IBOutlet weak var NumberDisplay: UILabel!
    @IBOutlet weak var ScoreLbl: UILabel!
    @IBOutlet weak var LivesLbl: UILabel!
    @IBOutlet weak var GameOverImage: UIImageView!
    @IBOutlet weak var SubmitBtn: UIButton!
    
    @IBOutlet weak var GuessTypeLbl: UILabel!
    @IBOutlet weak var CorrectTypeLbl: UILabel!
    
    @IBAction func submitPressed(_ sender: UIButton) {

    

        
//        updateGuessAndCorrect()
        
        if UserGuess.text == correctAnswer {
            print("Is equal!")
            score += 1
        }
        else {
            print("Incorrect!")
            lives -= 1
            if (lives <= 0 ) {
                GameOverImage.isHidden = false
                UserGuess.isEnabled = false
                SubmitBtn.isEnabled = false
            }
        }

        updateValue()
    }
    
    
    func pad(string : String, toSize: Int) -> String {
        var padded = string
        for _ in 0..<(toSize - string.characters.count) {
            padded = "0" + padded
        }
        return padded
    }
    
    func updateGuessAndCorrect () {
        switch guessType {
        case GameType.Binary:
            correctAnswer = binValue
        case GameType.Decimal:
            correctAnswer = decValue
        case GameType.Hexadecimal:
            correctAnswer = hexValue
        }
        
        switch correctType {
        case GameType.Binary:
            NumberDisplay.text = binValue
        case GameType.Decimal:
            NumberDisplay.text = decValue
        case GameType.Hexadecimal:
            NumberDisplay.text = hexValue
        }
    }
    func updateValue() {
        value = random(max)
        

        
        decValue = pad(string: String(value, radix: 10), toSize : decLength)
        print("decValue : \(decValue)")
        
        binValue = pad(string: String(value, radix: 2), toSize : binLength)
        print("binValue : \(binValue)")
        
        hexValue = pad(string: String(value, radix: 16) , toSize: hexLength)
        print("hexValue : \(hexValue)")
        

        
        NumberDisplay.text = ""
        UserGuess.text = ""
        print("value is \(value)")
        
        updateGuessAndCorrect()
        
        print("NumberDisplay.text = \(NumberDisplay.text ?? "")")
        debugOutput.text = correctAnswer
        LivesLbl.text = "Lives: " + String(lives)
        ScoreLbl.text = "Score: " + String(score)
        
    }
    
//    func toBinary (_ num : Int) -> String {
//        var div = 128
//        var myNum = num
//        var result = ""
//        print("myNum = \(myNum)")
//        for _ in 0...7 {
//            if (myNum >= div) {
//                result.append("1")
//                myNum = myNum - div
//                
//            }
//            else {
//                result.append("0")
//            }
//            div = div / 2
//        }
//        
//        return result
//    }
    
    func  random (_ n : Int ) -> Int {
        return Int(arc4random_uniform(UInt32(n)))
        
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        print("GameVC : fromOption = \(fromOption)")
        print("GameVC : toOption   = \(toOption)")
        
        if      (fromOption == "Binary") {
            correctType = GameType.Binary
        }
        else if (fromOption == "Decimal") {
            correctType = GameType.Decimal
        }
        else if (fromOption == "Hexadecimal") {
            correctType = GameType.Hexadecimal
        }
        
        if      (toOption == "Binary") {
            guessType = GameType.Binary
        }
        else if (toOption == "Decimal") {
            guessType = GameType.Decimal
        }
        else if (toOption == "Hexadecimal") {
            guessType = GameType.Hexadecimal
        }
        
        CorrectTypeLbl.text = fromOption
        GuessTypeLbl.text   = toOption
        
        print("GameVC : correctType = \(correctType)")
        print("GameVC : guessType   = \(guessType)")
        UserGuess.isEnabled = true
        updateValue()
        

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
