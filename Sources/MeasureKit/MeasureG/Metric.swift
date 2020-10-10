

/// can express measures of any magnitude - megabytes, kilograms, etc
public struct Metric: Hashable {
    
    public var value: Double
    
    public var unit: Magnitude
}
public extension Metric {
    
    init(_ value: Double, _ unit: Magnitude) {
        self.value = value
        self.unit = unit
    }
}

public extension Double {
    
    var nano: Metric {
        Metric(self, .nano)
    }
    
    var micro: Metric {
        Metric(self, .micro)
    }
    
    var milli: Metric {
        Metric(self, .milli)
    }
    
    var centi: Metric {
        Metric(self, .centi)
    }
    
    var deci: Metric {
        Metric(self, .deci)
    }
    
    var base: Metric {
        Metric(self, .base)
    }
    
    var deka: Metric {
        Metric(self, .deka)
    }
    
    var hecto: Metric {
        Metric(self, .hecto)
    }
    
    var kilo: Metric {
        Metric(self, .kilo)
    }
    
    var mega: Metric {
        Metric(self, .mega)
    }
    
    var giga: Metric {
        Metric(self, .giga)
    }
    
    var tera: Metric {
        Metric(self, .tera)
    }
    
    var peta: Metric {
        Metric(self, .peta)
    }
}


