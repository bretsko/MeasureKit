


//TODO: consider making generic with
//public struct MeasureG<UnitType: Dimension> { // Hashable, StrEnumT
//typealias MType = Measurement<UnitType> <-> MeasureG<UnitType>
public struct MeasureUnitFormat: HasAllFormsT, HasLID {
    
    // formatting options are stored to allow interpreting Strings and store inter results for diff locales, styles
    public var unitStyle: MeasUnitStyle
    
    public var lid: LID
}

public extension MeasureUnitFormat {
    
    init(unitStyle: MeasUnitStyle = .medium,
         _ lid: LID = LID.english) {
        self.unitStyle = unitStyle
        self.lid = lid
    }
    
    init(unitStyle: MeasUnitStyle = .medium,
         _ lid: LIDP) {
        self.init(unitStyle: unitStyle, LID(lid))
    }
    
    static var allForms: Set<Self> {
        MeasUnitStyle.allForms.map { unitStyle in
            LID.allForms.map { locale in
                Self(unitStyle: unitStyle, locale)
            }
        }.flatMap{$0}.set
    }
}

