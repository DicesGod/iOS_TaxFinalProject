//
//  TaxLabel.swift
//  tax
//
//  Created by Mirmohammad Saadati on 2019-06-06.
//  Copyright © 2019 Mirmohammad Saadati. All rights reserved.
//

import UIKit

@IBDesignable
class TaxLabel: UILabel {

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
        clipsToBounds = true
        textAlignment = .center
    }
}
