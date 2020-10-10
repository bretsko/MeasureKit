

/// NSUnitAngle: [], base is
public enum AngleMUnit: Str, StrEnumT, MeasureUnitT {
    
    case degrees, radians, gradians, revolutions, arcSeconds, arcMinutes
}
public extension AngleMUnit {
    
    init?(_ str: Str,
          _ format: MeasureUnitFormat = .init()) {
        
        if let obj = Self.allForms.first(where: { 
            $0.allStrs(format).contains(str)
            //            let single = obj.single(format)
            //            let plural = obj.plural(format)
            //            
            //            print("------------")
            //            print("single: \(single)")
            //            print("plural: \(plural)")
            //            print("------------")
            //            return single == str || plural == str
        }) {
            self = obj
        } else {
            return nil
        }
    }
    
    
    var unit: UnitAngle {
        switch self {
        case .degrees:
            return U.degrees
        case .radians:
            return U.radians
        case .gradians:
            return U.gradians
        case .revolutions:
            return U.revolutions
        case .arcSeconds:
            return U.arcSeconds
        case .arcMinutes:
            return U.arcMinutes
        }
    }
    
    var munit: MeasureUnit {
        .angle(self)
    }
    
    /// can init with known unit
    init(_ unit: UnitAngle) {
        switch unit {
        case U.degrees:
            self = .degrees
        case U.radians:
            self = .radians
        case U.gradians:
            self = .gradians
        case U.revolutions:
            self = .revolutions
        case U.arcSeconds:
            self = .arcSeconds
        case U.arcMinutes:
            self = .arcMinutes
        case U.degrees:
            self = .degrees
        case U.degrees:
            self = .degrees
        default:
            L.notImpl()
        //return nil
        }
    }
    
    //MARK: -
    
    func single(_ format: MeasureUnitFormat) -> Str {
        form(1, format)
    }
    
    func plural(_ format: MeasureUnitFormat) -> Str {
        form(3, format)
    }
    
    /// some langs have diff values for cases from 6 to 19
    /// For ex. 3 килограмма, часа, BUT 6 килограм, часов
    func pluralAfter5(_ format: MeasureUnitFormat) -> Str? {
        form(6, format)
    }
}


fileprivate extension AngleMUnit {
    typealias U = UnitAngle
    
    //TODO: consider making this as interface, and iml the rest as convs in protocol ext
    func form(_ num: Double,
              _ format: MeasureUnitFormat) -> Str {
        let ftr = fmtr(format)
        let str: Str
        switch self {
        case .degrees:
            str = ftr.str(from: num.degrees)
        case .radians:
            str = ftr.str(from: num.radians)
        case .gradians:
            str = ftr.str(from: num.gradians)
        case .revolutions:
            str = ftr.str(from: num.revolutions)
        case .arcSeconds:
            str = ftr.str(from: num.arcSeconds)
        case .arcMinutes:
            str = ftr.str(from: num.arcMinutes)
        }
        return str.wordsExceptFirst!
    }
}





