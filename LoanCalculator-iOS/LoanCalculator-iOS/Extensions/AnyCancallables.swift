//
//  AnyCancallables.swift
//  LoanCalculator-iOS
//
//  Created by Kirill Zolotarev on 14.12.2025.
//

import Combine
import Foundation

extension AnyCancellable {
	func store(in dictionary: inout [UUID: AnyCancellable], key: UUID) {
		dictionary[key] = self
	}
}
