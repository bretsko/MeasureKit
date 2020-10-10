



public typealias InfoStorageM = Measurement<UnitInfoStorage>


// - InfoStorageM: []
public extension Double {
    
    var bytes: InfoStorageM {
        measure(.bytes)
    }
    var bits: InfoStorageM {
        measure(.bits)
    }
    var exabytes: InfoStorageM {
        measure(.exabytes)
    }
    var terabytes: InfoStorageM {
        measure(.terabytes)
    }
    var gigabytes: InfoStorageM {
        measure(.gigabytes)
    }
    var megabytes: InfoStorageM {
        measure(.megabytes)
    }
    var kilobits: InfoStorageM {
        measure(.kilobits)
    }
    var megabits: InfoStorageM {
        measure(.megabits)
    }
    var gigabits: InfoStorageM {
        measure(.gigabits)
    }
    var terabits: InfoStorageM {
        measure(.terabits)
    }
    var kilobytes: InfoStorageM {
        measure(.kilobytes)
    }
}


public typealias AngleM = Measurement<UnitAngle>


// - UnitAngle: []
public extension Double {
    
    var degrees: AngleM {
        measure(.degrees)
    }
    var arcMinutes: AngleM {
        measure(.arcMinutes)
    }
    var arcSeconds: AngleM {
        measure(.arcSeconds)
    }
    var radians: AngleM {
        measure(.radians)
    }
    var gradians: AngleM {
        measure(.gradians)
    }
    var revolutions: AngleM {
        measure(.revolutions)
    }
}



public typealias TemperatureM = Measurement<UnitTemperature>

// - UnitTemperature: [Θ]
public extension Double {
    
    var kelvin: TemperatureM {
        measure(.kelvin)
    }
    var celsius: TemperatureM {
        measure(.celsius)
    }
    var fahrenheit: TemperatureM {
        measure(.fahrenheit)
    }
}

public typealias LengthM = Measurement<UnitLength>


// - UnitLength: [L]
public extension Double {
    
    var megameters: LengthM {
        measure(.megameters)
    }
    var kilometers: LengthM {
        measure(.kilometers)
    }
    var hectometers: LengthM {
        measure(.hectometers)
    }
    var decameters: LengthM {
        measure(.decameters)
    }
    var meters: LengthM {
        measure(.meters)
    }
    var decimeters: LengthM {
        measure(.decimeters)
    }
    var centimeters: LengthM {
        measure(.centimeters)
    }
    var millimeters: LengthM {
        measure(.millimeters)
    }
    var micrometers: LengthM {
        measure(.micrometers)
    }
    var nanometers: LengthM {
        measure(.nanometers)
    }
    var picometers: LengthM {
        measure(.picometers)
    }
    var inches: LengthM {
        measure(.inches)
    }
    var feet: LengthM {
        measure(.feet)
    }
    var yards: LengthM {
        measure(.yards)
    }
    var miles: LengthM {
        measure(.miles)
    }
    var scandinavianMiles: LengthM {
        measure(.scandinavianMiles)
    }
    var lightyears: LengthM {
        measure(.lightyears)
    }
    var nauticalMiles: LengthM {
        measure(.nauticalMiles)
    }
    var fathoms: LengthM {
        measure(.fathoms)
    }
    var furlongs: LengthM {
        measure(.furlongs)
    }
    var astronomicalUnits: LengthM {
        measure(.astronomicalUnits)
    }
    var parsecs: LengthM {
        measure(.parsecs)
    }
}


public typealias MassM = Measurement<UnitMass>


// - UnitMass: [M]
public extension Double {
    
    var kilograms: MassM {
        measure(.kilograms)
    }
    var grams: MassM {
        measure(.grams)
    }
    var decigrams: MassM {
        measure(.decigrams)
    }
    var centigrams: MassM {
        measure(.centigrams)
    }
    var milligrams: MassM {
        measure(.milligrams)
    }
    var micrograms: MassM {
        measure(.micrograms)
    }
    var nanograms: MassM {
        measure(.nanograms)
    }
    var picograms: MassM {
        measure(.picograms)
    }
    var ounces: MassM {
        measure(.ounces)
    }
    var pounds: MassM {
        measure(.pounds)
    }
    var stones: MassM {
        measure(.stones)
    }
    var metricTons: MassM {
        measure(.metricTons)
    }
    var shortTons: MassM {
        measure(.shortTons)
    }
    var carats: MassM {
        measure(.carats)
    }
    var ouncesTroy: MassM {
        measure(.ouncesTroy)
    }
    var slugs: MassM {
        measure(.slugs)
    }
}


public typealias DurationM = Measurement<UnitDuration>


// - UnitDuration: [T]
public extension Double {
    
    var seconds: DurationM {
        measure(.seconds)
    }
    var minutes: DurationM {
        measure(.minutes)
    }
    var hours: DurationM {
        measure(.hours)
    }
    var milliseconds: DurationM {
        measure(.milliseconds)
    }
    var microseconds: DurationM {
        measure(.microseconds)
    }
    var nanoseconds: DurationM {
        measure(.nanoseconds)
    }
    var picoseconds: DurationM {
        measure(.picoseconds)
    }
}



public typealias PressureM = Measurement<UnitPressure>


// - UnitPressure: [M/LT^2]
public extension Double {
    
    var newtonsPerMetersSquared: PressureM {
        measure(.newtonsPerMetersSquared)
    }
    var gigapascals: PressureM {
        measure(.gigapascals)
    }
    var megapascals: PressureM {
        measure(.megapascals)
    }
    var kilopascals: PressureM {
        measure(.kilopascals)
    }
    var hectopascals: PressureM {
        measure(.hectopascals)
    }
    var inchesOfMercury: PressureM {
        measure(.inchesOfMercury)
    }
    var bars: PressureM {
        measure(.bars)
    }
    var millibars: PressureM {
        measure(.millibars)
    }
    var millimetersOfMercury: PressureM {
        measure(.millimetersOfMercury)
    }
    var poundsForcePerSquareInch: PressureM {
        measure(.poundsForcePerSquareInch)
    }
}


public typealias VolumeM = Measurement<UnitVolume>


// - UnitVolume: [L^3]
public extension Double {
    
    var megaliters: VolumeM {
        measure(.megaliters)
    }
    var kiloliters: VolumeM {
        measure(.kiloliters)
    }
    var liters: VolumeM {
        measure(.liters)
    }
    var deciliters: VolumeM {
        measure(.deciliters)
    }
    var centiliters: VolumeM {
        measure(.centiliters)
    }
    var milliliters: VolumeM {
        measure(.milliliters)
    }
    var cubicKilometers: VolumeM {
        measure(.cubicKilometers)
    }
    var cubicMeters: VolumeM {
        measure(.cubicMeters)
    }
    var cubicDecimeters: VolumeM {
        measure(.cubicDecimeters)
    }
    var cubicCentimeters: VolumeM {
        measure(.cubicCentimeters)
    }
    var cubicMillimeters: VolumeM {
        measure(.cubicMillimeters)
    }
    var cubicInches: VolumeM {
        measure(.cubicInches)
    }
    var cubicFeet: VolumeM {
        measure(.cubicFeet)
    }
    var cubicYards: VolumeM {
        measure(.cubicYards)
    }
    var cubicMiles: VolumeM {
        measure(.cubicMiles)
    }
    var acreFeet: VolumeM {
        measure(.acreFeet)
    }
    var bushels: VolumeM {
        measure(.bushels)
    }
    var teaspoons: VolumeM {
        measure(.teaspoons)
    }
    var tablespoons: VolumeM {
        measure(.tablespoons)
    }
    var fluidOunces: VolumeM {
        measure(.fluidOunces)
    }
    var cups: VolumeM {
        measure(.cups)
    }
    var pints: VolumeM {
        measure(.pints)
    }
    var quarts: VolumeM {
        measure(.quarts)
    }
    var gallons: VolumeM {
        measure(.gallons)
    }
    var imperialTeaspoons: VolumeM {
        measure(.imperialTeaspoons)
    }
    var imperialTablespoons: VolumeM {
        measure(.imperialTablespoons)
    }
    var imperialFluidOunces: VolumeM {
        measure(.imperialFluidOunces)
    }
    var imperialPints: VolumeM {
        measure(.imperialPints)
    }
    var imperialQuarts: VolumeM {
        measure(.imperialQuarts)
    }
    var imperialGallons: VolumeM {
        measure(.imperialGallons)
    }
    var metricCups: VolumeM {
        measure(.metricCups)
    }
}

extension Double {
    
    func measure<UnitType : Unit>(_ unit: UnitType) -> Measurement<UnitType> {
        return .init(self, unit)
    }
    
    func measure(_ unit: MeasureUnit,
                 _ format: MeasureFormat = MeasureFormat()) -> Measure {
        return .init(unit, self, format)
    }
}

