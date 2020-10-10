

/// convertible to Dimension -> used in Measurement -> can make Str, like 100 kilometers per hour, etc
public enum MeasureUnit: MeasureUnitP, HasAllFormsT {
    
    /// radians
    case angle(AngleMUnit)
    
    /// meters
    case length(LengthMUnit)
    
    /// grams
    case mass(MassMUnit)
    
    /// liters
    case volume(VolumeMUnit)
    
    /// bytes
    case infoStorage(InfoStorageMUnit)
    
    /// celsius
    case temperature(TemperatureMUnit)
    
    //TODO: consider moving this to TimeKit 
    /// seconds
    case duration(DurationMUnit)
    
    
    
    // rare
    //case speed(SpeedMUnit)
    //case area(AreaMUnit)
    //case pressure(PressureMUnit)
    //case power(PowerMUnit)
    //case energy(EnergyMUnit)
    //case frequency(FrequencyMUnit)
    //case acceleration(AccelerationMUnit)
    
    // very rare
    //case fuelEfficiency(FuelEfficiencyMUnit)
    //case concentrationMass(ConcentrationMassMUnit)
    //case dispersion(DispersionMUnit)
    //case potentialDifference(ElectricPotentialDifferenceMUnit)
    // case illuminance(IlluminanceMUnit)
    
    // electro
    // case electricCurrent(ElectricCurrentMUnit)
    // case electricCharge(ElectricChargeMUnit)
    // case electricResistance(ElectricResistanceMUnit)
    // case electicDiff(UnitElectricPotentialDifferenceMUnit)
    
}
public extension MeasureUnit {
    
    var child: MeasureUnitP {
        switch self {
        case .angle(let a):
            return a
        case .infoStorage(let a):
            return a
        case .length(let a):
            return a
        case .volume(let a):
            return a
        case .mass(let a):
            return a
        case .duration(let a):
            return a
        case .temperature(let a):
            return a
        }
    }
    
    var dim: Dimension {
        child.dim
    }
    
    /// The symbol of a unit is a string that can be used to designate a number as a quantity of a particular unit in user-readable representations. Units typically have symbols that are abbreviated and standardized, so as to be easily and unambiguously conveyed. For example, the milePerHour unit has the symbol mph. If a unit does not have a standardized or well-understood symbol, the lowercase name of the unit can be used. For example, the metricCup unit has the symbol metric cup.
    //Unit symbols may incorporate a metric prefix to indicate a multiple or fraction of existing unit symbols. For example, the kilogram unit has the symbol kg, which uses the SI prefix k for kilo- to indicate a magnitude of 103 for the gram unit, and the microgram unit has the symbol µg, which uses the SI prefix µ for micro- to indicate a magnitude of 10-6 for the gram unit.
    var symbol: Str {
        child.symbol
    }
    var str: Str {
        child.str
    }
    var rawValue: Str {
        child.str
    }
    
    /// produces noun used for singular cases, for ex degree, kilogram, etc
    func single(_ format: MeasureUnitFormat) -> Str {
        child.single(format)
    }
    
    /// produces noun used for plural cases, for ex degrees, kilograms, etc
    func plural(_ format: MeasureUnitFormat) -> Str {
        child.plural(format)
    }
    
    /// some langs have diff values for cases from 6 to 19
    /// For ex. 3 килограмма, часа, BUT 6 килограм, часов
    func pluralAfter5(_ format: MeasureUnitFormat) -> Str? {
        child.pluralAfter5(format)
    }
    
    //MARK: -
    
    //TODO: add possible formats ?
    init?(_ str: Str,
          format: MeasureUnitFormat = .init(),
          _ possibleUnits: Set<MeasureUnit> = MeasureUnit.allForms) {
        
        //TODO: try separate into 2 funcs
        guard possibleUnits == MeasureUnit.allForms else {
            
            if let unit = possibleUnits.first(where: { unit in
                unit.allStrs(format).contains(str)
            }) {
                self = unit
                return
            } else {
                return nil
            }
        }
        
        // try all
        if let munit = AngleMUnit(str,format),
           possibleUnits.contains(munit.munit) {
            self = .angle(munit)
            
        } else if let munit = InfoStorageMUnit(str,format),
                  possibleUnits.contains(munit.munit) {
            self = .infoStorage(munit)
            
        } else if let munit = LengthMUnit(str,format),
                  possibleUnits.contains(munit.munit) {
            self = .length(munit)
            
        } else if let munit = VolumeMUnit(str,format),
                  possibleUnits.contains(munit.munit) {
            self = .volume(munit)
            
        } else if let munit = MassMUnit(str,format),
                  possibleUnits.contains(munit.munit) {
            self = .mass(munit)
            
        } else if let munit = DurationMUnit(str,format),
                  possibleUnits.contains(munit.munit) {
            self = .duration(munit)
            
        } else if let munit = TemperatureMUnit(str,format),
                  possibleUnits.contains(munit.munit) {
            self = .temperature(munit)
        }
        return nil
    }
    
    
    /// can init with known unit
    init(_ unit: Dimension) {
        if let munit = unit as? UnitAngle {
            self = .angle(.init(munit))
        } else if let munit = unit as? UnitInfoStorage {
            self = .infoStorage(.init(munit))
        } else if let munit = unit as? UnitLength {
            self = .length(.init(munit))
        } else if let munit = unit as? UnitVolume {
            self = .volume(.init(munit))
        } else if let munit = unit as? UnitMass {
            self = .mass(.init(munit))
        } else if let munit = unit as? UnitDuration {
            self = .duration(.init(munit))
        } else if let munit = unit as? UnitTemperature {
            self = .temperature(.init(munit))
        } else {
            L.notImpl()
        }
    }
    
    
    //MARK: -
    
    var angle: AngleMUnit? {
        switch self {
        case .angle(let a):
            return a
        default:
            return nil
        }
    }
    
    var infoStorage: InfoStorageMUnit? {
        switch self {
        case .infoStorage(let a):
            return a
        default:
            return nil
        }
    }
    
    var length: LengthMUnit? {
        switch self {
        case .length(let a):
            return a
        default:
            return nil
        }
    }
    
    var volume: VolumeMUnit? {
        switch self {
        case .volume(let a):
            return a
        default:
            return nil
        }
    }
    
    var mass: MassMUnit? {
        switch self {
        case .mass(let a):
            return a
        default:
            return nil
        }
    }
    
    var duration: DurationMUnit? {
        switch self {
        case .duration(let a):
            return a
        default:
            return nil
        }
    }
    
    var temperature: TemperatureMUnit? {
        switch self {
        case .temperature(let a):
            return a
        default:
            return nil
        }
    }
    
    
    //MARK: -
    
    /// Returns a set of Doubles in the range (not all possible measures !) 1 to 1 thousand, 0 is not included
    static var allForms: Set<Self> {
        [
            InfoStorageMUnit.allCases.map{Self.infoStorage($0)},
            TemperatureMUnit.allCases.map{Self.temperature($0)},
            VolumeMUnit.allCases.map{Self.volume($0)},
            AngleMUnit.allCases.map{Self.angle($0)},
            LengthMUnit.allCases.map{Self.length($0)},
            MassMUnit.allCases.map{Self.mass($0)},
            DurationMUnit.allCases.map{Self.duration($0)}
        ].flatMap{$0}.set
    }
    
    // try remove
    var munit: MeasureUnit {
        self
    }
}

public extension Dimension {
    
    /// some types are not yer supported - cna return nil
    var measureUnit: MeasureUnit {
        MeasureUnit(self)
    }
}
