

extension Measurement: MeasureP {}
public extension Measurement {
    
    // conv
    init(_ value: Double, _ unit: UnitType) {
        self.init(value: value, unit: unit)
    }
    
    
    //MARK: -
    
    var munit: Dimension {
        unit as! Dimension //check which types are not Dimension, if any
    }

    /// some types are not yer supported - cna return nil
    var measureUnit: MeasureUnit {
        munit.measureUnit
    }
    
    func measure(_ format: MeasureFormat) -> Measure {
        Measure(self, format)
    }
    
    var measure: Measure {
        measure(.init())
    }
    

    //MARK: -

    /// - parameter unitStyle: There are 3 widths: long, medium, and short. For example, for English, when formatting "3 pounds" Long is "3 pounds"; medium is "3 lb"; short is "3#"
    /// - parameter unitOptions: If not specified, unitOptions defaults to localizing according to the preferences of the locale.
    ///
    /// By default, if unitOptions is set to the empty set, the formatter will do the following:
    /// - kilocalories may be formatted as "C" instead of "kcal" depending on the locale.
    /// - kilometersPerHour may be formatted as "miles per hour" for US and UK locales but "kilometers per hour" for other locales.
    ///
    /// However, if providedUnit is set, the formatter will do the following:
    /// - kilocalories would be formatted as "kcal" in the language of the locale, even if the locale prefers "C".
    /// - kilometersPerHour would be formatted as "kilometers per hour" for US and UK locales even though the preference is for "miles per hour."
    ///
    /// Note that formatter will handle converting measurement objects to the preferred units in a particular locale.  For instance, if provided a measurement object in kilometers and the set locale is en_US, the formatter will implicitly convert the measurement object to miles and return the formatted string as the equivalent measurement in miles.
    func string(unitStyle: MeasUnitStyle = .medium,
                numFormat: NumFormat = .decimal,
                _ locale: LIDP = LID.english) -> Str {
        MeasureFormatter.shared(unitStyle: unitStyle,
                                numFormat: numFormat,
                                locale).measFmtr.str(from: self)
    }
    
    func string(_ format: MeasureFormat) -> Str {
        MeasureFormatter.shared(format: format).measFmtr.str(from: self)
    }
}



//MARK: -

public typealias MeasUnitStyle = MeasurementFormatter.UnitStyle

extension MeasUnitStyle: HasAllFormsT {
    public static var allForms: Set<Self> {
        [ .short, .medium, .long ].set
    }
}



