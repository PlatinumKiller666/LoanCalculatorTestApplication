//
//  ActiveScreensStateAction.swift
//  ReduxDemo
//
//  Created by Kirill Zolotarev on 15.12.2025.
//

import Foundation

enum AppScreen {
    case splashScreen
    case loan
}

enum ActiveScreensStateAction: Action {
    case showScreen(AppScreen)
    case dismissScreen(AppScreen)
}
