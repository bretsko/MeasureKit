



/// NSUnitLength, base is meters
public enum LengthMUnit: Str, StrEnumT, MeasureUnitT {
    
    case megameters, kilometers, hectometers, decameters, meters, decimeters, centimeters, millimeters, micrometers, nanometers, picometers, inches, feet, yards, miles, scandinavianMiles, lightyears, nauticalMiles, fathoms, furlongs, astronomicalUnits, parsecs
}

public extension LengthMUnit {
    
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
    
    var unit: UnitLength {
        switch self {
        case .megameters:
            return U.megameters
        case .kilometers:
            return U.kilometers
        case .hectometers:
            return U.hectometers
        case .decameters:
            return U.decameters
        case .meters:
            return U.meters
        case .decimeters:
            return U.decimeters
        case .centimeters:
            return U.centimeters
        case .millimeters:
            return U.millimeters
        case .micrometers:
            return U.micrometers
        case .nanometers:
            return U.nanometers
        case .picometers:
            return U.picometers
        case .inches:
            return U.inches
        case .feet:
            return U.feet
        case .yards:
            return U.yards
        case .miles:
            return U.miles
        case .scandinavianMiles:
            return U.scandinavianMiles
        case .lightyears:
            return U.lightyears
        case .nauticalMiles:
            return U.nauticalMiles
        case .fathoms:
            return U.fathoms
        case .furlongs:
            return U.furlongs
        case .astronomicalUnits:
            return U.astronomicalUnits
        case .parsecs:
            return U.parsecs
        }
    }
    
    var munit: MeasureUnit {
        .length(self)
    }
    
    /// can init with known unit
    init(_ unit: UnitLength) {
        switch unit {
        case U.megameters:
            self = .megameters
        case U.megameters:
            self = .megameters
        case U.kilometers:
            self = .kilometers
        case U.hectometers:
            self = .hectometers
        case U.decameters:
            self = .decameters
        case U.meters:
            self = .meters
        case U.decimeters:
            self = .decimeters
        case U.centimeters:
            self = .centimeters
        case U.millimeters:
            self = .millimeters
        case U.micrometers:
            self = .micrometers
        case U.nanometers:
            self = .nanometers
        case U.picometers:
            self = .picometers
        case U.inches:
            self = .inches
        case U.feet:
            self = .feet
        case U.yards:
            self = .yards
        case U.miles:
            self = .miles
        case U.scandinavianMiles:
            self = .scandinavianMiles
        case U.lightyears:
            self = .lightyears
        case U.nauticalMiles:
            self = .nauticalMiles
        case U.fathoms:
            self = .fathoms
        case U.furlongs:
            self = .furlongs
        case U.astronomicalUnits:
            self = .astronomicalUnits
        case U.parsecs:
            self = .parsecs
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

fileprivate extension LengthMUnit {
    typealias U = UnitLength
    
    //TODO: consider making this as interface, and iml the rest as convs in protocol ext
    func form(_ num: Double,
              _ format: MeasureUnitFormat) -> Str {
        let ftr = fmtr(format)
        let str: Str 
        switch self {
        case .megameters:
            str = ftr.str(from: num.megameters)
        case .kilometers:
            str = ftr.str(from: num.kilometers)
        case .hectometers:
            str = ftr.str(from: num.hectometers)
        case .decameters:
            str = ftr.str(from: num.decameters)
        case .meters:
            str = ftr.str(from: num.meters)
        case .decimeters:
            str = ftr.str(from: num.decimeters)
        case .centimeters:
            str = ftr.str(from: num.centimeters)
        case .millimeters:
            str = ftr.str(from: num.millimeters)
        case .micrometers:
            str = ftr.str(from: num.micrometers)
        case .nanometers:
            str = ftr.str(from: num.nanometers)
        case .picometers:
            str = ftr.str(from: num.picometers)
        case .inches:
            str = ftr.str(from: num.inches)
        case .feet:
            str = ftr.str(from: num.feet)
        case .yards:
            str = ftr.str(from: num.yards)
        case .miles:
            str = ftr.str(from: num.miles)
        case .scandinavianMiles:
            str = ftr.str(from: num.scandinavianMiles)
        case .lightyears:
            str = ftr.str(from: num.lightyears)
        case .nauticalMiles:
            str = ftr.str(from: num.nauticalMiles)
        case .fathoms:
            str = ftr.str(from: num.fathoms)
        case .furlongs:
            str = ftr.str(from: num.furlongs)
        case .astronomicalUnits:
            str = ftr.str(from: num.astronomicalUnits)
        case .parsecs:
            str = ftr.str(from: num.parsecs)
        }
        
        return str.wordsExceptFirst!
    }
}

