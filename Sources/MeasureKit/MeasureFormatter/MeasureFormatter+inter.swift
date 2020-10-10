
//TODO: uses this list for inter -> many locales are actually equivalent !
// All overlapping cases between
// 5 сати 5 ժամ 5 часов 5 ore 5 గంటలు ۵ گٲنٹہٕ 5 ώρες 5 heures 5 oere 5 oras 5 timmar 5 awr 5 საათი 5 گھنٹے 5 Stünnen 5 ຊົ່ວໂມງ 5 háwa 5 stunde 5 цаг 5 сат 5 valandos 5 tuntia 5 horas 5 orë 5 uairean 5 timer 5 جم 5 h ༥ ཆུ་ཚོད་ 5 soat 5 godzin 5 ordu 5 годин 5 uras 5 óra 5 saet 5 sati 5 jam 5 ಗಂಟೆಗಳು 5 чаас 5 Owápȟe 5 hodín ५ h 5 tímar 5 hodźinow 5 oris ৫ h 5 gaƒoƒo 5 соат 5 Schtunde 5 മണിക്കൂർ 5 ଘଣ୍ଟା ५ तास 5 ម៉ោង 5 hola 5 saat 5 سائەت 5 eur 5 hores 5 કલાક 5 сахаты 5 amahora 5 гадзін ၅ နာရီ 5 පැය 5 小时 5 ᎢᏳᏟᎶᏓ ৫ ঘণ্টা 5 сахьт 5 uur 5 sagat 5 ሰዓቶች 5 hodin 5 саат 5 diibmur 5 ur 5 ਘੰਟੇ 5 小時 5 மணிநேரங்கள் 5 hours 5 timar 5 giờ ٥ ڪلاڪ 5 שעות ٥ h ৫ ঘন্টা 5 góźinow 5 huaire 5 saa 5 saacadood 5 ora ۵ ساعِت 5 घंटे 5 tundi 𑄻 𑄊𑄧𑄚𑄴𑄘 5 stundas ۵ h 5 Stunden 5 ชั่วโมง 5 klukkustundir 5 Tuki ٥ ساعات 5 сағат ५ घण्टा 5 Stonnen ۵ ساعت ᱕ h 5 часа

public extension MeasureFormatter {
    
    //TODO: func to get all possible Measures  -> Set<Measure>
    
    func inter(_ str: Str,
               min: Double = 1,
               max: Double = 1000,
               step: Double = 1,
               possibleUnits: Set<MeasureUnit> = MeasureUnit.allForms,
               _ possibleFormats: Set<MeasureFormat> = MeasureFormat.allForms) -> Set<Measure>? {
        
        var matches = Set<Measure>()
        //TODO: try get all matches, and find nearest match, even with misspellings
        /// uses first match
        for format in possibleFormats {
            switch format.numFormat {
            case .spellOut:
                self.format = format
                
                let words = str.words!
                
                /// "5/five kilograms"
                guard words.len >= 2 else {
                    continue // for loop
                }
                
                guard let unitStr = words.last,
                      let unit = MeasureUnit(unitStr, format: format.unitFormat, possibleUnits) else {
                    continue // for loop
                }
                
                let numStrs = words.dropLast()!
                
                guard let num = parseNum(from: numStrs) else {
                    continue // for loop
                }
                matches.insert(Measure(unit, num))
                
            default:
                
                let r = Measure.generate(min: min, max: max,
                                         step:step,
                                         units:possibleUnits,
                                         possibleFormats).filter {
                                            $0.str == str
                                         }
                matches.formUnion(r)
            }
        }
        return matches.sth
    }
    
    func inter(_ str: Str,
               min: Double = 1,
               max: Double = 1000,
               step: Double = 1,
               _ unit: MeasureUnit,
               _ format: MeasureFormat) -> Set<Measure>? {
        
        //TODO: maybe use func above ??
        self.format = format
        return Measure.generate(min: min, max: max,
                                step:step, unit, format).filter {
                                    $0.str == str
                                }.sth
    }
    
    //TODO: consider moving this to NumberFormatter ext in MinimalBase
    func parseNum(from numStrings: [Str]) -> Double? {
        
        //TODO: try make func to collect the biggest match, without knowing the indices
        //
        //        var numStrings = [Str]()
        //
        //
        //                .enumerated().filter{ (idx, _) in
        //                    idx < words.len - 1
        //            }.map{$0.element}
        //
        //        //TODO: make func on
        //        //can be 2 or many words, "fifty five kilograms"
        //        for (i, word) in words.enumerated() {
        //
        //            // append all elements except last
        //            if i < words.len - 1 {
        //                numStrings.append(word)
        //            }
        //        }
        
        //numFormatter.locale = locale
        return numFmtr.double(from: numStrings.joinedWords)
    }
}
