//
//  AppState.swift
//  ReduxDemo
//
//  Created by Kirill Zolotarev on 15.12.2025.
//

import Foundation

struct AppState: Codable {
    let activeScreens: ActiveScreensState
}

extension AppState {
    init() {
        activeScreens = ActiveScreensState()
    }
}
