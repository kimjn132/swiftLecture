//
//  Calculation.swift
//  ModelCalc
//
//  Created by Anna Kim on 2022/12/10.
//

import Foundation

//file name과 동일해야 한다.(Calculation

struct Calculation{
    
    //Addition
    func add(_ num1T: String?, _ num2T: String?) -> Int{
        let num1 = Int(num1T!) ?? 0
        let num2 = Int(num2T!) ?? 0
        return num1 + num2
    }
    //Subtraction
    func sub(_ num1T: String?, _ num2T: String?) -> Int{
        let num1 = Int(num1T!)
        let num2 = Int(num2T!)
        return (num1! - num2!)
    }
    //Multiplication
    func mul(_ num1T: String?, _ num2T: String?) -> Int{
        guard let num1 = Int(num1T!) else{return 0}
        guard let num2 = Int(num2T!) else {return 0}
        return num1 * num2
    }
    //Division
    func div(_ num1T: String?, _ num2T: String?) -> Int{
//        guard let num1 = Int(num1T) else{return 0}
//        guard let num2 = Int(num2T) else {return 0}
        guard let num1 = Int(num1T!), let num2 = Int(num2T!) else {return 0}
        
        
        return num1 / num2
    }
}
