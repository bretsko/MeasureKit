
public extension MeasureFormatter {
    private static let _shared = MeasureFormatter()

    
    //MARK: - shared
    
    static func shared(format: MeasureFormat = .init(),
                       minFractionDigits: Int = 0,
                       maxFractionDigits: Int = 10) -> MeasureFormatter {
        shared(unitStyle: format.unitStyle,
               numFormat: format.numFormat,
               minFractionDigits: minFractionDigits,
               maxFractionDigits: maxFractionDigits,
               format.lid)
    }
    
    
    /// Returns a singleton
    ///
    /// - parameter unitStyle:  by default medium
    /// - parameter unitOptions:  by default uses providedUnit, set empty to get preferred value for you Locale
    /// - parameter numFormat: by default decimal
    static func shared(unitStyle: MeasUnitStyle = .medium,
                       numFormat: NumFormat = .decimal,
                       minFractionDigits: Int = 0,
                       maxFractionDigits: Int = 10,
                       _ lid: LIDP = LID.english) -> MeasureFormatter {
        var fmtr = _shared
        fmtr.unitStyle = unitStyle
        
        /// By default, if unitOptions is set to the empty set, the formatter will do the following:
        /// - kilocalories may be formatted as "C" instead of "kcal" depending on the locale.
        /// - kilometersPerHour may be formatted as "miles per hour" for US and UK locales but "kilometers per hour" for other locales.
        ///
        /// However, if providedUnit is set, the formatter will do the following:
        /// - kilocalories would be formatted as "kcal" in the language of the locale, even if the locale prefers "C".
        /// - kilometersPerHour would be formatted as "kilometers per hour" for US and UK locales even though the preference is for "miles per hour."
        ///
        /// Note that formatter will handle converting measurement objects to the preferred units in a particular locale.  For instance, if provided a measurement object in kilometers and the set locale is en_US, the formatter will implicitly convert the measurement object to miles and return the formatted string as the equivalent measurement in miles.

        //fmtr.unitOptions = .providedUnit
        fmtr.lid = LID(lid)
        
        /// somehow fmtr.numberFormatter setter nullifies set numFormat, so I cannot use it
        //fmtr.numFormatter.locale = locale.locale
        
        fmtr.numFormat = numFormat
        fmtr.minFractionDigits = minFractionDigits
        fmtr.maxFractionDigits = maxFractionDigits
        
        //??
        // alwaysShowsDecimalSeparator = true
        // generatesDecimalNumbers = false
        
        return fmtr
    }
}


public extension MeasurementFormatter {
    
    var lid: LID {
        get {
            locale.lid
        }
        set {
            locale = newValue.locale
        }
    }
    
    // convs
    func str<UnitType: Unit>(from meas: Measurement<UnitType>) -> Str {
        string(from: meas)
    }
    func str(from dim: Dimension) -> Str {
        string(from: dim)
    }
    
    static func sharedMeasurementFormatter(format: MeasureFormat,
                                           minFractionDigits: Int = 0,
                                           maxFractionDigits: Int = 10) -> MeasurementFormatter {
        sharedMeasurementFormatter(unitStyle: format.unitStyle,
                                   numFormat: format.numFormat,
                                   minFractionDigits: minFractionDigits,
                                   maxFractionDigits: maxFractionDigits,
                                   format.lid)
    }
}

