
import XCTest
import Quick
import Nimble
import MeasureKit


class MeasureUnitSpec: QuickSpec {
    override func spec() {
        
        describe("MeasureUnit") {
            
            it("can transl and inter DurationMUnit") {
                
                let munit = DurationMUnit.minutes.munit
                
                let format = MeasureUnitFormat(unitStyle: .long,
                                               .ukrainian)
                
                let str = MeasureFormatter.str(from: munit, format)
                
                //print("minutes: " + str)
                
                let result = "хвилини"
                expect(str).to(equal(result))
                
                let possibleUnits = Set([munit])

                let _ = MeasureUnit(result, format: format,
                                    possibleUnits)!

                //let measure = 5.minutes.measure
                //let str = m.str
                //print("5.minutes: \(measure)")
            }
            
//            it("can transl and inter TemperatureMUnit") {
//
//                let unit: UnitTemperature = TemperatureMUnit.celsius.unit
//
//                let format = MeasureFormat(unitStyle: .long,
//                                           numFormat: .spellOut,
//                                           .ukrainian)
//
//                let fmtr = MeasurementFormatter.sharedMeasurementFormatter(format: format)
//
//                let str = fmtr.string(from: unit)
//                //print("celsius: " + str)
//
//                let result = "градуси Цельсія"
//                expect(str).to(equal(result))
//
//                let unit = MeasureUnit(result)!
//
//                //let measure = 5.celsius.measure
//                //let str = m.str
//                //print("5.celsius: \(measure)")
//            }
            
            //            it("can transl and inter any MeasureUnits") {
            //
            //                let str1 = "один килограмм"
            //                let str2 = "два килограмма"
            //
            //                let munit = MeasureUnit.mass(.kilograms)
            //
            //
            //                let munit = MassMUnit.allCases.munits { munit in
            //
            //                    Measure.generate(min: 1, max: 1,
            //                                     step: 1,  munit,
            //                                     format).forEach {
            //                                        print($0.str)
            //                                     }
            //                }
            //
            //                //                let format = MeasureFormat(unitStyle: .long,
            //                //                                           numFormat: .spellOut,
            //                //                                           .russian)
            //                //
            //                //
            //                //
            //                //
            //                //                let measure1 = Measure(str1,
            //                //                                       min: 1, max: 2, step: 1,
            //                //                                       munit, format)!
            //                //
            //                //                let measure2 = Measure(str2,
            //                //                                       min: 1, max: 2, step: 1,
            //                //                                       munit, format)!
            //                //
            //                //                expect(measure1.str).to(equal(str1))
            //                //                expect(measure2.str).to(equal(str2))
            //            }
            
            
            it("can inter/transl with diff UnitStyles") {
                
                //Table 1 Examples of formatting styles for different locales
                
                //The presented styles
                //en_US Locale
                //fr_FR Locale
                //zh_CN Locale
                
                //NumberFormatter.Style.none
                //1235
                //1235
                //1235
                
                //NumberFormatter.Style.decimal
                //1,234.568
                //1 234,568
                //1,234.568
                
                //NumberFormatter.Style.percent
                //12%
                //12 %
                //12%
                
                //NumberFormatter.Style.scientific
                //1.2345678E3
                //1,2345678E3
                //1.2345678E3
                
                //NumberFormatter.Style.spellOut
                //one hundred twenty-three
                //cent vingt-trois
                //一百二十三
                
                //NumberFormatter.Style.ordinal
                //3rd
                //3e
                //第3
                
                //NumberFormatter.Style.currency
                //$1,234.57
                //1 234,57 €
                //￥1,234.57
                
                //NumberFormatter.Style.currencyAccounting
                //($1,234.57)
                //(1 234,57 €)
                //(￥1,234.57)
                
                //NumberFormatter.Style.currencyISOCode
                //USD1,234.57
                //1 234,57 EUR
                //CNY1,234.57
                
                //NumberFormatter.Style.currencyPlural
                //1,234.57 US dollars
                //1 234,57 euros
            }
        }
    }
}
