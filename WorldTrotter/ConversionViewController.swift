//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Kathy Lin on 4/15/17.
//  Copyright © 2017 Kathy Lin. All rights reserved.
//

import UIKit

class ConversionviewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    // property observer. declared using curly braces immediately after the property declaration.  didSet = notified immediately after the property value changes.
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celciusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    } ()
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    // Single tap dismisses the keyboard
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    // Updates the celcius label
    
    func updateCelsiusLabel() {
        if let celciusValue = celciusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celciusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCelsiusLabel()
    }
    
    // Using a delegate.
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        // Prevent user from enering two decimal points
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        /*
        let existingTextHasAlpha = textField.text?.rangeOfCharacter(from: NSCharacterSet.letters)
        let replacementTextHasAlpha = string.rangeOfCharacter(from: NSCharacterSet.letters)
        
        */
        
        if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
}
