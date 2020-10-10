
import XCTest
import Quick
import Nimble
import MeasureKit


class MeasureSpec: QuickSpec {
    override func spec() {
        
        describe("Measure") {
            
            it("can print mass in 3 styles") {
                
                print("------------ kilograms ")
                
                let format = MeasureFormat(unitStyle: .long,
                                           numFormat: .spellOut,
                                           LangLID.english)
                let measure = 1.pounds.measure(format)
                
                // let fmtr = MeasurementFormatter.shared(unitStyle: .long,
                // numStyle: numStyle, .english)
                // let str = fmtr.string(from: m)
                
                print("Result: \(measure.str)") // short:  5kg - ??
                
//                measure.unitStyle = .medium
//                print("Medium: \(measure.str)") // medium:  5 kg
//                
//                measure.unitStyle = .long
//                print("Long: \(measure.str)") // long:  5 kilograms
            }
            
            
            it("can transl and inter Measures and Measurements in spellOut style, diff languages") {
                
                // make test to detect which cases it cannot handle
                
                //TODO: make tests to detect if CountryLIDs contain any new values in addition to LangLIDs !
                
                let m = 5.hours
                
                
                print("---- Failed LangLID cases -----")
                
                let langLIDFormats: Set<MeasureFormat> = LangLID.allForms.lids.map {
                    MeasureFormat(unitStyle: .long ,
                                  numFormat: .spellOut, $0)
                }.set
                let langLIDCases: Set<Str> = langLIDFormats.map {
                    let meas = m.measure($0)
                    if let str = meas.str {
                        return str
                    } else {
                        print(meas.locale)
                        return nil
                    }
                }.compactMap{$0}.set
                //ko (fixed)
                //zh-Hant (fixed)
                //to (fixed)
                //ja (fixed)
                //zh-Hans (fixed)
                //zh (fixed)
                //wuu (fixed)
                
                print("---- Failed CountryLID cases -----")
                
                let countryLIDFormats: Set<MeasureFormat> = CountryLID.allForms.lids.map {
                    MeasureFormat(unitStyle: .long ,
                                  numFormat: .spellOut, $0)
                }.set
                let countryLIDCases: Set<Str> = countryLIDFormats.map {
                    let meas = m.measure($0)
                    if let str = meas.str {
                        return str
                    } else {
                        print(meas.locale)
                        return nil
                    }
                }.compactMap{$0}.set
                //zh-Hans_MO (fixed)
                //ko_KP (fixed)
                //zh_SG (fixed)
                //zh_TW (fixed)
                //zh_HK (fixed)
                //zh_CN (fixed)
                //zh_TW (fixed)
                //zh_SG (fixed)
                //ko_KR (fixed)
                //zh_CN (fixed)
                //zh_MO (fixed)
                //ja_JP (fixed)
                //zh_MO (fixed)
                //zh-Hans_HK (fixed)
                //zh-Hant_CN (fixed)
                //to_TO (fixed)
                //zh_HK (fixed)
                
                
                //                let diff1 = langLIDCases.subtracting(countryLIDCases)
                //                expect(diff1.isEmpty).to(beTrue())
                //                print(diff1.array.joined)
                //
                //                let diff2 = countryLIDCases.subtracting(langLIDCases)
                //                expect(diff2.isEmpty).to(beTrue())
                //                print(diff2.array.joined)
            }
            
            
            it("can inter Measures and Measurements in spellOut style, diff languages") {
                
                let str1 = "один килограмм"
                let str2 = "два килограмма"
                
                let munit = MeasureUnit.mass(.kilograms)
                
                let format = MeasureFormat(unitStyle: .long ,
                                           numFormat: .spellOut, LangLID.russian)
                
                //let str = munit.allStrs(format.unitFormat)
                //print(str)
                
                //                Measure.generate(min: 1, max: 2,
                //                                 step: 1,  munit,
                //                                 format).forEach {
                //                                    print($0.str)
                //                                 }
                
                var measure1 = Measure(munit, 1, format)
                var measure2 = Measure(munit, 2, format)
                
                expect(measure1.str).to(equal(str1))
                expect(measure2.str).to(equal(str2))
                
                measure1 = Measure(str1,
                                   min: 1, max: 2, step: 1,
                                   possibleUnits:Set([munit]),
                                   format)!
                //
                measure2 = Measure(str2,
                                   min: 1, max: 2, step: 1,
                                   possibleUnits:Set([munit]), format)!
                
                // expect(measure1.str).to(equal(str1))
                // expect(measure2.str).to(equal(str2))
            }
            
            
            //            it("can print volume in 3 styles") {
            //
            //                print("------------ liters ")
            //
            //                var liters = Measure(5.1.micrometers,
            //                                     unitStyle: .short,
            //                                     .english)
            //
            //                print("Short: \(liters.str)") // short:  5L - ??
            //
            //                liters.unitStyle = .medium
            //                print("Medium: \(liters.str)") // medium:  5 L
            //
            //                liters.unitStyle = .long
            //                print("Long: \(liters.str)") // long:  5 liters
            //
            //            }
            
            //TODO: bc func are repeating, consider making some generic func, later will add even more !
            //            it("can print degrees in 3 styles") {
            //
            //                print("------------ Minutes ")
            //
            //                var degrees = Measure(5.0.degrees,
            //                                      unitStyle: .short,
            //                                      .english)
            //
            //                print("Short: \(degrees.str)") // short:  5° - ok
            //
            //                degrees.unitStyle = .medium
            //                print("Medium: \(degrees.str)") // medium:  5 deg
            //
            //                degrees.unitStyle = .long
            //                print("Long: \(degrees.str)") // long:  5 degrees
            //
            //            }
            
            
            
            //            it("can inter String with diff styles (decimal number formatting)") {
            //
            //                let shortStr = "5kg"
            //                let mediumStr = "5 kg"
            //                let longStr = "5 kilograms"
            //
            //                let shortM = Measure(shortStr,
            //                                     unitStyle: .short,
            //                                     unitOptions: .providedUnit,
            //                                     .english)!
            //
            //                let mediumM = Measure(mediumStr,
            //                                      unitStyle: .medium,
            //                                      unitOptions: .providedUnit,
            //                                      .english)!
            //
            //                let longM = Measure(longStr,
            //                                    unitStyle: .long,
            //                                    unitOptions: .providedUnit,
            //                                    .english)!
            //
            //                print("Short: \(shortM.str)")      // 5kg
            //                print("Medium: \(mediumM.str)")    // 5 kg
            //                print("Long: \(longM.str)")        // 5 kilograms
            //
            //
            //                let measure = 5.0.kilograms.measure
            //
            //
            //                expect(shortM).to(equal(measure))
            //                expect(mediumM).to(equal(measure))
            //                expect(longM).to(equal(measure))
            //
            //                expect(shortM.str).to(equal(shortStr))
            //                expect(mediumM.str).to(equal(mediumStr))
            //                expect(longM.str).to(equal(longStr))
            //            }
            //
            //            it("can transl to String with diff styles (decimal number formatting)") {
            //
            //                let m = 5.0.kilograms
            //                let short = m.string(unitStyle: .short,
            //                                     unitOptions: .providedUnit,
            //                                     .english)
            //
            //                let medium = m.string(unitStyle: .medium,
            //                                      unitOptions: .providedUnit,
            //                                      .english)
            //
            //                let long = m.string(unitStyle: .long,
            //                                    unitOptions: .providedUnit,
            //                                    .english)
            //
            //                // print("Short: \(short)")      // 5kg
            //                // print("Medium: \(medium)")    // 5 kg
            //                // print("Long: \(long)")        // 5 kilograms
            //
            //                expect(short).to(equal("5kg"))
            //                expect(medium).to(equal("5 kg"))
            //                expect(long).to(equal("5 kilograms"))
            //            }
            //
            //
            //            //TODO: - spellOut not working
            //            it("can transl to String with diff styles (numbers are spelled out)") {
            //
            //                //                let fmtr = MeasurementFormatter.shared(unitStyle: .short,
            //                //                                                       unitOptions: .providedUnit,
            //                //                                                       numStyle: .spellOut,
            //                //                                                       .english)
            //                //                let m = 500.0.kilograms
            //                //                let str = m.string(unitStyle: .long,
            //                //                                   unitOptions: .providedUnit,
            //                //                                   //TODO: numStyle: .spellOut,
            //                //                                   .english)
            //
            //                let str = NumberFormatter.shared(numStyle: .spellOut, .english).string(from:500)!
            //
            //                print("NumberFormatter: ")
            //                expect(str).to(equal("five hundred"))
            //            }
            
            
            //            it("can be converted to other units") {
            //
            //                let m = 5.0.kilograms.converted(to: .grams)
            //                let short = m.string(unitStyle: .short,
            //                                     unitOptions: .providedUnit,
            //                                     .english)
            //
            //                let medium = m.string(unitStyle: .medium,
            //                                      unitOptions: .providedUnit,
            //                                      .english)
            //
            //                let long = m.string(unitStyle: .long,
            //                                    unitOptions: .providedUnit,
            //                                    .english)
            //
            //                // print("Short: \(short)")      // 5,000g
            //                // print("Medium: \(medium)")    // 5,000 g
            //                // print("Long: \(long)")        // 5,000 grams
            //
            //                expect(short).to(equal("5,000g"))
            //                expect(medium).to(equal("5,000 g"))
            //                expect(long).to(equal("5,000 grams"))
            //            }
            
            //            it("can inter String from diff langs") {
            //
            //                let str = "5 kgs"
            //                if Measure(str) == nil {
            //                    fail()
            //                }
            //            }
            //
            
            
            
            // it("can transl String") {
            //                let a = 3.0
            //                let b = 4.0
            //                let c = 7.0
            //
            //                XCTAssertEqual(a.kilometers, Measurement<UnitLength>(value: a, unit: .kilometers))
            //                XCTAssertEqual(b.seconds, Measurement<UnitDuration>(value: b, unit: .seconds))
            //
            //                XCTAssertEqual(c.grams, a.grams + b.grams)
            //                XCTAssertEqual(a.acres, c.acres - b.acres)
            //                //        XCTAssertEqual(c.metersPerSecond / 7, Measurement(value: 1, unit: .metersPerSecond))
            //                //        XCTAssertEqual(c.liters * 8, Measurement(value: 56, unit: .liters))
            // }
            
            //            it("can transl String") {
            //
            //                let obj = MeasureL.liter.word
            //                let str = "liter"
            //                // let w1 = DateW()
            //                //one liter
            //                //two liters
            //                //hundred liters
            //                //hundreds of liters ??
            //
            //                expect(obj.str).to(equal(str))
            //            }
            //
            //            it("can inter from String") {
            //                let str = "liter"
            //                if MeasureMW(str) == nil {
            //                    fail()
            //                }
            //            }
            
            
            //Although Foundation contains UnitDuration, it's not full, can reprepresent longest duration unit hour, no days, weeks, years, and cannot handle complex calendar logic
            //            it("can print minutes in 3 styles") {
            //
            //                print("------------ Minutes ")
            //
            //                var minutes = Measure(5.0.minutes,
            //                                      unitStyle: .short,
            //                                      .english)
            //
            //                print("Short: \(minutes.str)") // short:  5m - ??
            //
            //                minutes.unitStyle = .medium
            //                print("Medium: \(minutes.str)") // medium:  5 min
            //
            //                minutes.unitStyle = .long
            //                print("Long: \(minutes.str)") // long:  5 minutes
            //
            //            }
            
            //            it("can inter Measures and Measurements in spellOut style") {
            //
            //                let str = "five hundred kilograms"
            //
            //                let format = MeasureFormat(unitStyle: .long,
            //                                            numFormat: .spellOut,
            //                                            .english)
            //
            //                let munit = MeasureUnit.mass(.kilograms)
            //
            //                let measure = Measure(str,
            //                                      min: 1, max: 500, step: 1,
            //                                      munit, format)!
            //
            //                expect(measure.str).to(equal(str))
            //            }
            
            // ------ Debugging
            //
            //                Measure.generate(min: 1, max: 5,
            //                                 step: 1,  munit,
            //                                 format).forEach {
            //                                    print($0.str)
            //                                 }
            
            
            //            it("can print Measures and Measurements in spellOut style") {
            //
            //                print("------------ kilograms ")
            //
            //                let m = 5.1234567895123456789.micrograms.measure
            //                // 5.1234567895123456789.micrograms
            //
            //                //var measure = Measure(m, unitStyle: .long, .english)
            //
            //                let fmtr = MeasureFormatter.shared(unitStyle: .long,
            //                                                   numStyle: .spellOut, .english)
            //                let str = fmtr.string(from: m)
            //
            //                print("5.1234567895123456789: \(str)")
            //
            //                //                 measure.unitStyle = .long
            //                //                 print("Long: \(measure.str)") // long:  5 kilograms
            //
            //            }
            
            //            it("can print volume in 3 styles") {
            //
            //                print("------------ liters ")
            //
            //                var liters = Measure(5.1.micrometers,
            //                                     unitStyle: .short,
            //                                     .english)
            //
            //                print("Short: \(liters.str)") // short:  5L - ??
            //
            //                liters.unitStyle = .medium
            //                print("Medium: \(liters.str)") // medium:  5 L
            //
            //                liters.unitStyle = .long
            //                print("Long: \(liters.str)") // long:  5 liters
            //
            //            }
            
            //TODO: bc func are repeating, consider making some generic func, later will add even more !
            //            it("can print degrees in 3 styles") {
            //
            //                print("------------ Minutes ")
            //
            //                var degrees = Measure(5.0.degrees,
            //                                      unitStyle: .short,
            //                                      .english)
            //
            //                print("Short: \(degrees.str)") // short:  5° - ok
            //
            //                degrees.unitStyle = .medium
            //                print("Medium: \(degrees.str)") // medium:  5 deg
            //
            //                degrees.unitStyle = .long
            //                print("Long: \(degrees.str)") // long:  5 degrees
            //
            //            }
            
            
            
            //            it("can inter String with diff styles (decimal number formatting)") {
            //
            //                let shortStr = "5kg"
            //                let mediumStr = "5 kg"
            //                let longStr = "5 kilograms"
            //
            //                let shortM = Measure(shortStr,
            //                                     unitStyle: .short,
            //                                     unitOptions: .providedUnit,
            //                                     .english)!
            //
            //                let mediumM = Measure(mediumStr,
            //                                      unitStyle: .medium,
            //                                      unitOptions: .providedUnit,
            //                                      .english)!
            //
            //                let longM = Measure(longStr,
            //                                    unitStyle: .long,
            //                                    unitOptions: .providedUnit,
            //                                    .english)!
            //
            //                print("Short: \(shortM.str)")      // 5kg
            //                print("Medium: \(mediumM.str)")    // 5 kg
            //                print("Long: \(longM.str)")        // 5 kilograms
            //
            //
            //                let measure = 5.0.kilograms.measure
            //
            //
            //                expect(shortM).to(equal(measure))
            //                expect(mediumM).to(equal(measure))
            //                expect(longM).to(equal(measure))
            //
            //                expect(shortM.str).to(equal(shortStr))
            //                expect(mediumM.str).to(equal(mediumStr))
            //                expect(longM.str).to(equal(longStr))
            //            }
            //
            //            it("can transl to String with diff styles (decimal number formatting)") {
            //
            //                let m = 5.0.kilograms
            //                let short = m.string(unitStyle: .short,
            //                                     unitOptions: .providedUnit,
            //                                     .english)
            //
            //                let medium = m.string(unitStyle: .medium,
            //                                      unitOptions: .providedUnit,
            //                                      .english)
            //
            //                let long = m.string(unitStyle: .long,
            //                                    unitOptions: .providedUnit,
            //                                    .english)
            //
            //                // print("Short: \(short)")      // 5kg
            //                // print("Medium: \(medium)")    // 5 kg
            //                // print("Long: \(long)")        // 5 kilograms
            //
            //                expect(short).to(equal("5kg"))
            //                expect(medium).to(equal("5 kg"))
            //                expect(long).to(equal("5 kilograms"))
            //            }
            //
            //
            //            //TODO: - spellOut not working
            //            it("can transl to String with diff styles (numbers are spelled out)") {
            //
            //                //                let fmtr = MeasurementFormatter.shared(unitStyle: .short,
            //                //                                                       unitOptions: .providedUnit,
            //                //                                                       numStyle: .spellOut,
            //                //                                                       .english)
            //                //                let m = 500.0.kilograms
            //                //                let str = m.string(unitStyle: .long,
            //                //                                   unitOptions: .providedUnit,
            //                //                                   //TODO: numStyle: .spellOut,
            //                //                                   .english)
            //
            //                let str = NumberFormatter.shared(numStyle: .spellOut, .english).string(from:500)!
            //
            //                print("NumberFormatter: ")
            //                expect(str).to(equal("five hundred"))
            //            }
            
            
            //            it("can be converted to other units") {
            //
            //                let m = 5.0.kilograms.converted(to: .grams)
            //                let short = m.string(unitStyle: .short,
            //                                     unitOptions: .providedUnit,
            //                                     .english)
            //
            //                let medium = m.string(unitStyle: .medium,
            //                                      unitOptions: .providedUnit,
            //                                      .english)
            //
            //                let long = m.string(unitStyle: .long,
            //                                    unitOptions: .providedUnit,
            //                                    .english)
            //
            //                // print("Short: \(short)")      // 5,000g
            //                // print("Medium: \(medium)")    // 5,000 g
            //                // print("Long: \(long)")        // 5,000 grams
            //
            //                expect(short).to(equal("5,000g"))
            //                expect(medium).to(equal("5,000 g"))
            //                expect(long).to(equal("5,000 grams"))
            //            }
            
            //            it("can inter String from diff langs") {
            //
            //                let str = "5 kgs"
            //                if Measure(str) == nil {
            //                    fail()
            //                }
            //            }
            //
            
            
            
            // it("can transl String") {
            //                let a = 3.0
            //                let b = 4.0
            //                let c = 7.0
            //
            //                XCTAssertEqual(a.kilometers, Measurement<UnitLength>(value: a, unit: .kilometers))
            //                XCTAssertEqual(b.seconds, Measurement<UnitDuration>(value: b, unit: .seconds))
            //
            //                XCTAssertEqual(c.grams, a.grams + b.grams)
            //                XCTAssertEqual(a.acres, c.acres - b.acres)
            //                //        XCTAssertEqual(c.metersPerSecond / 7, Measurement(value: 1, unit: .metersPerSecond))
            //                //        XCTAssertEqual(c.liters * 8, Measurement(value: 56, unit: .liters))
            // }
            
            //            it("can transl String") {
            //
            //                let obj = MeasureL.liter.word
            //                let str = "liter"
            //                // let w1 = DateW()
            //                //one liter
            //                //two liters
            //                //hundred liters
            //                //hundreds of liters ??
            //
            //                expect(obj.str).to(equal(str))
            //            }
            //
            //            it("can inter from String") {
            //                let str = "liter"
            //                if MeasureMW(str) == nil {
            //                    fail()
            //                }
            //            }
            
            
            //Although Foundation contains UnitDuration, it's not full, can reprepresent longest duration unit hour, no days, weeks, years, and cannot handle complex calendar logic
            //            it("can print minutes in 3 styles") {
            //
            //                print("------------ Minutes ")
            //
            //                var minutes = Measure(5.0.minutes,
            //                                      unitStyle: .short,
            //                                      .english)
            //
            //                print("Short: \(minutes.str)") // short:  5m - ??
            //
            //                minutes.unitStyle = .medium
            //                print("Medium: \(minutes.str)") // medium:  5 min
            //
            //                minutes.unitStyle = .long
            //                print("Long: \(minutes.str)") // long:  5 minutes
            //
            //            }
            
        }
    }
}
