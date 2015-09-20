//
//  IfConditionInstruction.swift
//  ReformCore
//
//  Created by Laszlo Korte on 14.08.15.
//  Copyright © 2015 Laszlo Korte. All rights reserved.
//

import ReformExpression

public struct IfConditionInstruction : GroupInstruction {
    public let expression : Expression
    
    public var target : FormIdentifier? { return nil }

    public init(expression : Expression) {
        self.expression = expression
    }
    
    public func evaluate<T:Runtime where T.Ev==InstructionNode>(runtime: T, withChildren children: [InstructionNode]) {
        guard case .Success(.BoolValue(let bool)) = expression.eval(runtime.getDataSet()) else {
            runtime.reportError(.InvalidExpression)
            return
        }
        
        if bool {
            runtime.scoped() { runtime in
                for c in children where !runtime.shouldStop {
                    c.evaluate(runtime)
                }
            }
        }
    }
    
    
    public func getDescription(stringifier: Stringifier) -> String {        let expressionString = stringifier.stringFor(expression) ?? "???"
        
        return "if \(expressionString):"
    }

    public func analyze<T:Analyzer>(analyzer: T) {
    }
}