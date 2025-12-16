//
//  AppScreenStateReducer.swift
//  LoanCalculator-iOS
//
//  Created by Kirill Zolotarev on 14.12.2025.
//

import Foundation

extension AppScreenState {
    static let reducer: Reducer<Self> = { state, action in
        switch state {
        case .splashScreen: return .splashScreen
        case .loan(let state): return .loan(CalculatorState.reducer(state, action))
        }
    }
}
