
import XCTest
import Quick
import Nimble
import MeasureKit


class MassSpec: QuickSpec {
    override func spec() {
        
        describe("MassMUnit") {
            
            it("can print duration in any style") {
                
                
                //TODO: make tests to detect if CountryLIDs contain any new values in addition to LangLIDs !
                
                let m = 5.grams
                
                
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
                
                
                let diff1 = langLIDCases.subtracting(countryLIDCases)
                expect(diff1.isEmpty).to(beTrue())
                print(diff1.array.joined)

                let diff2 = countryLIDCases.subtracting(langLIDCases)
                expect(diff2.isEmpty).to(beTrue())
                print(diff2.array.joined)
            }
            
            
            //            it("can print duration in any style") {
            //
            //                var format = MeasureFormat(unitStyle: .long ,
            //                                           numFormat: .spellOut, .english)
            //
            //                print(m.measure(format).str)
            //
            //                format.localeID = .englishUS
            //                print(m.measure(format).str)
            
            //                m.unitStyle = .medium
            //                print(m.str)
            //
            //                m.unitStyle = .long
            //                print(m.str)
            //}
            
            
            
            //            it("can print duration in 3 styles") {
            //
            //                let format = MeasureFormat(unitStyle: .long,
            //                                           numFormat: .spellOut,
            //                                           .ukrainian)
            //
            //                // format is ignored here (currently) !
            //                let fmtr = MeasureFormatter.shared()
            //
            //                let m1 = 5.seconds.measure(format)
            //                let m2 = 5.hours.measure(format)
            //                let m3 = 5.minutes.measure(format)
            //
            //                let str1 = fmtr.string(from: m1)
            //                let str2 = fmtr.string(from: m2)
            //                let str3 = fmtr.string(from: m3)
            //
            //                let result1 = "пʼять секунд"
            //                let result2 = "пʼять годин"
            //                let result3 = "пʼять хвилин"
            //                expect(str1).to(equal(result1))
            //                expect(str2).to(equal(result2))
            //                expect(str3).to(equal(result3))
            //
            ////                let munit = MassMUnit.seconds.munit
            //                //let str = munit.allStrs(format.unitFormat)
            //                //print(str)
            //
            //                let _ = Measure(result1,
            //                                min:1,
            //                                max:5,
            //                                step:1,
            //                                possibleUnits: Set([MassMUnit.seconds.munit]),
            //                                format)!
            //                let _ = Measure(result2,
            //                                possibleUnits: Set([MassMUnit.hours.munit]),
            //                                format)!
            //                let _ = Measure(result3,
            //                                possibleUnits: Set([MassMUnit.minutes.munit]),
            //                                format)!
            //            }
        }
    }
}
