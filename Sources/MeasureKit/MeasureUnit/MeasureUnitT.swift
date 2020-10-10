

public protocol DimensionConvertibleT { //DimensionConvertibleP
    associatedtype UnitType: Dimension
    
    var unit: UnitType {get}
    init?(_ unit: UnitType)
}

public extension DimensionConvertibleT {
    typealias MeasurementType = Measurement<UnitType>
    
    func measurement(_ value: Double) -> MeasurementType {
        MeasurementType(value, unit)
    }
    
    // ? HasDimensionP
    var dim: Dimension {
        unit
    }
}


//MARK: -

public protocol MeasureUnitT: MeasureUnitP, DimensionConvertibleT, HasAllFormsT {
    
    init?(_ str: Str,
          _ format: MeasureUnitFormat)
}
public extension MeasureUnitT {
    
    init?(_ str: Str,
          _ unitStyle: MeasUnitStyle = .medium,
          _ locale: LIDP = LID.english) {
        self.init(str, .init(unitStyle: unitStyle,
                             locale))
    }
    
    init?(symbol: Str) {
        if let a = Self.allForms.first(where: {
            $0.symbol == symbol
        }) {
            self = a
        } else {
            return nil
        }
    }
    
    init?(_ dim: Dimension) {
        if let unit = dim as? UnitType {
            self.init(unit)
        } else {
            return nil
        }
    }
    
    //MARK: -
    
    static var allUnits: Set<UnitType> {
        allForms.map{$0.unit}.set
    }
    
    static var allMUnits: Set<MeasureUnit> {
        allForms.munits
    }
}

extension MeasureUnitT {
    
    /// ! numFormat = .none
    func fmtr(_ format: MeasureUnitFormat) -> MeasurementFormatter {
        fmtr(format.unitStyle, format.lid)
    }
    
    /// ! numFormat = .none
    func fmtr(_ unitStyle: MeasUnitStyle,
              _ locale: LIDP) -> MeasurementFormatter {
        .sharedMeasurementFormatter(unitStyle: unitStyle,
                                    numFormat: .none, locale)
    }
}


