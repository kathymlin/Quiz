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
    
    // Using a delegate.
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        // Prevent user from entering two decimal points
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        // Prevent user from entering alphabetic characters
        let replacementTextHasAlpha = string.rangeOfCharacter(from: NSCharacterSet.letters)
        
        if existingTextHasDecimalSeparator != nil, replacementTextHasDecimalSeparator != nil
            {
            return false
        } else if replacementTextHasAlpha != nil {
            return false
        }
        else {
            return true
        }
    }

    
    // OVERRIDE FUNCTIONS
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCelsiusLabel()
    }
    
    // can put some init code here -- this is called each time the view controller's view appears on screen
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        // Depending on the time of day. return a light or dark color.  Right now this is hard coded so between 6pm and 6am a dark color is returned
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        if (hour <= 6 || hour >= 18) {
            view?.backgroundColor = UIColor.darkGray
        }
    }
}
