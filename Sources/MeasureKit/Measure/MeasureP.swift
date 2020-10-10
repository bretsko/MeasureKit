

public protocol MeasureP: HasMutDoubleP {
        
    var measureUnit: MeasureUnit {get}
    
    //var munit: Dimension {get}
}


protocol MeasureT: MeasureP, HasAllFormsT, HasNumberFormatP, HasLID {
    
    // ? HasMeasureFormatP
    var format: MeasureFormat {get set}
}

extension MeasureT {
    
    // HasNumberFormatP
    public var numberFormat: NumberFormat {
        get {
            format.numberFormat
        }
        set {
            format.numberFormat = newValue
        }
    }
}
