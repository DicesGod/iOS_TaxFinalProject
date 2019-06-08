//
//  SalaryTextField.swift
//  tax
//
//  Created by Mirmohammad Saadati on 2019-06-06.
//  Copyright © 2019 Mirmohammad Saadati. All rights reserved.
//

import UIKit

@IBDesignable
class SalaryTextField: UITextField {

    override func draw(_ rect: CGRect) {
        let size: CGFloat = 30
        let labelFrame: CGRect = CGRect(x: 5, y: (frame.size.height / 2) - size / 2, width: size, height: size)
        let label = UILabel(frame: labelFrame)
        label.backgroundColor = #colorLiteral(red: 0.5723067522, green: 0.5723067522, blue: 0.5723067522, alpha: 0.3994809503)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        label.layer.cornerRadius = 30.0
        label.clipsToBounds = true

        let dollarSign = NumberFormatter()
        dollarSign.numberStyle = .currency
        label.text = dollarSign.currencySymbol
        addSubview(label)
    }
    
    // for render in storyboard view (xcode)
    override func prepareForInterfaceBuilder() {
        customRender()
    }
    
    // for render in runtime
    override func awakeFromNib() {
        super.awakeFromNib()
        customRender()
    }
    
    func customRender() {
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2020012842)
        layer.cornerRadius = 15
        textAlignment = .center
        if placeholder == nil {
            placeholder = " "
        }
        let place = NSAttributedString(string: placeholder!, attributes: [.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
        attributedPlaceholder = place
        textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
