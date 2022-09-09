//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Kaan Uslu on 8.09.2022.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation


struct CalculatorLogic{
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calc(symbol: String) -> Double? {
        if let n = number{
            
            switch symbol{
                case "+/-":
                    return n * -1
                case "AC":
                    return 0
                case "%":
                    return n / 100
                case "=":
                    return performTwoNumCalculation(n2: n)
                default:
                    intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double?{
        
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod{
            
            print(n1)
            print(operation)
            switch operation{
            case "+":
                    return n1 + n2
                
            case "-":
                    return n1 - n2
                
            case "×":
                    return n1 * n2
                
            case "÷":
                    return n1 / n2
                
            default:
                    fatalError("messaage fatal error ")
            }
        }
        return nil
    }
}
