//
//  CalculatorState.swift
//  LoanCalculator-iOS
//
//  Created by Kirill Zolotarev on 16.12.2025.
//

import Foundation

struct CalculatorState: Codable {
	let isLoading: Bool
	let amount: Int
	let period: Int
}

extension CalculatorState {
	init() {
		isLoading = false
		amount = 0
		period = 0
	}
}
