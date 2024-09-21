//
//  Injected.swift
//  ioc-container
//
//  Created by Andrija Eremić on 21.9.24..
//

@propertyWrapper
public struct Injected<Value> {
	public var wrappedValue: Value {
		try! IocContainer.provider.resolve()
	}
	
	public init() {}
}
