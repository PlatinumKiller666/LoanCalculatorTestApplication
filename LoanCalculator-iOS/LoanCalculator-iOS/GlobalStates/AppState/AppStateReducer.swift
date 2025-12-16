//
//  AppStateReducer.swift
//  ReduxDemo
//
//  Created by Kirill Zolotarev on 15.12.2025.
//

import Foundation

extension AppState {
    static let reducer: Reducer<Self> = { state, action in
        AppState(
            activeScreens: ActiveScreensState.reducer(state.activeScreens, action)
        )
    }
}
