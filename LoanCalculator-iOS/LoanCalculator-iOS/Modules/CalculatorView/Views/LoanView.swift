//
//  LoanView.swift
//  LoanCalculator-iOS
//
//  Created by Kirill Zolotarev on 16.12.2025.
//

import SwiftUI

struct LoanView: View {
	@EnvironmentObject var store: Store<AppState>
	var state: CalculatorState? { store.state.screenState(for: .loan) }
	
	@State var amount: Double = 0.0
	@State var period: Double = 0.0
	
	
	
	@ViewBuilder
	var checkLoanButton: some View {
		Button(action: {
			store.dispatch(CalculatorStateAction.fetchLoanDetails(Int(amount), Int(period)))
			return
		}, label: {
			ZStack{
				Rectangle().clipShape(Capsule()).background(.red)
				Text("Take loan")
			}
		})
	}
	
	@ViewBuilder
	var sliders: some View {
			SliderViewC(value: $amount)
			SliderViewC(title: "How Long?", minValue: 1, maxValue: 28, steps:[1,7,14,28], value: $period)
	}
	
	
	var body: some View {
		VStack{
			sliders
			checkLoanButton
		}
	}
}

#Preview {
	LoanView()
}
