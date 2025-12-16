//
//  ActiveScreensStateReducer.swift
//  ReduxDemo
//
//  Created by Kirill Zolotarev on 15.12.2025.
//

import Foundation

extension ActiveScreensState {
    static let reducer: Reducer<Self> = { state, action in
        var screens = state.screens

        // Update visible screens
        if let action = action as? ActiveScreensStateAction {
            switch action {
            case .showScreen(.splashScreen), .dismissScreen(.loan), .dismissScreen(.splashScreen): screens = [.splashScreen]
            case .showScreen(.loan): screens = [.loan(CalculatorState())]
            case .dismissScreen(let screen): screens = screens.filter { $0 != screen }
            }
        }

        // Reduce each screen state
        screens = screens.map { AppScreenState.reducer($0, action) }

        return ActiveScreensState(screens: screens)
    }
}
