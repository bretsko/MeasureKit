



/// NSUnitMass: [M], base is kilograms
public enum MassMUnit: Str, StrEnumT, MeasureUnitT {
    
    case kilograms, grams, decigrams, centigrams, milligrams, micrograms, nanograms, picograms, ounces, stones, metricTons, shortTons, carats, ouncesTroy, slugs, pounds
    
}
public extension MassMUnit {
    
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
    
    
    var unit: UnitMass {
        switch self {
        case .kilograms:
            return U.kilograms
        case .grams:
            return U.grams
        case .decigrams:
            return U.decigrams
        case .centigrams:
            return U.centigrams
        case .milligrams:
            return U.milligrams
        case .micrograms:
            return U.micrograms
        case .nanograms:
            return U.nanograms
        case .picograms:
            return U.picograms
        case .ounces:
            return U.ounces
        case .stones:
            return U.stones
        case .metricTons:
            return U.metricTons
        case .shortTons:
            return U.shortTons
        case .carats:
            return U.carats
        case .ouncesTroy:
            return U.ouncesTroy
        case .slugs:
            return U.slugs
        case .pounds:
            return U.pounds
        }
    }
    
    var munit: MeasureUnit {
        .mass(self)
    }
    
    /// can init with known unit
    init(_ unit: UnitMass) {
        switch unit {
        case U.kilograms:
            self = .kilograms
        case U.grams:
            self = .grams
        case U.decigrams:
            self = .decigrams
        case U.centigrams:
            self = .centigrams
        case U.milligrams:
            self = .milligrams
        case U.micrograms:
            self = .micrograms
        case U.nanograms:
            self = .nanograms
        case U.picograms:
            self = .picograms
        case U.pounds:
            self = .pounds
        case U.ounces:
            self = .ounces
        case U.stones:
            self = .stones
        case U.metricTons:
            self = .metricTons
        case U.shortTons:
            self = .shortTons
        case U.carats:
            self = .carats
        case U.ouncesTroy:
            self = .ouncesTroy
        case U.slugs:
            self = .slugs
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

fileprivate extension MassMUnit {
    typealias U = UnitMass
    
    //TODO: consider making this as interface, and iml the rest as convs in protocol ext
    func form(_ num: Double,
              _ format: MeasureUnitFormat) -> Str {
        let ftr = fmtr(format)
        let str: Str
        switch self {
        case .kilograms:
            str = ftr.str(from: num.kilograms)
        case .grams:
            str = ftr.str(from: num.grams)
        case .decigrams:
            str = ftr.str(from: num.decigrams)
        case .centigrams:
            str = ftr.str(from: num.centigrams)
        case .milligrams:
            str = ftr.str(from: num.milligrams)
        case .micrograms:
            str = ftr.str(from: num.micrograms)
        case .nanograms:
            str = ftr.str(from: num.nanograms)
        case .picograms:
            str = ftr.str(from: num.picograms)
        case .ounces:
            str = ftr.str(from: num.ounces)
        case .stones:
            str = ftr.str(from: num.stones)
        case .metricTons:
            str = ftr.str(from: num.metricTons)
        case .shortTons:
            str = ftr.str(from: num.shortTons)
        case .carats:
            str = ftr.str(from: num.carats)
        case .ouncesTroy:
            str = ftr.str(from: num.ouncesTroy)
        case .slugs:
            str = ftr.str(from: num.slugs)
        case .pounds:
            str = ftr.str(from: num.pounds)
        }
        
        return str.wordsExceptFirst!
    }
}
