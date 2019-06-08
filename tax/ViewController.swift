//
//  ViewController.swift
//  tax
//
//  Created by Mirmohammad Saadati on 2019-06-06.
//  Copyright © 2019 Mirmohammad Saadati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var salaryTextField: SalaryTextField!
    @IBOutlet weak var provinceTextField: SalaryTextField!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var provincePicker: UIPickerView!
    
    var provinces = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let taxButton = UIButton(frame: CGRect(x: 0, y: 0, width: view!.frame.size.width, height: 50))
        taxButton.backgroundColor = #colorLiteral(red: 1, green: 0.2527923882, blue: 1, alpha: 1)
        taxButton.setTitle("Calculate Tax", for: .normal)
        taxButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        taxButton.addTarget(self, action: #selector(ViewController.calculateTax), for: .touchUpInside)
        
        salaryTextField.inputAccessoryView = taxButton
        provinceTextField.inputAccessoryView = taxButton

        taxLabel.isHidden = true

        salaryTextField.delegate = self
        
        provincePicker.delegate = self
        provincePicker.dataSource = self

        provinces = ["quebec", "ontario", "federal"]
    }
    
    @objc func calculateTax() {
        let province = Province(rawValue: provinceTextField.text?.lowercased() ?? "federal") ?? Province.federal
        let tax = province.calculateTax(withSalary: Double(salaryTextField.text ?? "0.0") ?? 0.0)
        taxLabel.text = "Total Tax: $" + String(tax)
        taxLabel.isHidden = false
        view.endEditing(true)  // Hide keyboard
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return provinces.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return provinces[row].capitalized
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        provinceTextField.text = provinces[row].capitalized
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        salaryTextField.text = ""
        taxLabel.isHidden = true
        return true
    }
}
