//
//  ReferencePoint.swift
//  ReformCore
//
//  Created by Laszlo Korte on 13.08.15.
//  Copyright © 2015 Laszlo Korte. All rights reserved.
//


import ReformMath

public protocol RuntimePoint {
    func getPositionFor<R:Runtime>(_ runtime: R) -> Vec2d?

    func isEqualTo(_ other: RuntimePoint) -> Bool
}

public protocol WriteableRuntimePoint : RuntimePoint {
    func setPositionFor<R:Runtime>(_ runtime: R, position: Vec2d)
}

extension RuntimePoint where Self : Equatable {
    public func isEqualTo(_ other: RuntimePoint) -> Bool {
        guard let other = other as? Self else {
            return false
        }

        return self == other
    }
}
