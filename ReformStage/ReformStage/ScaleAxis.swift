//
//  Axis.swift
//  ReformStage
//
//  Created by Laszlo Korte on 21.08.15.
//  Copyright © 2015 Laszlo Korte. All rights reserved.
//

import ReformCore

public enum ScaleAxis {
    case none
    case named(String, formId: FormIdentifier, ExposedPointIdentifier, ExposedPointIdentifier)
}

extension ScaleAxis {
    public var runtimeAxis : RuntimeAxis {
        switch self {
        case .none: return .none
        case .named(let name, let formId, let a, let b):
            return .named(name, from: AnonymousFormPoint(formId: formId, pointId: a), to: AnonymousFormPoint(formId: formId, pointId: b))
        }
    }
}
