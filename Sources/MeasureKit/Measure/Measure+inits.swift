



public extension Measure {
    
    
    init(_ unit: MeasureUnit,
         _ value: Double,
         unitStyle: MeasUnitStyle = .medium,
         numberFormat: NumberFormat = .init()) {
        self.init(unit, value,
                  MeasureFormat(unitStyle: unitStyle,
                                numberFormat))
    }
    
    init(_ unit: MeasureUnit,
         _ value: Double,
         unitStyle: MeasUnitStyle = .medium,
         numFormat: NumFormat = .none,
         roundingMode: NumRoundingMode = .down,
         usesGroupingSeparator: Bool = false,
         minFractionDigits: Int = 0,
         maxFractionDigits: Int = 10,
         _ lid: LIDP = LID.englishUS) {
        fatalError()
    }
    
    /// can init with gen Measurement
    init(_ obj: MeasureP,
         _ format: MeasureFormat) {
        self.init(obj.measureUnit, obj.value, format)
    }
    
    //MARK: - inter
    
    /// inits with first match
    init?(_ str: Str,
          min: Double = 1,
          max: Double = 1000,
          step: Double = 1,
          possibleUnits: Set<MeasureUnit> = MeasureUnit.allForms,
          _ possibleFormats: Set<MeasureFormat> = MeasureFormat.allForms) {
        
        let m = MeasureFormatter.shared()
        if let a = m.inter(str,
                           min:min, max:max, step:step,
                           possibleUnits: possibleUnits,
                           possibleFormats)?.first {
            self = a
        } else {
            return nil
        }
    }
    
    /// inits with first match
    init?(_ str: Str,
          min: Double = 1,
          max: Double = 1000,
          step: Double = 1,
          possibleUnits: Set<MeasureUnit> = MeasureUnit.allForms,
          _ format: MeasureFormat = MeasureFormat()) {
        self.init(str, min: min, max: max, step: step,
                  possibleUnits: possibleUnits,
                  Set([format]))
    }
    
    /// inits with first match
    init?(_ str: Str,
          min: Double = 1,
          max: Double = 1000,
          step: Double = 1,
          
          possibleUnits: Set<MeasureUnit> = MeasureUnit.allForms,
          unitStyle: MeasUnitStyle = .medium,
          numberFormat: NumberFormat = .init()) {
        self.init(str,
                  min:min, max:max, step:step,
                  possibleUnits: possibleUnits,
                  MeasureFormat(unitStyle: unitStyle, numberFormat))
    }
    
    /// inits with first match
    init?(_ str: Str,
          min: Double = 1,
          max: Double = 1000,
          step: Double = 1,
          
          possibleUnits: Set<MeasureUnit> = MeasureUnit.allForms,
          unitStyle: MeasUnitStyle = .medium,
          
          numFormat: NumFormat = .none,
          roundingMode: NumRoundingMode = .down,
          usesGroupingSeparator: Bool = false,
          minFractionDigits: Int = 0,
          maxFractionDigits: Int = 10,
          _ lid: LIDP = LID.englishUS) {
        fatalError()
    }
}
