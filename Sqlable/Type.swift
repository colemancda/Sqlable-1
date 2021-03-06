//
//  SQLType.swift
//  Sqlable
//
//  Created by Elias Abel on 27/07/2016.
//  Copyright © 2016 Meniny Lab. All rights reserved.
//

/// A SQL type
public enum SQLType: Equatable {
	/// An integer
	case integer
	/// A double
	case real
	/// A string
	case text
	/// A date
	case date
	/// A boolean
	case boolean
	/// A nullable SQL type
	indirect case nullable(SQLType)
}

public func ==(lhs: SQLType, rhs: SQLType) -> Bool {
	switch (lhs, rhs) {
	case (.integer, .integer): fallthrough
	case (.real, .real): fallthrough
	case (.text, .text): fallthrough
	case (.date, .date): fallthrough
	case (.boolean, .boolean): return true
	case (.nullable(let t1), .nullable(let t2)) where t1 == t2: return true
	case _: return false
	}
}

extension SQLType: SQLPrintable {
	public var sqlDescription: String {
		switch self {
		case .integer: return "integer not null"
		case .real: return "double not null"
		case .text: return "text not null"
		case .date: return "timestamp not null"
		case .boolean: return "integer not null"
		case .nullable(.integer): return "integer"
		case .nullable(.real): return "double"
		case .nullable(.text): return "text"
		case .nullable(.date): return "timestamp"
		case .nullable(.boolean): return "integer"
		case .nullable(.nullable(_)): fatalError("Nice try")
		}
	}
}
