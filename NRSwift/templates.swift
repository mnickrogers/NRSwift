//
//  templates.swift
//  NRSwift
//
//  Created by Nicholas Rogers on 4/19/16.
//  Copyright © 2016 Nicholas Rogers. All rights reserved.
//

import Foundation

public func evaluatePostfixDouble(_ postfix : String) -> Double
{
    var stack = NRStack<Double>()
    var left : Double
    var right : Double
    
    let tokenized : ([String]) = postfix.components(separatedBy: " ")
    
    for token in tokenized
    {
        switch token
        {
        case "*":
            right = stack.pop()
            left = stack.pop()
            stack.push(left * right)
        case "/":
            right = stack.pop()
            left = stack.pop()
            stack.push(left / right)
        case "+":
            right = stack.pop()
            left = stack.pop()
            stack.push(left + right)
        case "-":
            right = stack.pop()
            left = stack.pop()
            stack.push(left - right)
        case "0" ... "9":
            stack.push(Double(token)!)
            
        default:
            break
        }
    }
    
    return stack.pop()
}

public func convertInfixToPostfix(_ infix : String) -> String
{
    func precedence(_ op : String) -> Int
    {
        switch op
        {
            case "*": fallthrough
            case "/": fallthrough
            case "%":
                return 2
            case "+": fallthrough
            case "-":
                return 1
            default:
                return 0
        }
    }
    
    return ""
}
