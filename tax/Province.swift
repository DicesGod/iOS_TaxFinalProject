//
//  Province.swift
//  tax
//
//  Created by Mirmohammad Saadati on 2019-06-06.
//  Copyright © 2019 Mirmohammad Saadati. All rights reserved.
//

import UIKit

enum Province: String {
    case quebec, ontario, federal
    
    func calculateTax(withSalary salary: Double) -> Double {
        switch self {
        case .quebec:
            if salary <= 43055.0 {
                return round(salary * 0.15)
            } else if salary > 43055.0 && salary <= 86105.0 {
                return round(salary * 0.20)
            } else if salary > 86105.0 && salary <= 104765.0 {
                return round(salary * 0.24)
            } else { //if salary > 104765.0 {
                return round(salary * 0.2575)
            }
        case .ontario:
            if salary <= 43906.0 {
                return round(salary * 0.0505)
            } else if salary > 43906.0 && salary <= 87813.0 {
                return round(salary * 0.0915)
            } else if salary > 87813.0 && salary <= 150000.0 {
                return round(salary * 0.1116)
            } else if salary > 150000.0 && salary <= 220000.0 {
                return round(salary * 0.1216)
            } else { //if salary > 220000.0 {
                return round(salary * 0.1316)
            }
        case .federal:
            return salary
        }
    }
}
