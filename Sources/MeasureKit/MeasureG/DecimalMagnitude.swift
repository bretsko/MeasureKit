


public enum Magnitude: Double {
    
    case nano = 0.000_000_001
    case micro = 0.000_001
    case milli = 0.001
    case centi = 0.01
    case deci = 0.1
    case base = 1.0
    case deka = 10.0
    case hecto = 100.0
    case kilo = 1_000.0
    case mega = 1_000_000.0
    case giga = 1_000_000_000.0
    case tera = 1_000_000_000_000.0
    case peta = 1_000_000_000_000_000.0
}


///Enum of ISO prefixes for decimal (base 10) orders of magnitude
public enum DecimalMagnitude: Str, StrEnumT { //OrderOfMagnitude
    
    case yocto
    case zepto
    case atto
    case femto
    case pico
    case nano
    case micro
    case milli
    case centi
    case deci
    case uni
    case deca
    case hecto
    case kilo
    case mega
    case giga
    case tera
    case peta
    case exa
    case zeta
    case yota
    
    
    var value: Double {
        switch self {
        case .yocto:
            return 1.0e-24
        case .zepto:
            return 1.0e-21
        case .atto:
            return 1.0e-18
        case .femto:
            return 1.0e-15
        case .pico:
            return 1.0e-12
        case .nano:
            return 1.0e-9
        case .micro:
            return 1.0e-6
        case .milli:
            return 1.0e-3
        case .centi:
            return 1.0e-2
        case .deci:
            return 1.0e-1
        case .uni:
            return 1.0e0
        case .deca:
            return 1.0e1
        case .hecto:
            return 1.0e2
        case .kilo:
            return 1.0e3
        case .mega:
            return 1.0e6
        case .giga:
            return 1.0e9
        case .tera:
            return 1.0e12
        case .peta:
            return 1.0e15
        case .exa:
            return 1.0e18
        case .zeta:
            return 1.0e21
        case .yota:
            return 1.0e24
        }
    }
    
    var symbol: Str {
        fatalError()
        //        ["y", "z", "a", "f", "p", "n", "µ", "m", "c", "d",
        //         "",
        //         "㍲", "h", "k", "M", "G", "T", "P", "E", "Z", "Y"]
    }
}

///Enum of IEC and IEEE 1541 prefixes for binary (base 2) orders of magnitude
public enum BinaryMagnitude: Str, StrEnumT { //OrderOfMagnitude
    case uni
    case kibi
    case mebi
    case gibi
    case tebi
    case pebi 
    case exbi
    case zebi
    case yobi
    
    var value: Double {
        switch self {
        case .uni:
            return 0x01p0
        case .kibi:
            return 0x01p10
        case .mebi:
            return 0x01p20
        case .gibi:
            return 0x01p30
        case .tebi:
            return 0x01p40
        case .pebi:
            return 0x01p50
        case .exbi:
            return 0x01p60
        case .zebi:
            return 0x01p70
        case .yobi:
            return 0x01p80
        }
    }
    
    var symbol: Str {
        fatalError()
        //        ["",
        //         "Ki", "Mi", "Gi", "Ti", "Pi", "Ei", "Zi", "Yi"]
    }
}



/////Types that conform to OrderOfMagnitude are typically enumerations
///// that associate a power with a symbolic representation.
///// For example ISO prefixes for decimal (base 10) orders of magnitude: 1.0e3 = k
//protocol OrderOfMagnitude: CaseIterable {
//    //An array of the powers of the magnitudes
//    static var powers: [Int] {get}
//
//    //An array of the symbols associated with the magnitudes
//    static var symbols: [Str] {get}
//
//    //symbol for the current magnitude
//    var symbol:Str {get}
//}
//
//extension OrderOfMagnitude where Self: Equatable, Self: RawRepresentable {
//    static var powers: [Int] {
//        allCases.map {Int(log10($0.rawValue as! Double))}
//    }
//
//    var symbol: Str {
//        get {
//            Self.symbols[caseIndex()]
//        }
//    }
//
//    func caseIndex() -> Int {
//        //force unwrap protected by logical requirement that self be in the array of allCases
//        Self.allCases.firstIndex(of: self) as! Int
//    }
//}


////Protocol for converting values to and from orders of magnitude
//protocol MagnitudeConversion {
//    associatedtype T: OrderOfMagnitude
//
//    ///Convert value to associated order of magnitude.
//    ///
//    ///  Examples:
//    ///  * 1500 units = 1.5 kilo-units
//    ///  * 1500 kilo-units = 1.5 mega-units
//    func toMagnitude(_ units: Double, fromMagnitude: T) -> Double
//
//    ///Convert value from associated order of magnitude.
//    ///
//    ///  Examples:
//    ///  * 1.5 kilo-units = 1500 units
//    ///  * 1.5 mega-units = 1500 kilo-units
//    func fromMagnitude(_ units: Double, toMagnitude: T) -> Double
//
//    ///Get nearest magnitude enum for given value
//    ///
//    ///  Examples:
//    ///  * 0.001 = .milli
//    ///  * 1000.0 = .kilo
//    ///  * 15000.0 = .kilo
//    ///  * 1000000000000000000000000.0 = .yota
//    static func magnitude(_ units: Double) -> T
//
//    ///Get value converted to nearest OrderOfMagnitude
//    ///
//    ///  Examples:
//    ///  * 0.001 = (1.0, .milli)
//    ///  * 1000.0 = (1.0, .kilo)
//    ///  * 1024.0 = (1.0, .kibi)
//    ///  * 4194304.0 = (4.0, .mebi)
//    static func toNearestMagnitude(_ units: Double) -> (Double, T)
//}
//
//extension MagnitudeConversion where Self: Equatable, Self: RawRepresentable, Self: CaseIterable, T: RawRepresentable, T: CaseIterable {
//    func toMagnitude(_ units: Double, fromMagnitude: T) -> Double {
//        (units * (fromMagnitude.rawValue as! Double)) / (rawValue as! Double)
//    }
//
//    func fromMagnitude(_ units: Double, toMagnitude: T) -> Double {
//        (rawValue as! Double) * (units / (toMagnitude.rawValue as! Double))
//    }
//
//    static func magnitude(_ units: Double) -> T {
//        //get order of magnitude of input
//        let mag: Int = Int(floor(log10(units.magnitude)))
//
//        //get index of case <= magnitude...
//        // clamp to upper/lower bounds for values outside range
//        //        var index: Int? = T.powers.lastIndex(where: {$0 <= mag})
//        //        if index == nil {
//        //            index = units.magnitude < 1.0 ? 0 : (allCases.count - 1)
//        //        }
//
//        if let index: T.AllCases.Index = T.powers.lastIndex(where: {$0 <= mag}) as? Self.T.AllCases.Index {
//            return T.allCases[index]
//        } else if units.magnitude < 1.0 {
//            return T.allCases.first!
//        } else {
//            return T.allCases[allCases.count - 1 as! Self.T.AllCases.Index]
//        }
//    }
//}
//
//extension DecimalMagnitude: MagnitudeConversion {
//    static func toNearestMagnitude(_ units: Double) -> (Double, DecimalMagnitude) {
//        let mag = magnitude(units)
//        return (mag.toMagnitude(units, fromMagnitude: .uni), mag)
//    }
//}
//
//extension BinaryMagnitude: MagnitudeConversion {
//    static func toNearestMagnitude(_ units: Double) -> (Double, BinaryMagnitude) {
//        let mag = magnitude(units)
//        return (mag.toMagnitude(units, fromMagnitude: .uni), mag)
//    }
//}
//
//extension Double {
//    var nearestDecimalMagnitude: (Double, DecimalMagnitude) {
//        DecimalMagnitude.toNearestMagnitude(self)
//    }
//
//    var nearestBinaryMagnitude: (Double, BinaryMagnitude) {
//        BinaryMagnitude.toNearestMagnitude(self)
//    }
//}


