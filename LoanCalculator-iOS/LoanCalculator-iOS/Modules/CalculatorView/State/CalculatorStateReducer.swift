//
//  CalculatorStateReducer.swift
//  LoanCalculator-iOS
//
//  Created by Kirill Zolotarev on 16.12.2025.
//

import Foundation

extension CalculatorState {
	static let reducer: Reducer<Self> = { state, action in
		switch action {
		case CalculatorStateAction.fetchLoanDetails:
			return CalculatorState(isLoading: true, amount: state.amount, period: state.period)
		default:
			return state
		}
	}
}
