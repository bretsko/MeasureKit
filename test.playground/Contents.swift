import MinimalBase
import MeasureKit

let km = 5.5.kilometers
print(km.string(unitStyle: .long))
print(km.string(unitStyle: .medium))
print(km.string(unitStyle: .short))

print(km.string(unitStyle: .long, locale: LocaleID.ukrainian.locale))

//TODO: try change NumberFormatter style
//print(km.string(unitStyle: .long, locale: LocaleID.ukrainian.locale))



//let formatter = MeasurementFormatter()
//let str = formatter.string(from: Measurement<UnitDuration>(value: 10, unit: .seconds).converted(to: .milliseconds))
//print(str)
//
//
//func distance(_ distance: Double) -> String {
//    let distanceMeasurement = Measurement(value: distance, unit: UnitLength.meters)
//    return FormatDisplay.distance(distanceMeasurement)
//}
//
//func distance(_ distance: Measurement<UnitLength>) -> String {
//    let formatter = MeasurementFormatter()
//    formatter.numberFormatter.maximumFractionDigits = 2
//    return formatter.string(from: distance)
//}
//
//func time(_ seconds: Int) -> String {
//    let formatter = DateComponentsFormatter()
//    formatter.allowedUnits = [.hour, .minute, .second]
//    formatter.unitsStyle = .positional
//    formatter.zeroFormattingBehavior = .pad
//    return formatter.string(from: TimeInterval(seconds))!
//}
//
//func pace(distance: Measurement<UnitLength>, seconds: Int, outputUnit: UnitSpeed) -> String {
//    let formatter = MeasurementFormatter()
//    formatter.numberFormatter.maximumFractionDigits = 2
//
//    formatter.unitOptions = [.providedUnit] // 1
//    let speedMagnitude = seconds != 0 ? distance.value / Double(seconds) : 0
//    let speed = Measurement(value: speedMagnitude, unit: UnitSpeed.metersPerSecond)
//
//    return formatter.string(from: speed.converted(to: outputUnit))
//}

