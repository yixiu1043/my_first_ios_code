//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by conley on 12/9/24.
//

//import Foundation
import UIKit

class ConversionViewController : UIViewController, UITextFieldDelegate {

    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    var fahrenHeitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenHeitValue = fahrenHeitValue {
            return fahrenHeitValue.converted(to: .celsius)
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
    }()
    
    @IBAction func fahrenHeitFieldEditingChanged(_ textField: UITextField) {
//        celsiusLabel.text = textField.text
//        if let text = textField.text, !text.isEmpty {
//            celsiusLabel.text = textField.text
//        } else {
//            celsiusLabel.text = "???"
//        }
//        if let text = textField.text, let value = Double(text) {
//            fahrenHeitValue = Measurement<UnitTemperature>(value: value, unit: .fahrenheit)
//        } else {
//            fahrenHeitValue = nil
//        }
        if let text = textField.text, let number = numberFormatter.number(from: text) {
            fahrenHeitValue = Measurement<UnitTemperature>(value: number.doubleValue, unit: .fahrenheit)
        } else {
            fahrenHeitValue = nil
        }
    }
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = "\(celsiusValue.value)"
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view.")
        updateCelsiusLabel()
    }
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
//        print("Current text: \(textField.text ?? "???")")
//        print("Replacement text: \(string)")
//        return true
//        let existingTextHasDecimalSeparator = textField.text?.ranges(of: ".")
//        let replacementTextHasDecimalSeparator = string.ranges(of: ".")
    
        
//        print("existingTextHasDecimalSeparator: \(existingTextHasDecimalSeparator)")
//        print("replacementTextHasDecimalSeparator: \(replacementTextHasDecimalSeparator)")
//        

        let currentLocale = NSLocale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? "."
        
        let existingTextHasDecimalSeparator = textField.text?.ranges(
            of: decimalSeparator
        )
        let replacementTextHasDecimalSeparator = string.ranges(
            of: decimalSeparator
        )
        
        if !(
            existingTextHasDecimalSeparator?.isEmpty ?? true
        ), !replacementTextHasDecimalSeparator.isEmpty {
                    return false
                } else {
                    return true
                }
    }
}
