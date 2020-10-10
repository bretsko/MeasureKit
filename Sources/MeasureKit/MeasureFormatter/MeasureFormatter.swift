
@_exported import LocalBase


protocol MeasureFormatterP: class, HasNumberFormatP, HasLID {
    
    var format: MeasureFormat {get}
    
    /// Some cases cannot be handled currently, returns nil for those (only number, spellOut format, a few locales (Chinese, etc)
    func str(from measure: Measure) -> Str?
    
    func inter(_ str: Str,
               min: Double, max: Double, step: Double,
               possibleUnits: Set<MeasureUnit>,
               _ possibleFormats: Set<MeasureFormat>) -> Set<Measure>?
}

public final class MeasureFormatter: MeasureFormatterP {
    
    var measFmtr = MeasurementFormatter()
    
    var numFmtr = NumFormatter()
    
    public init(_ format: MeasureFormat = .init()) {
        self.format = format
    }
}

public extension MeasureFormatter {
    
    convenience init(unitStyle: MeasUnitStyle = .medium,
                     _ numberFormat: NumberFormat = .init()) {
        let format = MeasureFormat(unitStyle: unitStyle, numberFormat)
        self.init(format)
    }
    
    convenience init(unitStyle: MeasUnitStyle,
                     numFormat: NumFormat = .none,
                     roundingMode: NumRoundingMode = .down,
                     usesGroupingSeparator: Bool = false,
                     minFractionDigits: Int = 0,
                     maxFractionDigits: Int = 10,
                     _ lid: LIDP = LID.englishUS) {
        let numFormat = NumberFormat(numFormat: numFormat, roundingMode: roundingMode, usesGroupingSeparator: usesGroupingSeparator, minFractionDigits: minFractionDigits, maxFractionDigits: maxFractionDigits, LID(lid))
        self.init(unitStyle: unitStyle, numFormat)
    }
    
    
    //MARK: -
    
    var format: MeasureFormat {
        get {
            MeasureFormat(unitStyle: unitStyle, numberFormat)
        }
        set {
            unitStyle = newValue.unitStyle
            numberFormat = newValue.numberFormat
            lid = newValue.lid
        }
    }
    
    //HasNumberFormatP
    var numberFormat: NumberFormat {
        get  {
            numFmtr.format
        }
        set {
            numFmtr.format = newValue
        }
    }
    
    var unitStyle: MeasUnitStyle {
        get  {
            measFmtr.unitStyle
        }
        set {
            measFmtr.unitStyle = newValue
        }
    }
    
    var lid: LID {
        get  {
            numFmtr.lid
        }
        set {
            numFmtr.lid = newValue
            measFmtr.lid = newValue
        }
    }
    
    
    /// doesn't nullify, only sets new values
    /// if lid is provided - it overrides the one in numberFormat
    func setFormat(unitStyle: MeasUnitStyle? = nil,
                   _ numberFormat: NumberFormat? = nil,
                   _ lid: LIDP? = nil) {
        
        if let a = unitStyle {
            self.unitStyle = a
        }
        if let a = numberFormat {
            self.numberFormat = a
        }
        if let a = lid {
            self.lid = LID(a)
        }
    }
     
    
    /// doesn't nullify, only sets new values
    /// if lid is provided - it overrides the one in numberFormat
//    func setFormat(_ numFormat: NumFormat? = nil,
//                   roundingMode: NumRoundingMode? = nil,
//                   usesGroupingSeparator: Bool? = nil,
//                   minFractionDigits: Int? = nil,
//                   maxFractionDigits: Int? = nil,
//                   _ lid: LID? = nil) {
//        if let a = numFormat {
//            self.numFormat = a
//        }
//        if let a = lid {
//            self.lid = a
//        }
//        if let a = roundingMode {
//            self.roundingMode = a
//        }
//        if let a = usesGroupingSeparator {
//            self.usesGroupingSeparator = a
//        }
//        if let a = minFractionDigits {
//            self.minFractionDigits = a
//        }
//        if let a = maxFractionDigits {
//            self.maxFractionDigits = a
//        }
//    }
}

