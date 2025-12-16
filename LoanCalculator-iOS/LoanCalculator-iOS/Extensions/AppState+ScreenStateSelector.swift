//
//  AppState+ScreenStateSelector.swift
//  ReduxDemo
//
//  Created by Kirill Zolotarev on 15.12.2025.
//

import Foundation

extension AppState {
    func screenState<State>(for screen: AppScreen) -> State? {
        return activeScreens.screens
            .compactMap {
                switch ($0, screen) {
                case (.loan(let state), .loan): return state as? State
                default: return nil
                }
            }
            .first
    }
}
