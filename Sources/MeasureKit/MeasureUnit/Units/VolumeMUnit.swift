



/// NSUnitVolume: [L^3], base is liters
public enum VolumeMUnit: Str, StrEnumT, MeasureUnitT {
    
    case megaliters, kiloliters, liters, deciliters, centiliters, milliliters, cubicKilometers, cubicMeters, cubicDecimeters, cubicCentimeters, cubicMillimeters, cubicInches, cubicFeet, cubicYards, cubicMiles, acreFeet, bushels, teaspoons, tablespoons, fluidOunces, cups, pints, quarts, gallons, imperialTeaspoons, imperialTablespoons, imperialFluidOunces, imperialPints, imperialQuarts, imperialGallons, metricCups
}
public extension VolumeMUnit {
    
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
    
    var unit: UnitVolume {
        switch self {
        case .megaliters:
            return U.megaliters
        case .kiloliters:
            return U.kiloliters
        case .liters:
            return U.liters
        case .deciliters:
            return U.deciliters
        case .centiliters:
            return U.centiliters
        case .milliliters:
            return U.milliliters
        case .cubicKilometers:
            return U.cubicKilometers
        case .cubicMeters:
            return U.cubicMeters
        case .cubicDecimeters:
            return U.cubicDecimeters
        case .cubicCentimeters:
            return U.cubicCentimeters
        case .cubicMillimeters:
            return U.cubicMillimeters
        case .cubicInches:
            return U.cubicInches
        case .cubicFeet:
            return U.cubicFeet
        case .cubicYards:
            return U.cubicYards
        case .cubicMiles:
            return U.cubicMiles
        case .acreFeet:
            return U.acreFeet
        case .bushels:
            return U.bushels
        case .teaspoons:
            return U.teaspoons
        case .tablespoons:
            return U.tablespoons
        case .fluidOunces:
            return U.fluidOunces
        case .cups:
            return U.cups
        case .pints:
            return U.pints
        case .quarts:
            return U.quarts
        case .gallons:
            return U.gallons
        case .imperialTeaspoons:
            return U.megaliters
        case .imperialTablespoons:
            return U.imperialTablespoons
        case .imperialFluidOunces:
            return U.imperialFluidOunces
        case .imperialPints:
            return U.imperialPints
        case .imperialQuarts:
            return U.imperialQuarts
        case .imperialGallons:
            return U.imperialGallons
        case .metricCups:
            return U.metricCups
        }
    }
    
    var munit: MeasureUnit {
        .volume(self)
    }
    
    /// can init with known unit
    init(_ unit: UnitVolume) {
        switch unit {
        case U.megaliters:
            self = .megaliters
        case U.kiloliters:
            self = .kiloliters
        case U.liters:
            self = .liters
        case U.deciliters:
            self = .deciliters
        case U.centiliters:
            self = .centiliters
        case U.milliliters:
            self = .milliliters
        case U.cubicKilometers:
            self = .cubicKilometers
        case U.cubicMeters:
            self = .cubicMeters
        case U.cubicDecimeters:
            self = .cubicDecimeters
        case U.cubicCentimeters:
            self = .cubicCentimeters
        case U.cubicMillimeters:
            self = .cubicMillimeters
        case U.cubicInches:
            self = .cubicInches
        case U.cubicFeet:
            self = .cubicFeet
        case U.cubicYards:
            self = .cubicYards
        case U.cubicMiles:
            self = .cubicMiles
        case U.acreFeet:
            self = .acreFeet
        case U.bushels:
            self = .bushels
        case U.teaspoons:
            self = .teaspoons
        case U.tablespoons:
            self = .tablespoons
        case U.fluidOunces:
            self = .fluidOunces
        case U.cups:
            self = .cups
        case U.pints:
            self = .pints
        case U.quarts:
            self = .quarts
        case U.gallons:
            self = .gallons
        case U.imperialTeaspoons:
            self = .imperialTeaspoons
        case U.megaliters:
            self = .megaliters
        case U.imperialTablespoons:
            self = .imperialTablespoons
        case U.imperialFluidOunces:
            self = .imperialFluidOunces
        case U.imperialPints:
            self = .imperialPints
        case U.imperialQuarts:
            self = .imperialQuarts
        case U.imperialGallons:
            self = .imperialGallons
        case U.metricCups:
            self = .metricCups
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

fileprivate extension VolumeMUnit {
    typealias U = UnitVolume
    
    //TODO: consider making this as interface, and impl the rest as convs in protocol ext
    func form(_ num: Double,
              _ format: MeasureUnitFormat) -> Str {
        let ftr = fmtr(format)
        let str: Str
        switch self {
        case .megaliters:
            str = ftr.str(from: num.megaliters)
        case .kiloliters:
            str = ftr.str(from: num.kiloliters)
        case .liters:
            str = ftr.str(from: num.liters)
        case .deciliters:
            str = ftr.str(from: num.deciliters)
        case .centiliters:
            str = ftr.str(from: num.centiliters)
        case .milliliters:
            str = ftr.str(from: num.milliliters)
        case .cubicKilometers:
            str = ftr.str(from: num.cubicKilometers)
        case .cubicMeters:
            str = ftr.str(from: num.cubicMeters)
        case .cubicDecimeters:
            str = ftr.str(from: num.cubicDecimeters)
        case .cubicCentimeters:
            str = ftr.str(from: num.cubicCentimeters)
        case .cubicMillimeters:
            str = ftr.str(from: num.cubicMillimeters)
        case .cubicInches:
            str = ftr.str(from: num.cubicInches)
        case .cubicFeet:
            str = ftr.str(from: num.cubicFeet)
        case .cubicYards:
            str = ftr.str(from: num.cubicYards)
        case .cubicMiles:
            str = ftr.str(from: num.cubicMiles)
        case .acreFeet:
            str = ftr.str(from: num.acreFeet)
        case .bushels:
            str = ftr.str(from: num.bushels)
        case .teaspoons:
            str = ftr.str(from: num.teaspoons)
        case .tablespoons:
            str = ftr.str(from: num.tablespoons)
        case .fluidOunces:
            str = ftr.str(from: num.fluidOunces)
        case .cups:
            str = ftr.str(from: num.cups)
        case .pints:
            str = ftr.str(from: num.pints)
        case .quarts:
            str = ftr.str(from: num.quarts)
        case .gallons:
            str = ftr.str(from: num.gallons)
        case .imperialTeaspoons:
            str = ftr.str(from: num.imperialTeaspoons)
        case .imperialTablespoons:
            str = ftr.str(from: num.imperialTablespoons)
        case .imperialFluidOunces:
            str = ftr.str(from: num.imperialFluidOunces)
        case .imperialPints:
            str = ftr.str(from: num.imperialPints)
        case .imperialQuarts:
            str = ftr.str(from: num.imperialQuarts)
        case .imperialGallons:
            str = ftr.str(from: num.imperialGallons)
        case .metricCups:
            str = ftr.str(from: num.metricCups)
        }
        return str.wordsExceptFirst!
    }
}
