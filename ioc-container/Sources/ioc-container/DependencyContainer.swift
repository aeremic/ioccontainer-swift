//
//  DependencyContainer.swift
//
//
//  Created by Andrija Eremić on 4.9.24..
//

import Foundation

public final class DependencyContainer {
	private var singletons: [ObjectIdentifier: Any] = [:];

	public func registerAsSingleton<T>(_ interface: T.Type, _ instance: T) {
		singletons[ObjectIdentifier(interface)] = instance
	}
}
