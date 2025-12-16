//
//  ActiveScreensState.swift
//  ReduxDemo
//
//  Created by Kirill Zolotarev on 15.12.2025.
//

import Foundation

struct ActiveScreensState: Codable {
    let screens: [AppScreenState]
}

extension ActiveScreensState {
    init() {
        screens = [.splashScreen]
    }
}
