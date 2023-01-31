//
//  ColoryTests.swift
//  ColoryTests
//
//  Created by Mohamed sayed on 31/01/2023.
//

import XCTest
@testable import Colory

final class ColoryTests: XCTestCase {
    var colorsReader:JsonReaderProtocol?
    override func setUp() {
        colorsReader = ColorsManager()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        colorsReader = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testLoadColorJson(){
        let colors = colorsReader?.returnColors()
        XCTAssertNotNil(colors?[0].name,"colors returned successfuly")
    }

}
