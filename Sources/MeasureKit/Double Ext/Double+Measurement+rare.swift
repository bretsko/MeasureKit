
//MARK: - rare


public typealias AreaM = Measurement<UnitArea>


// - UnitArea: [L^2]
public extension Double {
    
    var squareMegameters: AreaM {
        measure(.squareMegameters)
    }
    var squareKilometers: AreaM {
        measure(.squareKilometers)
    }
    var squareMeters: AreaM {
        measure(.squareMeters)
    }
    var squareCentimeters: AreaM {
        measure(.squareCentimeters)
    }
    var squareMillimeters: AreaM {
        measure(.squareMillimeters)
    }
    var squareMicrometers: AreaM {
        measure(.squareMicrometers)
    }
    var squareNanometers: AreaM {
        measure(.squareNanometers)
    }
    var squareInches: AreaM {
        measure(.squareInches)
    }
    var squareFeet: AreaM {
        measure(.squareFeet)
    }
    var squareYards: AreaM {
        measure(.squareYards)
    }
    var squareMiles: AreaM {
        measure(.squareMiles)
    }
    var acres: AreaM {
        measure(.acres)
    }
    var ares: AreaM {
        measure(.ares)
    }
    var hectares: AreaM {
        measure(.hectares)
    }
}


public typealias SpeedM = Measurement<UnitSpeed>

// - UnitSpeed: [L/T]
public extension Double {
    
    var metersPerSecond: SpeedM {
        measure(.metersPerSecond)
    }
    var kilometersPerHour: SpeedM {
        measure(.kilometersPerHour)
    }
    var milesPerHour: SpeedM {
        measure(.milesPerHour)
    }
    var knots: SpeedM {
        measure(.knots)
    }
}


public typealias EnergyM = Measurement<UnitEnergy>


// - UnitEnergy: [ML^2/T^2]
public extension Double {
    
    var kilojoules: EnergyM {
        measure(.kilojoules)
    }
    var joules: EnergyM {
        measure(.joules)
    }
    var kilocalories: EnergyM {
        measure(.kilocalories)
    }
    var calories: EnergyM {
        measure(.calories)
    }
    var kilowattHours: EnergyM {
        measure(.kilowattHours)
    }
}



public typealias FrequencyM = Measurement<UnitFrequency>

// - UnitFrequency: [/T]
public extension Double {
    
    var terahertz: FrequencyM {
        measure(.terahertz)
    }
    var gigahertz: FrequencyM {
        measure(.gigahertz)
    }
    var megahertz: FrequencyM {
        measure(.megahertz)
    }
    var kilohertz: FrequencyM {
        measure(.kilohertz)
    }
    var hertz: FrequencyM {
        measure(.hertz)
    }
    var millihertz: FrequencyM {
        measure(.millihertz)
    }
    var microhertz: FrequencyM {
        measure(.microhertz)
    }
    var nanohertz: FrequencyM {
        measure(.nanohertz)
    }
}

public typealias AccelerationM = Measurement<UnitAcceleration>

// - UnitAcceleration: [L/T^2]
public extension Double {
    
    var metersPerSecondSquared: AccelerationM {
        measure(.metersPerSecondSquared)
    }
    var gravity: AccelerationM {
        measure(.gravity)
    }
}


