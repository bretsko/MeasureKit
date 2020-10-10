




//TODO: consider making generic with
//public struct MeasureG<UnitType: Dimension> { // Hashable, StrEnumT
//typealias MType = Measurement<UnitType> <-> MeasureG<UnitType>
public struct MeasureFormat: HasAllFormsT, HasNumberFormatP {
    
    public var numberFormat: NumberFormat
    
    // formatting options are stored to allow interpreting Strings and store inter results for diff locales, styles
    var unitStyle: MeasUnitStyle
}

public extension MeasureFormat {
    
    init(unitStyle: MeasUnitStyle = .medium,
         _ numberFormat: NumberFormat = .init()) {
        self.unitStyle = unitStyle
        self.numberFormat = numberFormat
    }
    
    init(unitStyle: MeasUnitStyle,
         numFormat: NumFormat = .none,
         roundingMode: NumRoundingMode = .down,
         usesGroupingSeparator: Bool = false,
         minFractionDigits: Int = 0,
         maxFractionDigits: Int = 10,
         _ lid: LIDP = LID.englishUS) {
        let numFormat = NumberFormat(numFormat: numFormat, roundingMode: roundingMode, usesGroupingSeparator: usesGroupingSeparator, minFractionDigits: minFractionDigits, maxFractionDigits: maxFractionDigits, LID(lid))
        self.init(unitStyle: unitStyle, numFormat)
    }
    
    
    /// reuses locale from numberFormat
    var unitFormat: MeasureUnitFormat {
        get {
            MeasureUnitFormat(unitStyle: unitStyle,
                              lid)
        }
        set {
            lid = newValue.lid
            unitStyle = newValue.unitStyle
        }
    }
    
    var lid: LID {
        get {
            numberFormat.lid
        }
        set {
            numberFormat.lid = newValue
        }
    }
    
    
    static var allForms: Set<Self> {
        MeasUnitStyle.allForms.map { unitStyle in
            NumberFormat.allForms.map { numberFormat in
                Self(unitStyle: unitStyle, numberFormat)
            }
        }.flatMap{$0}.set
    }
}




//extension MeasFormatterOptions: HasAllFormsT {
//    //TODO: not using temperatureWithoutUnit ??? -> temp is special case?
//    public static var allForms: Set<Self> {
//        [ .providedUnit, .naturalScale].set
//    }
//}



