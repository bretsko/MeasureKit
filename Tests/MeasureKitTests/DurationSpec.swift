
import XCTest
import Quick
import Nimble
import MeasureKit


class DurationSpec: QuickSpec {
    override func spec() {
        
        describe("DurationMUnit") {
            
            it("can print duration in any style") {
                
                
                //TODO: make tests to detect if CountryLIDs contain any new values in addition to LangLIDs !
                
                let m = 5.hours
                
                //print("---- LangLID cases -----")
                
                
                let langLIDCases: Set<Str> = LangLID.allForms.map { lid in
                    
                    let format = MeasureFormat(unitStyle: .long ,
                                               numFormat: .spellOut, lid.lid)
                    return m.measure(format).str
                }.compactMap{$0}.set
                
                //print("---- CountryLID cases -----")
                
                let countryLIDCases: Set<Str> = CountryLID.allForms.map { lid in
                    
                    let format = MeasureFormat(unitStyle: .long ,
                                               numFormat: .spellOut, lid.lid)
                    return m.measure(format).str
                }.compactMap{$0}.set
                
                let overlappingCases = langLIDCases.intersection(countryLIDCases)
                expect(overlappingCases.len).to(equal(0))
                print(overlappingCases.array.joined)
                
                //TODO: uses this list for inter -> many locales are actually equivalent !
                // All overlapping cases between
                // 5 сати 5 ժամ 5 часов 5 ore 5 గంటలు ۵ گٲنٹہٕ 5 ώρες 5 heures 5 oere 5 oras 5 timmar 5 awr 5 საათი 5 گھنٹے 5 Stünnen 5 ຊົ່ວໂມງ 5 háwa 5 stunde 5 цаг 5 сат 5 valandos 5 tuntia 5 horas 5 orë 5 uairean 5 timer 5 جم 5 h ༥ ཆུ་ཚོད་ 5 soat 5 godzin 5 ordu 5 годин 5 uras 5 óra 5 saet 5 sati 5 jam 5 ಗಂಟೆಗಳು 5 чаас 5 Owápȟe 5 hodín ५ h 5 tímar 5 hodźinow 5 oris ৫ h 5 gaƒoƒo 5 соат 5 Schtunde 5 മണിക്കൂർ 5 ଘଣ୍ଟା ५ तास 5 ម៉ោង 5 hola 5 saat 5 سائەت 5 eur 5 hores 5 કલાક 5 сахаты 5 amahora 5 гадзін ၅ နာရီ 5 පැය 5 小时 5 ᎢᏳᏟᎶᏓ ৫ ঘণ্টা 5 сахьт 5 uur 5 sagat 5 ሰዓቶች 5 hodin 5 саат 5 diibmur 5 ur 5 ਘੰਟੇ 5 小時 5 மணிநேரங்கள் 5 hours 5 timar 5 giờ ٥ ڪلاڪ 5 שעות ٥ h ৫ ঘন্টা 5 góźinow 5 huaire 5 saa 5 saacadood 5 ora ۵ ساعِت 5 घंटे 5 tundi 𑄻 𑄊𑄧𑄚𑄴𑄘 5 stundas ۵ h 5 Stunden 5 ชั่วโมง 5 klukkustundir 5 Tuki ٥ ساعات 5 сағат ५ घण्टा 5 Stonnen ۵ ساعت ᱕ h 5 часа
                
                // All failing cases
                //zh-Hant_HK zh-Hant zh_MO ko_KR zh_CN zh-Hans_CN wuu to_TO zh zh-Hant_MO zh-Hans_SG zh_SG zh_HK zh_TW zh-Hans_HK ja_JP zh_Hant_TW to zh-Hans_MO ko zh-Hant_CN ko_KP ja zh-Hans
                
                //                let diff1 = langLIDCases.subtracting(countryLIDCases)
                //                expect(diff1.isEmpty).to(beTrue())
                //                print(diff1.array.joined)
                //                //wuu to ja ko zh-Hant zh zh-Hans
                //
                //                let diff2 = countryLIDCases.subtracting(langLIDCases)
                //                expect(diff2.isEmpty).to(beTrue())
                //                print(diff2.array.joined)
                //zh_MO zh_HK zh-Hans_MO ja_JP zh_Hant_TW ko_KR zh-Hant_HK zh-Hant_CN zh-Hans_SG to_TO ko_KP zh_TW zh-Hans_HK zh_CN zh_SG zh-Hant_MO zh-Hans_CN
            }
            
            
            //            it("can print duration in any style") {
            //
            //
            //                //TODO: make tests to detect if CountryLIDs contain any new values in addition to LangLIDs !
            //
            //                let m = 5.hours
            //
            //
            //                print("---- Failed LangLID cases -----")
            //
            //                let langLIDFormats: Set<MeasureFormat> = LangLID.allForms.lids.map {
            //                    MeasureFormat(unitStyle: .long ,
            //                                  numFormat: .spellOut, $0)
            //                }.set
            //                let langLIDCases: Set<Str> = langLIDFormats.map {
            //                    let meas = m.measure($0)
            //                    if let str = meas.str {
            //                        return str
            //                    } else {
            //                        print(meas.locale)
            //                        return nil
            //                    }
            //                }.compactMap{$0}.set
            //                //ko (fixed)
            //                //zh-Hant (fixed)
            //                //to (fixed)
            //                //ja (fixed)
            //                //zh-Hans (fixed)
            //                //zh (fixed)
            //                //wuu (fixed)
            //
            //                print("---- Failed CountryLID cases -----")
            //
            //                let countryLIDFormats: Set<MeasureFormat> = CountryLID.allForms.lids.map {
            //                    MeasureFormat(unitStyle: .long ,
            //                                  numFormat: .spellOut, $0)
            //                }.set
            //                let countryLIDCases: Set<Str> = countryLIDFormats.map {
            //                    let meas = m.measure($0)
            //                    if let str = meas.str {
            //                        return str
            //                    } else {
            //                        print(meas.locale)
            //                        return nil
            //                    }
            //                }.compactMap{$0}.set
            //                //zh-Hans_MO (fixed)
            //                //ko_KP (fixed)
            //                //zh_SG (fixed)
            //                //zh_TW (fixed)
            //                //zh_HK (fixed)
            //                //zh_CN (fixed)
            //                //zh_TW (fixed)
            //                //zh_SG (fixed)
            //                //ko_KR (fixed)
            //                //zh_CN (fixed)
            //                //zh_MO (fixed)
            //                //ja_JP (fixed)
            //                //zh_MO (fixed)
            //                //zh-Hans_HK (fixed)
            //                //zh-Hant_CN (fixed)
            //                //to_TO (fixed)
            //                //zh_HK (fixed)
            //
            //
            //                let diff1 = langLIDCases.subtracting(countryLIDCases)
            //                expect(diff1.isEmpty).to(beTrue())
            //                print(diff1.array.joined)
            //
            //                let diff2 = countryLIDCases.subtracting(langLIDCases)
            //                expect(diff2.isEmpty).to(beTrue())
            //                print(diff2.array.joined)
            //            }
            
            
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
            ////                let munit = DurationMUnit.seconds.munit
            //                //let str = munit.allStrs(format.unitFormat)
            //                //print(str)
            //
            //                let _ = Measure(result1,
            //                                min:1,
            //                                max:5,
            //                                step:1,
            //                                possibleUnits: Set([DurationMUnit.seconds.munit]),
            //                                format)!
            //                let _ = Measure(result2,
            //                                possibleUnits: Set([DurationMUnit.hours.munit]),
            //                                format)!
            //                let _ = Measure(result3,
            //                                possibleUnits: Set([DurationMUnit.minutes.munit]),
            //                                format)!
            //            }
        }
    }
}
