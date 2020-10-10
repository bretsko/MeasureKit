

public protocol DimensionConvertibleP {
    
    var dim: Dimension {get}
    
    init?(_ dim: Dimension)
}
public extension DimensionConvertibleP {
    
    /// The symbol of a unit is a string that can be used to designate a number as a quantity of a particular unit in user-readable representations. Units typically have symbols that are abbreviated and standardized, so as to be easily and unambiguously conveyed. For example, the milePerHour unit has the symbol mph. If a unit does not have a standardized or well-understood symbol, the lowercase name of the unit can be used. For example, the metricCup unit has the symbol metric cup.
    //Unit symbols may incorporate a metric prefix to indicate a multiple or fraction of existing unit symbols. For example, the kilogram unit has the symbol kg, which uses the SI prefix k for kilo- to indicate a magnitude of 103 for the gram unit, and the microgram unit has the symbol µg, which uses the SI prefix µ for micro- to indicate a magnitude of 10-6 for the gram unit.
    var symbol: Str {
        dim.symbol
    }
}

public protocol MeasureUnitP: DimensionConvertibleP, HasStrP {
    
    var munit: MeasureUnit {get}
    
    /// produces noun used for singular cases, for ex degree, kilogram, etc
    func single(_ format: MeasureUnitFormat) -> Str
    
    /// produces noun used for plural cases, for ex degrees, kilograms, etc
    func plural(_ format: MeasureUnitFormat) -> Str
    
    /// some langs have diff values for cases from 6 to 19
    /// For ex. 3 килограмма, часа, BUT 6 килограм, часов
    func pluralAfter5(_ format: MeasureUnitFormat) -> Str?
}

public extension MeasureUnitP {

    /// singular, plural form (before 5) and plural after 5
    /// for ex for hours in Russian: час, часа, часов
    func allStrs(_ format: MeasureUnitFormat) -> Set<Str> {
        var r = Set([ single(format), plural(format) ])
        if let pluralAfter5 = pluralAfter5(format) {
            r.insert(pluralAfter5)
        }
        return r
    }
}

public extension Set where Element: MeasureUnitP {
    
    var munits: Set<MeasureUnit> {
        map{$0.munit}.set
    }
}
