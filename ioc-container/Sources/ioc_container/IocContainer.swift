//
//  DependencyContainer.swift
//
//
//  Created by Andrija Eremić on 4.9.24..
//

import Foundation

enum IocContainerError : Error {
	case notRegistered(typeIdentifier: Any.Type)
	case uncompatibleTypes(typeIdentifier: Any.Type, typeImplementation: Any.Type)
}

public final class IocContainer {
	/**
	 IocContainer initialization as global static singleton.
	 */
	static let provider: IocContainer = {
		let instance = IocContainer()
		return instance
	}()

	private var singletons: [ObjectIdentifier: Any] = [:];
	
	private init() {}
	
	public func registerAsSingleton<T>(_ interface: T.Type, _ instance: T) {
		singletons[ObjectIdentifier(interface)] = instance
	}
	
	public func resolve<T>() throws -> T {
		return try resolve(T.self)
	}
	
	public func resolve<T>(_ interface: T.Type) throws -> T {
		guard let instance = singletons[ObjectIdentifier(interface)] else {
			throw IocContainerError
				.notRegistered(typeIdentifier: interface)
		}
		
		guard let result = instance as? T else {
			throw IocContainerError
				.uncompatibleTypes(typeIdentifier: interface, typeImplementation: type(of: instance))
		}
		
		return result
	}
	
	public func unregister<T>(_ interface: T.Type) {
		singletons.removeAll()
	}
}
