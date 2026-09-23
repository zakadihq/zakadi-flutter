import Flutter
import XCTest

// If your plugin has been explicitly set to "type: .dynamic" in the Package.swift,
// you will need to add your plugin as a dependency of RunnerTests within Xcode.

@testable import zakadi_sdk_ios

// Unit tests of the Swift stub of zakadi_sdk_ios.
//
// See https://developer.apple.com/documentation/xctest for more information about using XCTest.

class RunnerTests: XCTestCase {

  func testInitializeReturns() throws {
    try ZakadiSdkPlugin().initialize(isolateEpoch: "epoch")
  }

  func testDisposeThrowsInternal() {
    XCTAssertThrowsError(try ZakadiSdkPlugin().dispose(handle: "handle")) { error in
      XCTAssertEqual((error as? ZakadiPigeonError)?.code, "internal")
    }
  }

}
