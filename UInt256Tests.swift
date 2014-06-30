//
//  UInt256Tests.swift
//  Crypto Coin Swift
//
//  Created by Sjors Provoost on 24-06-14.
//

import XCTest
import CryptoCoin

class UInt256Tests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitWith16BitMaxHex() {
        // The largest value for an unsigned 16 bit integer is 2^16 - 1
        let bi = UInt256(hexStringValue: "FFFF")
        
        XCTAssertTrue(bi != nil, "Should exist");
        
    }
    
    func testToHexString() {
        let bi = UInt256(hexStringValue: "FFFF")
        XCTAssertEqual(bi.toHexString, "FFFF", "");

    }

    func testInitWith32BitHex() {
        let bi = UInt256(hexStringValue: "7FFFFFFF")
        
        XCTAssertTrue(bi != nil, "Should exist");
        
    }

    func testInitWithHalfMax32BitHex() {
        // The largest value for an unsigned 32 bit integer is 2^32 - 1
        let bi = UInt256(hexStringValue: "80000000")
        
        XCTAssertTrue(bi != nil, "Should exist");
        
    }
    
    func testInitWith32BitMaxHex() {
        // The largest value for an unsigned 32 bit integer is 2^32 - 1
        let bi = UInt256(hexStringValue: "FFFFFFFF")
        
        XCTAssertTrue(bi != nil, "Should exist");
        
    }

    func testInitWith64BitMaxHex() {
        // The largest value for an unsigned 64 bit integer is 2^64 - 1
        let bi = UInt256(hexStringValue: "FFFFFFFFFFFFFFFF")
        
        XCTAssertTrue(bi != nil, "Should exist");
        
    }

    
    func testInitWith128BitMaxHex() {
        // The largest value for an unsigned 128 bit integer is 2^128 - 1
        let bi = UInt256(hexStringValue: "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF")
        
        XCTAssertTrue(bi != nil, "Should exist");
        
    }

    func testInitWithLargestHex() {
        // The largest value for an unsigned 256 bit integer is 2^256 - 1
        let bi = UInt256(hexStringValue: "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF")
        
        XCTAssertTrue(bi != nil, "Should exist");
        
    }
    
    func testInitWithDecimal() {
        let dec = UInt256(decimalStringValue: "42")
        let hex = UInt256(hexStringValue: "2A")

        XCTAssertEqual(dec, hex, "Should exist and be the same");
    }
    
    func testToDecimalString() {
        let bi = UInt256(decimalStringValue: "42")
        XCTAssertEqual(bi.toDecimalString, "42", "");
        
    }
    
    
    func test9DigitNumber() {
        let bi = UInt256(decimalStringValue: "100000000")
        XCTAssertTrue(bi != nil, "Should exist");
    }

    func test12DigitNumber() {
        let bi = UInt256(decimalStringValue: "100000000000")
        XCTAssertTrue(bi != nil, "Should exist");
    }

    func testInitWithLargestDecimalNumber() {
        // The largest value for an unsigned 256 bit integer is 2^256 - 1
        let a = UInt256(decimalStringValue: "115792089237316195423570985008687907853269984665640564039457584007913129639935")
        let b = UInt256(hexStringValue: "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF")
        
        XCTAssertEqual(a, b, "Should be the same as max hex");

    }
    
    func testInitWithExampleDecimalNumber() {
        let a = UInt256(decimalStringValue: "29048849665247")
        let b = UInt256(hexStringValue: "1A6B765D8CDF")
        
        XCTAssertEqual(a, b, "Should be the same as max hex");

    }
    func testEquality() {
        let a =  UInt256(decimalStringValue: "100000000000")
        let b =  UInt256(decimalStringValue: "100000000000")

        XCTAssertTrue(a == b, "Should be the same");
    }

    func testComparison() {
        let smaller = UInt256(decimalStringValue: "100000000000")
        let bigger =  UInt256(decimalStringValue: "100000000001")

        XCTAssertTrue(smaller < bigger, "Should compare");
        XCTAssertFalse(smaller > bigger, "Should compare");

    }
    
    func testCompareBig() {
        var smaller = UInt256(decimalStringValue: "340282366920938463463374607431768211454")
        var bigger =  UInt256(decimalStringValue: "340282366920938463463374607431768211455")
        
        XCTAssertTrue(smaller < bigger, "Should compare");
        XCTAssertTrue(bigger > smaller, "Should compare");
        
        smaller =   UInt256(decimalStringValue: "64333151529")
        bigger =    UInt256(decimalStringValue: "158113883008")

        XCTAssertTrue(smaller < bigger, "Should compare");
        XCTAssertTrue(bigger > smaller, "Should compare");
        
        XCTAssertFalse(smaller > bigger, "Should compare");
        XCTAssertFalse(bigger < smaller, "Should compare");
    }
    
    func testGreaterOrEqual() {
        var smaller =   UInt256(decimalStringValue: "64333151529")
        var bigger =    UInt256(decimalStringValue: "158113883008")
        
        XCTAssertTrue(smaller <= bigger, "Should compare");
        XCTAssertTrue(bigger >= smaller, "Should compare");
        
        XCTAssertFalse(smaller >= bigger, "Should compare");
        XCTAssertFalse(bigger <= smaller, "Should compare");
    }



    func testAdd() {
        let a = UInt256(decimalStringValue: "14")
        let b = UInt256(decimalStringValue: "26")
        let c = UInt256(decimalStringValue: "40")
        
        XCTAssertEqual(a + b, c, "a + b = c");

    }
    
    func testAddHex() {
        let a = UInt256(hexStringValue: "14")
        let b = UInt256(hexStringValue: "26")
        let c = UInt256(hexStringValue: "3A")

        XCTAssertEqual(a + b, c, "a + b = c");

    }
    

    func testAddBig() {
        let a = UInt256(decimalStringValue: "14000000123400000001")
        let b = UInt256(decimalStringValue: "26000000123400000001")
        let c = UInt256(decimalStringValue: "40000000246800000002")
        
        XCTAssertEqual(a + b, c, "\(a) + \(b) = \( c )");
    }
    
    func testSubtract() {
        let a = UInt256(decimalStringValue: "40")
        let b = UInt256(decimalStringValue: "26")
        let c = UInt256(decimalStringValue: "14")
        
        XCTAssertEqual(a - b, c, "a - b = c");
        
    }

    func testSubtractHex() {
        let a = UInt256(hexStringValue: "3A")
        let b = UInt256(hexStringValue: "26")
        let c = UInt256(hexStringValue: "14")

        XCTAssertEqual(a - b, c, "a - b = c");
        
    }

    func testSubtractBig() {
        let a = UInt256(hexStringValue: "40000000000000000000")
        let b = UInt256(hexStringValue: "26000000000000000001")
        let c = UInt256(hexStringValue: "19FFFFFFFFFFFFFFFFFF")
        
        XCTAssertEqual(a - b, c, "a - b = c");
        
    }
    
    func testLeftShift() {
        var a = UInt256(decimalStringValue: "32")
        
        XCTAssertEqual((a << 1).toDecimalString, "64", "");
    }
    
    func testAssignLeftShift() {
        var a = UInt256(decimalStringValue: "32")
        
        a <<= 1
        
        XCTAssertEqual(a.toDecimalString, "64", "");
        
    }
    
    func testLeftShiftHex() {
        var a = UInt256(hexStringValue: "FFFFFFFF")
        a <<= 1
        
        XCTAssertEqual(a.toHexString,  "1FFFFFFFE", "");
        
    }
    
    func testLeftShiftBigHex() {
        var a = UInt256(hexStringValue: "FFFFFFFFFFFFFFFFFFFF")
        a <<= 1
        
        XCTAssertEqual(a.toHexString,  "1FFFFFFFFFFFFFFFFFFFE", "");
        
    }
    
    func testLeftShiftShouldNotMutate() {
        var a = UInt256(hexStringValue: "AAAAAAAAAAA")
        var b=a
        a << 1
        
        XCTAssertEqual(a, b, "");
    }
    
    func testRightShiftShouldNotMutate() {
        var a = UInt256(hexStringValue: "AAAAAAAAAAA")
        var b=a
        a >> 1
        
        XCTAssertEqual(a, b, "");
    }
    
    func testLeftOverflowHex() {
        var a = UInt256(hexStringValue: "1FFFFF")

        println(a.toDecimalString)
        
        a <<= 1
        
        println(a.toDecimalString)
        
        XCTAssertEqual(a.toHexString,   "3FFFFE", "");
        
    }
    
    func testLeftShiftBig() {
        var a = UInt256(decimalStringValue: "32000000000000000000")
        a <<= 1
        
        XCTAssertEqual(a.toDecimalString,   "64000000000000000000", "");
        
    }

    func testRightShift() {
        var a = UInt256(decimalStringValue: "64")
        a >>= 1
        
        XCTAssertEqual(a.toDecimalString, "32", "");
        
    }
    
    func testRightShiftBig() {
        var a = UInt256(decimalStringValue: "64000000000000000000")
        a >>= 1
        
        XCTAssertEqual(a.toDecimalString, "32000000000000000000", "");
    }

    func testMultiply() {
        let a = UInt256(decimalStringValue: "32")
        let b = UInt256(decimalStringValue: "2")
        let c = UInt256(decimalStringValue: "64")
        
        let res =  a * b
        
        XCTAssertEqual(res, c, "\(a) * \(b) = \( res ) != \( c )");
        
    }
    
    func testMultiplyShouldNotMutate() {
        let a = UInt256(decimalStringValue: "32")
        let b = UInt256(decimalStringValue: "2")
        let c = UInt256(decimalStringValue: "64")
        
        var res =  a * b
        res = a * b
        
        XCTAssertEqual(res, c, "Res mutated to \( res)");
        
        
    }

    func testMultiplyBig() {
        let a = UInt256(decimalStringValue: "32000000000")
        let b = UInt256(decimalStringValue:  "2000000000")
        let c = UInt256(decimalStringValue: "64000000000000000000")
        
        let res = a * b
        
        XCTAssertEqual(res, c, "\(a) * \(b) = \( res) != \( c )");
        
    }
    
    func testMultiplyMax() {
        let a = UInt256(decimalStringValue: "340282366920938463463374607431768211455")
        let c = UInt256(decimalStringValue: "115792089237316195423570985008687907852589419931798687112530834793049593217025") // 0.9999999...% of UInt256 max
        
        let res = a * a
        
        XCTAssertEqual(res, c, "");
        
    }

    func testSingleBitAt() {
        var a = UInt256.singleBitAt(255)
        XCTAssertEqual(a.toHexString, "1", "");

        a = UInt256.singleBitAt(254)
        XCTAssertEqual(a.toHexString, "2", "");
        
        a = UInt256.singleBitAt(0)
        XCTAssertEqual(a.toHexString, "8000000000000000000000000000000000000000000000000000000000000000", "");
    }
    
    func testSetBitAt() {
        var a = UInt256.singleBitAt(255)
        a.setBitAt(255)
        
        XCTAssertEqual(a.toHexString, "1", "");
        
        a.setBitAt(254)
        XCTAssertEqual(a.toHexString, "3", "");
        
    }
    
    func testDivide() {
        let a = UInt256(decimalStringValue: "640")
        let b = UInt256(decimalStringValue: "4")
        let c = UInt256(decimalStringValue: "160")
        
        let res =  a / b

        XCTAssertEqual(res, c, "\(a) / \(b) = \( res ) != \( c )");
        
    }
    
    func testModulo() {
        let a = UInt256(decimalStringValue: "23")
        let b = UInt256(decimalStringValue: "5")
        let c = UInt256(decimalStringValue: "3")
        
        let res =  a % b
        
        XCTAssertEqual(res, c, "\(a) % \(b) = \( res ) != \( c )");
        
    }
    
    
    func testModuloLarger() {
        let a = UInt256(decimalStringValue: "25000000000000000000000000000000000000000000000000000000000000000000000004")
        let b = UInt256(decimalStringValue: "5000000000000000000000000000000000000")
        let c = UInt256(decimalStringValue: "4")
        
        let res =  a % b
        
        XCTAssertEqual(res, c, "\(a) % \(b) = \( res ) != \( c )");
        
    }
    
    func testModuloMoreComplex() {
        let a = UInt256(decimalStringValue: "2145932040592314323128185")
        let b = UInt256(decimalStringValue: "897983433434")
        let c = UInt256(decimalStringValue: "3")
        
        let res =  a % b
        
        XCTAssertEqual(res, c, "\(a) % \(b) = \( res ) != \( c )");
        
    }
//
    func testDivideBig() {
        let a = UInt256(decimalStringValue: "115792089237316195423570985008687907852589419931798687112530834793049593217025")
        let b = UInt256(decimalStringValue: "340282366920938463463374607431768211455")
        let c = UInt256(decimalStringValue: "340282366920938463463374607431768211455")
        
        let res =  a / b
        
        XCTAssertEqual(res, c, "\(a) / \(b) = \( res ) != \( c )");
        
    }
    


    func testModuloLargest128bitPrime() {
        // According to http://primes.utm.edu/lists/2small/100bit.html, 2^128-159 is prime
        // According to Ruby that's: 340282366920938463463374607431768211297
        
        var a = UInt256(decimalStringValue: "340282366920938463463374607431768211298")
        var b = UInt256(decimalStringValue: "340282366920938463463374607431768211297")
        var c = UInt256(decimalStringValue: "1")
        
        var res =  a % b
        
        XCTAssertEqual(res, c, "\(a) % \(b) = \( res ) != \( c )");
        
        // (2**128 - 159) * 55 + 5 (according to Ruby)
        a = UInt256(decimalStringValue: "18715530180651615490485603408747251621340")
        b = UInt256(decimalStringValue: "340282366920938463463374607431768211297")
        c = UInt256(decimalStringValue: "5")
        
        res =  a % b
        
        // Fails:
        XCTAssertEqual(res, c, "\(a) % \(b) = \( res ) != \( c )");
        

    }
    
    // Fails:
    func testModuloAlmostBiggest() {
        let a = UInt256(decimalStringValue: "1157920892373161954235709850086879078491865962625893024778970887187319111025")
        let b = UInt256(decimalStringValue: "340282366920938463463374607431768211455")
        let c = UInt256(decimalStringValue: "1")
        
        let res =  a % b
        
        XCTAssertEqual(res, c, "\(a) % \(b) = \( res ) != \( c )");
        
    }
    
    // Fails (even though multiplication above did reveal these numbers, are they wrong?):
    func testModuloBig() {
        let a = UInt256(decimalStringValue: "115792089237316195423570985008687907852589419931798687112530834793049593217026")
        let b = UInt256(decimalStringValue: "340282366920938463463374607431768211455")
        let c = UInt256(decimalStringValue: "1")
        
        let res =  a % b
        
        XCTAssertEqual(res, c, "\(a) % \(b) = \( res ) != \( c )");
        
    }
}
