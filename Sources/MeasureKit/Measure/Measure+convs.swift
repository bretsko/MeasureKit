



public extension Measure {
    
    /// uses currently set formatting options
    /// Returns nil for locales which cannot be handled (only for NumFormat.spellout)
    /// Failing locales: zh-Hant_HK zh-Hant zh_MO ko_KR zh_CN zh-Hans_CN wuu to_TO zh zh-Hant_MO zh-Hans_SG zh_SG zh_HK zh_TW zh-Hans_HK ja_JP zh_Hant_TW to zh-Hans_MO ko zh-Hant_CN ko_KP ja zh-Hans
    var str: Str? {
        string(format) 
    }
    
    /// - parameter unitStyle: There are 3 widths: long, medium, and short. For example, for English, when formatting "3 pounds" Long is "3 pounds"; medium is "3 lb"; short is "3#"
    /// Returns nil for locales which cannot be handled (only for NumFormat.spellout)
    /// Failing locales: zh-Hant_HK zh-Hant zh_MO ko_KR zh_CN zh-Hans_CN wuu to_TO zh zh-Hant_MO zh-Hans_SG zh_SG zh_HK zh_TW zh-Hans_HK ja_JP zh_Hant_TW to zh-Hans_MO ko zh-Hant_CN ko_KP ja zh-Hans
    func string(unitStyle: MeasUnitStyle = .medium,
                numFormat: NumFormat = .decimal,
                _ locale: LIDP = LID.english) -> Str? {
        MeasureFormatter.shared(unitStyle: unitStyle,
                                numFormat: numFormat,
                                locale).str(from: self)
    }
    
    /// Returns nil for locales which cannot be handled (only for NumFormat.spellout)
    /// Failing locales: zh-Hant_HK zh-Hant zh_MO ko_KR zh_CN zh-Hans_CN wuu to_TO zh zh-Hant_MO zh-Hans_SG zh_SG zh_HK zh_TW zh-Hans_HK ja_JP zh_Hant_TW to zh-Hans_MO ko zh-Hant_CN ko_KP ja zh-Hans
    func string(_ format: MeasureFormat) -> Str? {
        MeasureFormatter.shared(unitStyle: format.unitStyle,
                                numFormat: format.numFormat,
                                format.lid).str(from: self)
    }
    
    
    //MARK: - Conversion
    
    /// Returns a new measurement created by converting to the specified unit.
    /// Crashes if unsupported units are tried
    func converted(to otherUnit: MeasureUnit) -> Measure {
        switch unit {
        case .angle(let a):
            let m1 = a.measurement(value)
            let m2 = m1.converted(to: otherUnit.angle!.unit)
            return .init(m2.measureUnit, m2.value)
        case .infoStorage(let a):
            let m1 = a.measurement(value)
            let m2 = m1.converted(to: otherUnit.infoStorage!.unit)
            return .init(m2.measureUnit, m2.value)
        case .length(let a):
            let m1 = a.measurement(value)
            let m2 = m1.converted(to: otherUnit.length!.unit)
            return .init(m2.measureUnit, m2.value)
        case .mass(let a):
            let m1 = a.measurement(value)
            let m2 = m1.converted(to: otherUnit.mass!.unit)
            return .init(m2.measureUnit, m2.value)
        case .volume(let a):
            let m1 = a.measurement(value)
            let m2 = m1.converted(to: otherUnit.volume!.unit)
            return .init(m2.measureUnit, m2.value)
        case .duration(let a):
            let m1 = a.measurement(value)
            let m2 = m1.converted(to: otherUnit.duration!.unit)
            return .init(m2.measureUnit, m2.value)
        case .temperature(let a):
            let m1 = a.measurement(value)
            let m2 = m1.converted(to: otherUnit.temperature!.unit)
            return .init(m2.measureUnit, m2.value)
        }
    }
    
    /// Converts the measurement to the specified unit.
    /// Crashes if unsupported units are tried
    mutating func convert(to otherUnit: MeasureUnit) {
        self = converted(to: otherUnit)
    }
    
    
    //MARK: -
    
    mutating func convert(to otherUnit: AngleMUnit) {
        convert(to: .angle(otherUnit))
    }
    mutating func convert(to otherUnit: InfoStorageMUnit) {
        convert(to: .infoStorage(otherUnit))
    }
    mutating func convert(to otherUnit: LengthMUnit) {
        convert(to: .length(otherUnit))
    }
    mutating func convert(to otherUnit: VolumeMUnit) {
        convert(to: .volume(otherUnit))
    }
    mutating func convert(to otherUnit: MassMUnit) {
        convert(to: .mass(otherUnit))
    }
    
    
    func converted(to otherUnit: AngleMUnit) -> Measure {
        converted(to: .angle(otherUnit))
    }
    func converted(to otherUnit: InfoStorageMUnit) -> Measure {
        converted(to: .infoStorage(otherUnit))
    }
    func converted(to otherUnit: LengthMUnit) -> Measure {
        converted(to: .length(otherUnit))
    }
    func converted(to otherUnit: VolumeMUnit) -> Measure {
        converted(to: .volume(otherUnit))
    }
    func converted(to otherUnit: MassMUnit) -> Measure {
        converted(to: .mass(otherUnit))
    }
}
