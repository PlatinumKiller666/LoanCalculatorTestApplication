//
//  LoanDetails.swift
//  LoanCalculator-iOS
//
//  Created by Kirill Zolotarev on 14.12.2025.
//

struct LoadnDetails: Codable {
	var loanSize: Int
	var dayLenght: Int
	let loanTotalPrice: Int
}

extension LoadnDetails: CustomStringConvertible {
	var description: String { "Loand Details" }
}
