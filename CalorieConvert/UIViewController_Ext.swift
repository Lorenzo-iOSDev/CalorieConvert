//
//  UIViewController_Ext.swift
//  CalorieConvert
//
//  Created by Lorenzo Zemp on 17/02/22.
//

import UIKit

//An extension to UIViewController
extension UIViewController {
    
    //creates a to Tap Gesture Recognizer that is added to the view and runs dismissKeyboard function
    func hideKeyboardWhenScreenTapped() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    //function to dismiss keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
