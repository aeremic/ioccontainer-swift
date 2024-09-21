//
//  Test.swift
//  ioc-container
//
//  Created by Andrija Eremić on 21.9.24..
//

import Testing
@testable import ioc_container

protocol IocTestProtocol {
	func helloWorld() -> String
}

class IocTestClass : IocTestProtocol {
	func helloWorld() -> String {
		return "Hello World!"
	}
}

class Test {
    @Test func <#test function name#>() async throws {
		@Injected var testClass: IocTestClass
		
		var testHelloWorld: String = ""
		testHelloWorld = testClass.helloWorld()
		
		#expect(testHelloWorld == "Hello World!")
    }
}
