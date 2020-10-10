

import XCTest
//@testable import UnlimitedWordKit


class PerformanceTests: XCTestCase {
    
    func testSome2() {
        measure {
//            var counter = 0
//            if let v = NounL.allForms.first(where: {
//                "\($0)" == "a"
//            }) {
//                counter += 1
//            }
//            print("counter: \(counter)")
        }
    }
    
    func testSome1() {
        measure {
//            var counter = 0
//            for v in NounL.allForms where "\(v)" == "a" {
//                counter += 1
//            }
//            print("counter: \(counter)")
        }
    }
}


//class PerformanceSpec: QuickSpec {
//    override func spec() {
//
//        describe("NounL") {
//
//            it("can be fast") {
//
//
//            }
//        }
//    }
//}
