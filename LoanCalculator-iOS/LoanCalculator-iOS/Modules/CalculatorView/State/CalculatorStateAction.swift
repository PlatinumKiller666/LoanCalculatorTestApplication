//
//  CalculatorStateAction.swift
//  LoanCalculator-iOS
//
//  Created by Kirill Zolotarev on 14.12.2025.
//

import Foundation

enum CalculatorStateAction: Action {
	case fetchLoanDetails(Int, Int)
	case didResiveLoanDetails(LoadnDetails)
	case setAmount(Int)
	case setPeriod(Int)
}
