//
//  PinView.swift
//  LoanCalculator-iOS
//
//  Created by Kirill Zolotarev on 14.12.2025.
//

import SwiftUI

struct PinView: View {
	let innerColor:Color = Color.innerPin
	let outerColor:Color = Color.outherPin
	var body: some View {
		GeometryReader { geometry in
				Circle()
					.fill(
						RadialGradient(gradient: Gradient(colors: [innerColor, outerColor]), center: UnitPoint(x: 0.5, y: 0.4), startRadius: 0, endRadius: min(geometry.size.width+50, geometry.size.height))
					)
					.stroke(outerColor, lineWidth: 2)
		}.allowsHitTesting(false)
	}
}

#Preview {
	VStack{
		PinView().frame(width: 100.0, height: 100.0)
	}
}
