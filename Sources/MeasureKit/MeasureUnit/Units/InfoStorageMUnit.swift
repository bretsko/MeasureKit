
public typealias UnitInfoStorage = UnitInformationStorage

//TODO: bytes vs bits -> 2 diff models ?
public enum InfoStorageMUnit: Str, StrEnumT, MeasureUnitT {
    
    case bytes, bits, exabytes, terabytes, gigabytes, megabytes, kilobytes,  terabits, gigabits, megabits, kilobits
    
    //nibbles, yottabytes, zettabytes, petabytes
    // yottabits, zettabits, exabits, petabits,
    //yobibytes, zebibytes, exbibytes, pebibytes, tebibytes, gibibytes, mebibytes, kibibytes, yobibits, zebibits, exbibits, pebibits, tebibits, gibibits, mebibits, kibibits
}
public extension InfoStorageMUnit {
    
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
    
    
    var unit: UnitInfoStorage {
        switch self {
        case .bytes:
            return U.bytes
        case .bits:
            return U.bits
        case .exabytes:
            return U.exabytes
        case .terabytes:
            return U.terabytes
        case .gigabytes:
            return U.gigabytes
        case .megabytes:
            return U.megabytes
        case .kilobytes:
            return U.kilobytes
        case .terabits:
            return U.terabits
        case .gigabits:
            return U.gigabits
        case .megabits:
            return U.megabits
        case .kilobits:
            return U.kilobits
            
        //        case .nibbles:
        //            return U.nibbles
        //        case .yottabytes:
        //            return U.yottabytes
        //        case .zettabytes:
        //            return U.zettabytes
        //        case .petabytes:
        //            return U.petabytes
        //        case .yottabits:
        //            return U.yottabits
        //        case .zettabits:
        //            return U.zettabits
        //        case .exabits:
        //            return U.exabits
        //        case .petabits:
        //            return U.petabits
        //        case .yobibytes:
        //            return U.yobibytes
        //        case .zebibytes:
        //            return U.zebibytes
        //        case .exbibytes:
        //            return U.exbibytes
        //        case .pebibytes:
        //            return U.pebibytes
        //        case .tebibytes:
        //            return U.tebibytes
        //        case .gibibytes:
        //            return U.gibibytes
        //        case .mebibytes:
        //            return U.mebibytes
        //        case .kibibytes:
        //            return U.kibibytes
        //        case .yobibits:
        //            return U.yobibits
        //        case .zebibits:
        //            return U.zebibits
        //        case .exbibits:
        //            return U.exbibits
        //        case .pebibits:
        //            return U.pebibits
        //        case .tebibits:
        //            return U.tebibits
        //        case .gibibits:
        //            return U.gibibits
        //        case .mebibits:
        //            return U.mebibits
        //        case .kibibits:
        //            return U.kibibits
        ///}
        }
    }
    
    var munit: MeasureUnit {
        .infoStorage(self)
    }
    
    /// can init with known unit
    init(_ unit: UnitInfoStorage) {
        switch unit {
        case U.bytes:
            self = .bytes
        case U.bits:
            self = .bits
        case .terabytes:
            self = .terabytes
        case .gigabytes:
            self = .gigabytes
        case .megabytes:
            self = .megabytes
        case .kilobytes:
            self = .kilobytes
        case .terabits:
            self = .terabits
        case .gigabits:
            self = .gigabits
        case .megabits:
            self = .megabits
        case .kilobits:
            self = .kilobits
        default:
            L.notImpl()
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

fileprivate extension InfoStorageMUnit {
    typealias U = UnitInfoStorage
    
    //TODO: consider making this as interface, and iml the rest as convs in protocol ext
    func form(_ num: Double,
              _ format: MeasureUnitFormat) -> Str {
        let ftr = fmtr(format)
        let str: Str
        switch self {
        case .bytes:
            str = ftr.str(from: num.bytes)
        case .bits:
            str = ftr.str(from: num.bits)
        case .exabytes:
            str = ftr.str(from: num.exabytes)
        case .terabytes:
            str = ftr.str(from: num.terabytes)
        case .gigabytes:
            str = ftr.str(from: num.gigabytes)
        case .megabytes:
            str = ftr.str(from: num.megabytes)
        case .kilobytes:
            str = ftr.str(from: num.kilobytes)
        case .terabits:
            str = ftr.str(from: num.terabits)
        case .gigabits:
            str = ftr.str(from: num.gigabits)
        case .megabits:
            str = ftr.str(from: num.megabits)
        case .kilobits:
            str = ftr.str(from: num.kilobits)
        }
        return str.wordsExceptFirst!
    }
}




