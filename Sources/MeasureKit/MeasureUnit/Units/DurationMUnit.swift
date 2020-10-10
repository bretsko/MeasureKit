

//Although Foundation contains UnitDuration, it's not full, can reprepresent longest duration unit hour, no days, weeks, years, and cannot handle complex calendar logic
// -> decided not to use it for now
//
/// NSUnitDuration, : [T], base is seconds
// NSUnitDuration is not meant to be used for date calculation.  Use NSDate/NSCalendar/NSDateComponents for calendrical date and time operations.
public enum DurationMUnit: Str, StrEnumT, MeasureUnitT {
    
    case hours, minutes, seconds, milliseconds, microseconds, nanoseconds , picoseconds
}
public extension DurationMUnit {
    
    init?(_ str: Str,
          _ format: MeasureUnitFormat = .init()) {
        
        if let obj = Self.allForms.first(where: { $0.allStrs(format).contains(str)
            
            //            //cases: 1 час, 2 часа, 6 часов
            //
            //            let single = obj.single(format) // 1, 21 минуты
            //            let plural = obj.plural(format) // 2, 22 минуты
            //
            //            print("------------")
            //            print("single: \(single)")
            //            print("plural: \(plural)")
            //
            //            if let pluralAfter5 = obj.pluralAfter5(format) {
            //                print("pluralAfter5: \(pluralAfter5)") // 6, 26 минут
            //            }
            //            //print("------------")
            
        }) {
            self = obj
        } else {
            return nil
        }
    }
    
    var unit: UnitDuration {
        switch self {
        case .hours:
            return U.hours
        case .minutes:
            return U.minutes
        case .seconds:
            return U.seconds
        case .milliseconds:
            return U.milliseconds
        case .microseconds:
            return U.microseconds
        case .nanoseconds:
            return U.nanoseconds
        case .picoseconds:
            return U.picoseconds
        }
    }
    
    var munit: MeasureUnit {
        .duration(self)
    }
    
    /// can init with known unit
    init(_ unit: UnitDuration) {
        switch unit {
        case U.hours:
            self = .hours
        case U.minutes:
            self = .minutes
        case U.seconds:
            self = .seconds
        case U.milliseconds:
            self = .milliseconds
        case U.microseconds:
            self = .microseconds
        case U.nanoseconds:
            self = .nanoseconds
        case U.picoseconds:
            self = .picoseconds
        default:
            L.notImpl()
        // return nil
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


fileprivate extension DurationMUnit {
    typealias U = UnitDuration
    
    //TODO: consider making this as interface, and iml the rest as convs in protocol ext
    func form(_ num: Double,
              _ format: MeasureUnitFormat) -> Str {
        let ftr = fmtr(format)
        let str: Str
        switch self {
        case .hours:
            str = ftr.str(from: num.hours) // 6, 19 часов
        case .minutes:
            str = ftr.str(from: num.minutes)  // 6, 19 минут
        case .seconds:
            str = ftr.str(from: num.seconds)
        case .milliseconds:
            str = ftr.str(from: num.milliseconds)
        case .microseconds:
            str = ftr.str(from: num.microseconds)
        case .nanoseconds:
            str = ftr.str(from: num.nanoseconds)
        case .picoseconds:
            str = ftr.str(from: num.picoseconds)
        }
        return str.wordsExceptFirst!
    }
}
