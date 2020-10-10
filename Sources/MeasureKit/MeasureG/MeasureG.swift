//
//
//
//
//
//
//
//
//public struct MeasureG<MeasureType: MeasureT>: HasAllFormsT {
//
//    public var value: Double
//
//    //TODO: this type must not have any prefixes, think how to impl !
//    public var unit: MeasureUnitType
//
//    //TODO: func to get diff values by changing magnitude
//    public var magnitude: DecimalMagnitude
//
//    public var format: MeasureFormat
//}
//public extension MeasureG {
//
//    init(_ unit: MeasureUnit,
//         _ value: Double,
//         unitStyle: MeasUnitStyle = .medium,
//         _ locale: LID = .english) {
//
//        self.unit = unit
//        self.value = value
//        self.format = .init(unitStyle: unitStyle,
//                                   locale:locale)
//    }
//
//    /// can init with any Measurement
//    init(_ obj: MeasureP,
//         unitStyle: MeasUnitStyle = .medium,
//         _ locale: LID = .english) {
//        self.init(obj.measureUnit, obj.value,
//                  unitStyle: unitStyle,
//                  locale)
//    }
//
//    /// if the Str represents any measure in given range, locale(s), etc - it is returned
//    init?(_ str: Str,
//          min: Double = 1,
//          max: Double = 1000,
//          step: Double = 1,
//          unitStyle: MeasUnitStyle = .medium,
//          _ locale: LID = .english) {
//        let options = MeasureFormat(unitStyle: unitStyle, locale)
//
//        if let a = Self.generate(min:min, max:max,
//                                 step:step,options).first(where: {
//                                    $0.str == str
//                                 }) {
//            self = a
//        } else {
//            return nil
//        }
//    }
//
//    //MARK: - generate
//
//    /// - parameter unitStyle: There are 3 widths: long, medium, and short. For example, for English, when formatting "3 pounds" Long is "3 pounds"; medium is "3 lb"; short is "3#"
//    /// - parameter unitOptions: If not specified, unitOptions defaults to localizing according to the preferences of the locale.
//    ///
//    /// By default, if unitOptions is set to the empty set, the formatter will do the following:
//    /// - kilocalories may be formatted as "C" instead of "kcal" depending on the locale.
//    /// - kilometersPerHour may be formatted as "miles per hour" for US and UK locales but "kilometers per hour" for other locales.
//    ///
//    /// However, if providedUnit is set, the formatter will do the following:
//    /// - kilocalories would be formatted as "kcal" in the language of the locale, even if the locale prefers "C".
//    /// - kilometersPerHour would be formatted as "kilometers per hour" for US and UK locales even though the preference is for "miles per hour."
//    ///
//    /// Note that formatter will handle converting measurement objects to the preferred units in a particular locale.  For instance, if provided a measurement object in kilometers and the set locale is en_US, the formatter will implicitly convert the measurement object to miles and return the formatted string as the equivalent measurement in miles.
//    static func generate(min: Double = 1,
//                         max: Double = 1000,
//                         step: Double = 1,
//                         _ formOptionSet: Set<MeasureFormat> = Set())  -> Set<Self> {
//
//        //                         unitStyles: Set<MeasUnitStyle> = Set(),
//        //                         unitOptions: Set<MeasFormatterOptions> = Set(),
//        //                         numStyles: Set<NumFormat> = Set(),
//        //                         _ locales: Set<LID> = Set())
//
//        Double.generate(min: min, max: max, step: step).map { value in
//            MeasureUnit.allForms.map { unit in
//
//                //TODO: try all, not first, handle empty set, now will crash
//
//                formOptionSet.map { formOption in
//                    let unitStyle = formOption.unitStyle
//                    let locale = formOption.locale
//
//                    return Self(unit, value,
//                                unitStyle: unitStyle,
//                                locale)
//                }
//            }.flatMap{$0}
//        }.flatMap{$0}.set
//    }
//
//    static func generate(min: Double = 1,
//                         max: Double = 1000,
//                         step: Double = 1,
//                         _ formOptions: MeasureFormat) -> Set<Self> {
//        generate(min:min, max:max, step:step, Set([formOptions]))
//    }
//
//    //TODO: conv ?
//    //    static func generate(min: Double = 1,
//    //                         max: Double = 1000,
//    //                         step: Double = 1,
//    //                         unitStyles: Set<MeasUnitStyle> = Set(),
//    //                                 unitOptions: Set<MeasFormatterOptions> = Set(),
//    //                                 _ locales: Set<LID> = Set()) -> Set<Self> {
//    //
//    //        let options: Set<MeasureFormat> = {
//    //
//    //            //TODO: if any is empty - will return nil
//    //            unitStyles.map { unitStyle in
//    //                unitOptions.map { unitOption in
//    //                    locales.map { locale in
//    //                        MeasureFormat(unitStyle: unitStyle,
//    //                                         unitOptions: unitOption,
//    //                                         locale)
//    //                    }
//    //                }.flatMap{$0}
//    //            }.flatMap{$0}.set
//    //        }
//    //        return generate(min: min, max: max, step: step, options)
//    //    }
//
//    /// Returns a set of Doubles in the range from 1 to 1 thousand, 0 is not included, not all possible measures !
//    static var allForms: Set<Self> {
//        generate()
//    }
//
//    //MARK: - Str
//
//    /// uses currently set formatting options
//    var str: Str {
//        switch unit {
//        case .duration(let a):
//            let m = a.measurement(value:value)
//            return m.string(unitStyle: unitStyle,
//                            locale)
//        case .angle(let a):
//            let m = a.measurement(value:value)
//            return m.string(unitStyle: unitStyle,
//                            locale)
//        case .length(let a):
//            let m = a.measurement(value:value)
//            return m.string(unitStyle: unitStyle,
//                            locale)
//        case .volume(let a):
//            let m = a.measurement(value:value)
//            return m.string(unitStyle: unitStyle,
//                            locale)
//        case .mass(let a):
//            let m = a.measurement(value:value)
//            return m.string(unitStyle: unitStyle,
//                            locale)
//        }
//    }
//
//    var dim: Dimension {
//        unit.unit
//    }
//
//
//    // formatting options are stored to allow interpreting Strings and store inter results for diff locales, styles
//    var unitStyle: MeasUnitStyle {
//        get {
//            format.unitStyle
//        }
//        set {
//            format.unitStyle = newValue
//        }
//    }
//    var locale: LID {
//        get {
//            format.locale
//        }
//        set {
//            format.locale = newValue
//        }
//    }
//
//    //MARK: - Conversion
//
//    /// Returns a new measurement created by converting to the specified unit.
//    /// Crashes if unsupported units are tried
//    func converted(to otherUnit: MeasureUnit) -> Measure {
//        switch unit {
//        case .angle(let a):
//            let m1 = a.measurement(value: value)
//            let m2 = m1.converted(to: otherUnit.angle!.unit)
//            return .init(m2.measureUnit, m2.value)
//        case .duration(let a):
//            let m1 = a.measurement(value: value)
//            let m2 = m1.converted(to: otherUnit.duration!.unit)
//            return .init(m2.measureUnit, m2.value)
//        case .length(let a):
//            let m1 = a.measurement(value: value)
//            let m2 = m1.converted(to: otherUnit.length!.unit)
//            return .init(m2.measureUnit, m2.value)
//        case .mass(let a):
//            let m1 = a.measurement(value: value)
//            let m2 = m1.converted(to: otherUnit.mass!.unit)
//            return .init(m2.measureUnit, m2.value)
//        case .volume(let a):
//            let m1 = a.measurement(value: value)
//            let m2 = m1.converted(to: otherUnit.volume!.unit)
//            return .init(m2.measureUnit, m2.value)
//        }
//    }
//
//    /// Converts the measurement to the specified unit.
//    /// Crashes if unsupported units are tried
//    mutating func convert(to otherUnit: MeasureUnit) {
//        self = converted(to: otherUnit)
//    }
//
//
//
//    //MARK: -
//
//    mutating func convert(to otherUnit: AngleMUnit) {
//        convert(to: .angle(otherUnit))
//    }
//    mutating func convert(to otherUnit: DurationMUnit) {
//        convert(to: .duration(otherUnit))
//    }
//    mutating func convert(to otherUnit: LengthMUnit) {
//        convert(to: .length(otherUnit))
//    }
//    mutating func convert(to otherUnit: VolumeMUnit) {
//        convert(to: .volume(otherUnit))
//    }
//    mutating func convert(to otherUnit: MassMUnit) {
//        convert(to: .mass(otherUnit))
//    }
//
//
//    func converted(to otherUnit: AngleMUnit) -> Measure {
//        converted(to: .angle(otherUnit))
//    }
//    func converted(to otherUnit: DurationMUnit) -> Measure {
//        converted(to: .duration(otherUnit))
//    }
//    func converted(to otherUnit: LengthMUnit) -> Measure {
//        converted(to: .length(otherUnit))
//    }
//    func converted(to otherUnit: VolumeMUnit) -> Measure {
//        converted(to: .volume(otherUnit))
//    }
//    func converted(to otherUnit: MassMUnit) -> Measure {
//        converted(to: .mass(otherUnit))
//    }
//
//
//
//    //    /// Add two measurements of the same Dimension.
//    //    ///
//    //    /// If the `unit` of the `lhs` and `rhs` are `isEqual`, then this returns the result of adding the `value` of each `Measurement`. If they are not equal, then this will convert both to the base unit of the `Dimension` and return the result as a `Measurement` of that base unit.
//    //    /// - returns: The result of adding the two measurements.
//    //    public static func + (lhs: Measurement<UnitType>, rhs: Measurement<UnitType>) -> Measurement<UnitType>
//    //
//    //    /// Subtract two measurements of the same Dimension.
//    //    ///
//    //    /// If the `unit` of the `lhs` and `rhs` are `==`, then this returns the result of subtracting the `value` of each `Measurement`. If they are not equal, then this will convert both to the base unit of the `Dimension` and return the result as a `Measurement` of that base unit.
//    //    /// - returns: The result of adding the two measurements.
//    //    public static func - (lhs: Measurement<UnitType>, rhs: Measurement<UnitType>) -> Measurement<UnitType>
//
//    static func == (lhs: Self, rhs: Self) -> Bool {
//        lhs.unit == rhs.unit &&  lhs.value == rhs.value
//    }
//}
