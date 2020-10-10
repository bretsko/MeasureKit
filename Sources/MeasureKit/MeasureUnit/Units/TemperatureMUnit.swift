



/// NSUnitTemperature: [Θ], base is kelvins
public enum TemperatureMUnit: Str, StrEnumT, MeasureUnitT {
    //not MeasureUnitT, bc plural doesnt change, dont need var single
    
    case kelvin, celsius, fahrenheit
}

public extension TemperatureMUnit {
    
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
    
    
    var unit: UnitTemperature {
        switch self {
        case .kelvin:
            return U.kelvin
        case .celsius:
            return U.celsius
        case .fahrenheit:
            return U.fahrenheit
        }
    }
    
    var munit: MeasureUnit {
        .temperature(self)
    }
    
    /// can init with known unit
    init(_ unit: UnitTemperature) {
        switch unit {
        case U.kelvin:
            self = .kelvin
        case U.celsius:
            self = .celsius
        case U.fahrenheit:
            self = .fahrenheit
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

fileprivate extension TemperatureMUnit {
    typealias U = UnitTemperature
    
    //TODO: consider making this as interface, and iml the rest as convs in protocol ext
    func form(_ num: Double,
              _ format: MeasureUnitFormat) -> Str {
        let ftr = fmtr(format)
        let str: Str
        switch self {
        case .kelvin:
            str = ftr.str(from: num.kelvin)
        case .celsius:
            str = ftr.str(from: num.celsius)
        case .fahrenheit:
            str = ftr.str(from: num.fahrenheit)
        }
        return str.wordsExceptFirst!
    }
}
