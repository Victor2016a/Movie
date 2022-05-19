//
//  Rest_API_UnitTest.swift
//  Rest API UnitTest
//
//  Created by Victor Vieira on 19/05/22.
//

@testable import Rest_API
import XCTest

class Rest_API_UnitTest: XCTestCase {
  
  var apiService: ApiService?
  
  override func setUp() {
    super.setUp()
    apiService = ApiService()
  }
  
  override func tearDown() {
    apiService = nil
    super.tearDown()
  }
  
}
