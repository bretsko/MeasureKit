



//TODO: consider making generic with
//public struct MeasureG<UnitType: Dimension> { // Hashable, StrEnumT
//typealias MType = Measurement<UnitType> <-> MeasureG<UnitType>
public struct Measure: MeasureT {
    
    public var value: Double
    
    public var unit: MeasureUnit
    
    /// used only to store result, not as parameter for string interpretation 
    public var format: MeasureFormat
}

public extension Measure {
    
    init(_ unit: MeasureUnit,
         _ value: Double,
         _ format: MeasureFormat) {
        self.unit = unit
        self.value = value
        self.format = format
    }
 
    // formatting options are stored to allow interpreting Strings and store inter results for diff locales, styles
    var unitStyle: MeasUnitStyle {
        get {
            format.unitStyle
        }
        set {
            format.unitStyle = newValue
        }
    }
    
    // consider impl operators 
    //    /// Add two measurements of the same Dimension.
    //    ///
    //    /// If the `unit` of the `lhs` and `rhs` are `isEqual`, then this returns the result of adding the `value` of each `Measurement`. If they are not equal, then this will convert both to the base unit of the `Dimension` and return the result as a `Measurement` of that base unit.
    //    /// - returns: The result of adding the two measurements.
    //    public static func + (lhs: Measurement<UnitType>, rhs: Measurement<UnitType>) -> Measurement<UnitType>
    //
    //    /// Subtract two measurements of the same Dimension.
    //    ///
    //    /// If the `unit` of the `lhs` and `rhs` are `==`, then this returns the result of subtracting the `value` of each `Measurement`. If they are not equal, then this will convert both to the base unit of the `Dimension` and return the result as a `Measurement` of that base unit.
    //    /// - returns: The result of adding the two measurements.
    //    public static func - (lhs: Measurement<UnitType>, rhs: Measurement<UnitType>) -> Measurement<UnitType>
    
    var measureUnit: MeasureUnit {
        unit
    }

    /// Returns a set of Doubles in the range from 1 to 1 thousand, 0 is not included, not all possible measures !
    static var allForms: Set<Self> {
        generate()
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.unit == rhs.unit && lhs.value == rhs.value
    }
}
