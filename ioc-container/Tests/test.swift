//
//  test.swift
//  ioc-container
//
//  Created by Andrija Eremić on 21.9.24..
//

protocol TestProtocol {
	func helloWorld()
}

class TestClass: TestProtocol {
	func helloWorld() {
		print("Hello World!")
	}
}

class App {
	@Injected private var testClass: TestClass
	
	init() {}
	
	func printHelloWorld() {
		testClass.helloWorld()
	}
}

let app = App()
app.printHelloWorld()
