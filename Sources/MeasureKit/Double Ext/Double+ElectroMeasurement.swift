

//public typealias UnitAngleM = Measurement<UnitAngle>


//MARK: - not used


public typealias PowerM = Measurement<UnitPower>

// - UnitPower: [ML^2/T^3]
public extension Double {
    
    var terawatts: PowerM {
        measure(.terawatts)
    }
    var gigawatts: PowerM {
        measure(.gigawatts)
    }
    var megawatts: PowerM {
        measure(.megawatts)
    }
    var kilowatts: PowerM {
        measure(.kilowatts)
    }
    var watts: PowerM {
        measure(.watts)
    }
    var milliwatts: PowerM {
        measure(.milliwatts)
    }
    var microwatts: PowerM {
        measure(.microwatts)
    }
    var nanowatts: PowerM {
        measure(.nanowatts)
    }
    var picowatts: PowerM {
        measure(.picowatts)
    }
    var femtowatts: PowerM {
        measure(.femtowatts)
    }
    var horsepower: PowerM {
        measure(.horsepower)
    }
}



//// - UnitElectricCurrent: [I]
//public extension Double {
//    
//    var megaamperes: Measurement<UnitElectricCurrent> {
//        Measurement(value: self, unit: .megaamperes)
//    }
//
//    var kiloamperes: Measurement<UnitElectricCurrent> {
//        Measurement(value: self, unit: .kiloamperes)
//    }
//
//    var amperes: Measurement<UnitElectricCurrent> {
//        Measurement(value: self, unit: .amperes)
//    }
//
//    var milliamperes: Measurement<UnitElectricCurrent> {
//        Measurement(value: self, unit: .milliamperes)
//    }
//
//    var microamperes: Measurement<UnitElectricCurrent> {
//        Measurement(value: self, unit: .microamperes)
//    }
//}


//// - UnitElectricCharge: [IT]
//public extension Double {
//
//    var coulombs: Measurement<UnitElectricCharge> {
//        Measurement(value: self, unit: .coulombs)
//    }
//
//    var megaampereHours: Measurement<UnitElectricCharge> {
//        Measurement(value: self, unit: .megaampereHours)
//    }
//
//    var kiloampereHours: Measurement<UnitElectricCharge> {
//        Measurement(value: self, unit: .kiloampereHours)
//    }
//
//    var ampereHours: Measurement<UnitElectricCharge> {
//        Measurement(value: self, unit: .ampereHours)
//    }
//
//    var milliampereHours: Measurement<UnitElectricCharge> {
//        Measurement(value: self, unit: .milliampereHours)
//    }
//
//    var microampereHours: Measurement<UnitElectricCharge> {
//        Measurement(value: self, unit: .microampereHours)
//    }
//}
// - UnitElectricResistance: [L^2M/T^3I^2]
//public extension Double {
//
//    var megaohms: Measurement<UnitElectricResistance> {
//        Measurement(value: self, unit: .megaohms)
//    }
//
//    var kiloohms: Measurement<UnitElectricResistance> {
//        Measurement(value: self, unit: .kiloohms)
//    }
//
//    var ohms: Measurement<UnitElectricResistance> {
//        Measurement(value: self, unit: .ohms)
//    }
//
//    var milliohms: Measurement<UnitElectricResistance> {
//        Measurement(value: self, unit: .milliohms)
//    }
//
//    var microohms: Measurement<UnitElectricResistance> {
//        Measurement(value: self, unit: .microohms)
//    }
//}
//
//// - UnitElectricPotentialDifference: [L^2M/T^3I]
//public extension Double {
//
//    var megavolts: Measurement<UnitElectricPotentialDifference> {
//        Measurement(value: self, unit: .megavolts)
//    }
//
//    var kilovolts: Measurement<UnitElectricPotentialDifference> {
//        Measurement(value: self, unit: .kilovolts)
//    }
//
//    var volts: Measurement<UnitElectricPotentialDifference> {
//        Measurement(value: self, unit: .volts)
//    }
//
//    var millivolts: Measurement<UnitElectricPotentialDifference> {
//        Measurement(value: self, unit: .millivolts)
//    }
//
//    var microvolts: Measurement<UnitElectricPotentialDifference> {
//        Measurement(value: self, unit: .microvolts)
//    }
//}

//// - UnitFuelEfficiency
//public extension Double {
//
//    var litersPer100Kilometers: Measurement<UnitFuelEfficiency> {
//        Measurement(value: self, unit: .litersPer100Kilometers)
//    }
//
//    var milesPerImperialGallon: Measurement<UnitFuelEfficiency> {
//        Measurement(value: self, unit: .milesPerImperialGallon)
//    }
//
//    var milesPerGallon: Measurement<UnitFuelEfficiency> {
//        Measurement(value: self, unit: .milesPerGallon)
//    }
//}
//
//// - UnitConcentrationMass: [M/L^3]
//public extension Double {
//
//    var gramsPerLiter: Measurement<UnitConcentrationMass> {
//        Measurement(value: self, unit: .gramsPerLiter)
//    }
//
//    var milligramsPerDeciliter: Measurement<UnitConcentrationMass> {
//        Measurement(value: self, unit: .milligramsPerDeciliter)
//    }
//
//}

//// - UnitDispersion: []
//public extension Double {
//
//    var partsPerMillion: Measurement<UnitDispersion> {
//        Measurement(value: self, unit: .partsPerMillion)
//    }
//}

// - UnitIlluminance: [J/L^2]
//public extension Double {
//
//    var lux: Measurement<UnitIlluminance> {
//        Measurement(value: self, unit: .lux)
//    }
//
//}
