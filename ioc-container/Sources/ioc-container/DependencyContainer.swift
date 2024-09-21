//
//  DependencyContainer.swift
//
//
//  Created by Andrija Eremić on 4.9.24..
//

import Foundation

enum DependencyContainerError : Error {
	case notRegistered(typeIdentifier: Any.Type)
	case uncompatibleTypes(typeIdentifier: Any.Type, typeImplementation: Any.Type)
}

public final class DependencyContainer {
	private var singletons: [ObjectIdentifier: Any] = [:];

	public func registerAsSingleton<T>(_ interface: T.Type, _ instance: T) {
		singletons[ObjectIdentifier(interface)] = instance
	}
	
	public func resolve<T>(_ interface: T.Type) throws -> T {
		guard let instance = singletons[ObjectIdentifier(interface)] else {
			throw DependencyContainerError
				.notRegistered(typeIdentifier: interface)
		}
		
		guard let result = instance as? T else {
			throw DependencyContainerError
				.uncompatibleTypes(typeIdentifier: interface, typeImplementation: type(of: instance))
		}
		
		return result
	}
	
	public func unregister<T>(_ interface: T.Type) {
		singletons.removeAll()
	}
}
