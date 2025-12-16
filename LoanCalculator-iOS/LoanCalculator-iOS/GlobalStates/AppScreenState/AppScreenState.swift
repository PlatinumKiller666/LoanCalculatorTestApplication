//
//  AppScreenState.swift
//  LoanCalculator-iOS
//
//  Created by Kirill Zolotarev on 14.12.2025.
//

import Foundation

enum AppScreenState: Codable {
    case splashScreen
    case loan(CalculatorState)
}

extension AppScreenState: CustomStringConvertible {
    var description: String {
        switch self {
        case .splashScreen: return "splashScreen"
        case .loan(let state): return "home(isLoading=\(state.isLoading))"
        }

    }
}

extension AppScreenState {
    static func == (lhs: AppScreenState, rhs: AppScreen) -> Bool {
        switch (lhs, rhs) {
        case (.splashScreen, .splashScreen): return true
        case (.loan, .loan): return true
        case (.splashScreen, _), (.loan, _): return false
        }
    }

    static func == (lhs: AppScreen, rhs: AppScreenState) -> Bool {
        rhs == lhs
    }

    static func != (lhs: AppScreen, rhs: AppScreenState) -> Bool {
        !(lhs == rhs)
    }

    static func != (lhs: AppScreenState, rhs: AppScreen) -> Bool {
        !(lhs == rhs)
    }
}
