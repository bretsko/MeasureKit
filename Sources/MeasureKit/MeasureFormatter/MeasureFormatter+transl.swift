

public extension MeasureFormatter {
    
    
    /// Some cases cannot be handled currently, returns nil for those (only number, spellOut format, a few locales (Chinese, etc)
    /// Failing locales: zh-Hant_HK zh-Hant zh_MO ko_KR zh_CN zh-Hans_CN wuu to_TO zh zh-Hant_MO zh-Hans_SG zh_SG zh_HK zh_TW zh-Hans_HK ja_JP zh_Hant_TW to zh-Hans_MO ko zh-Hant_CN ko_KP ja zh-Hans
    func str<UnitType: Unit>(from meas: Measurement<UnitType>,
                             _ format: MeasureFormat) -> Str? {
        
        //TODO: consider making static list of unsupported Locales
        // MeasurementFormatter cannot handle spellOut of numbers
        if numFormat == .spellOut {
            return str(from: Measure(meas, format))
        }
        //none (1235), decimal (1,234.568), ordinal (3rd), scientific (1.2345678E3)
        return measFmtr.str(from: meas)
    }
    
    /// Some cases cannot be handled currently, returns nil for those (only number, spellOut format, a few locales (Chinese, etc)
    /// Failing locales: zh-Hant_HK zh-Hant zh_MO ko_KR zh_CN zh-Hans_CN wuu to_TO zh zh-Hant_MO zh-Hans_SG zh_SG zh_HK zh_TW zh-Hans_HK ja_JP zh_Hant_TW to zh-Hans_MO ko zh-Hant_CN ko_KP ja zh-Hans
    func str(from measure: Measure) -> Str? {
        
        self.format = measure.format
        
        let value = measure.value
        let unit = measure.unit
        
        // my Str enums support only English, so cannot be used
        let str: Str
        switch unit {
        case .angle(let a):
            let m = a.measurement(value)
            str = measFmtr.str(from: m)
        case .infoStorage(let a):
            let m = a.measurement(value)
            str = measFmtr.str(from: m)
        case .length(let a):
            let m = a.measurement(value)
            str = measFmtr.str(from: m)
        case .volume(let a):
            let m = a.measurement(value)
            str = measFmtr.str(from: m)
        case .mass(let a):
            let m = a.measurement(value)
            str = measFmtr.str(from: m)
        case .duration(let a):
            let m = a.measurement(value)
            str = measFmtr.str(from: m)
        case .temperature(let a):
            let m = a.measurement(value)
            str = measFmtr.str(from: m)
        }
        
        // stupid, not used mostly,
        //TODO: ideally separate Measure models into those which can use it and not !
        /// and make Measure enum, and use generic MeasureG<MeasureUnit> ?
        if measure.unitStyle == .short {
            return str
        }
        
        switch measure.numFormat {
        case .spellOut:
            
            //TODO: more ways to find words, for ex 2 spaces, newLine, etc
            // ideally use some smart func
            
            // case 1: "5.432 kilograms"
            // case 2: chinese, as single word,
            //TODO: try parse to get number, use lang direction logic
            //in right to left languages - its vice versa, also in Sri Lanka, etc
            // numbers can be different! not only 0-9, check Bengali numbers, arabic, etc
            // Currently faling cases
            // in LangLID - zh, zh-Hant, zh-Hans, ko, ja, wuu
            // in CountryLID - zh-Hans_MO ko_KP zh_SG zh_TW zh_HK zh_CN zh_TW zh_SG ko_KR zh_CN zh_MO ja_JP zh_MO zh-Hans_HK zh-Hant_CN to_TO zh_HK
            guard let words = str.words,
                  words.len > 1 else {
                return nil
            }
            
            let numFmtr = NumberFormatter.shared(numStyle: .none,
                                                 measure.lid)
            
            let num: Double
            let unitStr: Str
            if let a = numFmtr.number(from: words[0])?.doubleValue {
                num = a
                unitStr = words[1]
                
            } else if let a = numFmtr.number(from: words[1])?.doubleValue {
                num = a
                unitStr = words[0]
                
            } else {
                return nil
            }
            
            /// measure.numFormat is impl-d using my own numFormater (see below)
            // currently MeasureFormatter doesnt support .spellOut
            // so I  have to impl in my own way
            // using also my own NumberFromatter, because when numberStyle is set in it, it's nullified
            let numStr = numFmtr.str(from: num)
            
            return numStr + " " + unitStr
        default:
            return str
        }
    }
    
    //MARK: - unit
    
    static func str(from unit: MeasureUnit,
                    _ format: MeasureUnitFormat) -> Str {
        let fmtr = shared()
        fmtr.lid = format.lid
        fmtr.unitStyle = format.unitStyle
        return fmtr.measFmtr.str(from: unit.dim)
    }
    
    static func str(from unit: MeasureUnit,
                    _ unitStyle: MeasUnitStyle = .medium,
                    _ lid: LIDP = LID.english) -> Str {
        str(from: unit,
            MeasureUnitFormat(unitStyle:unitStyle, lid))
    }
    
    //TODO: consider making this func
    //    private func spellOutMeasure(with value: Double,
    //                                 unit: MeasureUnit,
    //                                 unitStyle: MeasUnitStyle,
    //                                 locale: LID) -> Str {
    
    //        // currently MeasureFormatter doesnt support .spellOut
    //        // so I  have to impl in my own way
    //        // using also my own NumberFromatter, because when numberStyle is set in it, it's nullified
    //        numFormatter.numberStyle = .spellOut
    //        let numStr = numFormatter.str(from: NSNumber(value: value))!
    //
    //
    //        let numStr = numFormatter.str(from: NSNumber(value: value))!
    //
    //        self.locale = locale.locale
    //        numFormatter.locale = locale.locale
    //
    //        //try support diff languages
    //
    //        let unitStr: Str
    //        if locale != .english {
    //
    //            // my Str enums support only English, but this func returns stupid single form
    //            // for ex Russian always returns килограммы, which cannot be used at all
    //            // два килограммы
    //            // один килограммы
    //            //unitStr = str(from: unit.dim)
    //            // -> so the only way is replacing number !
    //        } else {
    //
    //            if value == 1 {
    //                //
    //                unitStr = unit.single
    //            } else {
    //                unitStr = unit.str
    //            }
    //        }
    //
    //        return numStr + " " + unitStr
    //    }
}
