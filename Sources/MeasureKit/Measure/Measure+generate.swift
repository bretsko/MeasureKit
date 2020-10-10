

public extension Measure {
        
    static func generate(min: Double = 1,
                         max: Double = 1000,
                         step: Double = 1,
                         
                         units: Set<MeasureUnit> = MeasureUnit.allForms,
                         _ formats: Set<MeasureFormat> = MeasureFormat.allForms)  -> Set<Self> {
        
        Double.gen(min: min, max: max, step: step)
            .map { value in
            
            units.map { unit in
                formats.map { format in
                    Self(unit, value, format)
                }
            }.flatMap{$0}
        }.flatMap{$0}.set
    }
    
    static func generate(min: Double = 1,
                         max: Double = 1000,
                         step: Double = 1,
                         units: Set<MeasureUnit> = MeasureUnit.allForms,
                         _ format: MeasureFormat) -> Set<Self> {
        generate(min: min,max: max,step: step,
                 units: units,
                 Set([format]))
    }
    
    static func generate(min: Double = 1,
                         max: Double = 1000,
                         step: Double = 1,
                         _ unit: MeasureUnit,
                         _ format: MeasureFormat) -> Set<Self> {
        generate(min: min,max: max,step: step,
                 units: Set([unit]),
                 Set([format]))
    }
    
    //TODO: conv ?
    //    static func generate(min: Double = 1,
    //                         max: Double = 1000,
    //                         step: Double = 1,
    //                         unitStyles: Set<MeasUnitStyle> = Set(),
    //                                 unitOptions: Set<MeasFormatterOptions> = Set(),
    //                                 _ locales: Set<LID> = Set()) -> Set<Self> {
    //
    //        let options: Set<MeasureFormat> = {
    //
    //            //TODO: if any is empty - will return nil
    //            unitStyles.map { unitStyle in
    //                unitOptions.map { unitOption in
    //                    locales.map { locale in
    //                        MeasureFormat(unitStyle: unitStyle,
    //                                         unitOptions: unitOption,
    //                                         locale)
    //                    }
    //                }.flatMap{$0}
    //            }.flatMap{$0}.set
    //        }
    //        return generate(min: min, max: max, step: step, options)
    //    }

}
