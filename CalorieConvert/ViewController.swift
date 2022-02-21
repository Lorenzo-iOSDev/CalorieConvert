//
//  ViewController.swift
//  CalorieConvert
//
//  Created by Lorenzo Zemp on 17/02/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var kjField: UITextField!
    @IBOutlet var kcalField: UITextField!
    
    @IBOutlet var arrowView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add gesture recognizer that recognizes when screen is tapped and hides the keyboard
        self.hideKeyboardWhenScreenTapped()
        
        //set both UITextField's delegates as this view controller
        kjField.delegate = self
        kcalField.delegate = self
        
        //rotate arrow image to 90°
        arrowView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/2)
    }
    
    //Function is called when kilojoule field is changed
    //calls the convertToCal function that inputs the text from the Kilojoule field and returns a converted Int
    //which is displayed as a string in the calorie textfield
    //then if the kilojoule text field string is Empty it resets the calorie string to empty as well
    //so that there wont be a 0 in the calorie field
    @IBAction func kjChanged(_ sender: UITextField) {
        kcalField.text = "\(convertToCal(inputString: sender.text))"
        
        if let charCount = kjField.text?.count {
            if charCount == 0 {
                kcalField.text = ""
            }
        }
    }
    
    //Function is called when kilocalorie field is changed
    //calls the convertToKJ function that inputs the text from the calorie field and returns a converted Int
    //which is displayed as a string in the kilojoule textfield
    //then if the calorie text field string is Empty it resets the kilojoule string to empty as well
    //so that there wont be a 0 in the kilojoule field
    @IBAction func kcalChanged(_ sender: UITextField) {
        kjField.text = "\(convertToKj(inputString: sender.text))"
        
        if let charCount = kcalField.text?.count {
            if charCount == 0 {
                kjField.text = ""
            }
        }
    }
    
    //Functon that clears both textfields when clear button is tapped
    @IBAction func clearTouched(_ sender: Any) {
        kjField.text = ""
        kcalField.text = ""
    }
    
    //Function that converts Kilojoule string into a calorie int
    //and returns the int
    func convertToCal(inputString: String?) -> Int {
        if let input = Double(inputString!) {
            let result = input/4.184
            return(Int(result))
        } else {
            return(0)
        }
    }
    
    //Function that converts calorie string into a kilojoule int
    //and returns the int
    func convertToKj(inputString: String?) -> Int {
        if let input = Double(inputString!) {
            let result = input*4.184
            return(Int(result))
        } else {
            return(0)
        }
    }
    
    //Limit textfield character amounts
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 5
    }
}

