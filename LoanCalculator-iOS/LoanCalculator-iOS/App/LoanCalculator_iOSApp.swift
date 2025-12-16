//
//  LoanCalculator_iOSApp.swift
//  LoanCalculator-iOS
//
//  Created by Kirill Zolotarev on 14.12.2025.
//

import SwiftUI

let store = Store(
	initial: AppState(),
	reducer: AppState.reducer,
	middlewares: []
)

struct AppView: View {
	@EnvironmentObject var store: Store<AppState>

	var body: some View {
		if store.state.screenState(for: .loan) as LoanView? != nil {
			NavigationView {
				LoanView()
			}
			.navigationViewStyle(.stack)
		} else {
			SplashView()
		}
	}
}

@main
struct LoanCalculator_iOSApp: App {
    var body: some Scene {
		return WindowGroup {
			AppView()
			.environmentObject(store)
		}
	}
}
