//
//  FilledSliderBackground.swift
//  LoanCalculator-iOS
//
//  Created by Kirill Zolotarev on 14.12.2025.
//

import SwiftUI

struct FilledSliderBackground: View {
	
//	@Binding var offset:Double
	@Binding var offset:Double
	let innerColor:Color = .innerPin
	let outherColor:Color = .outherPin
	let radius = 30.0
	
	var body: some View {
		GeometryReader { geometry in
			
			let diffTemp = offset - radius
			let diff = diffTemp >= 0 ? diffTemp : 0
			let control1x = diff + radius*2/3.0 //y 0
			let control2x = diff + radius*2/3.0*2.0 // y R
			
			let progressHeight = 10.0
			let centerY = 10.0
			let topY = centerY - progressHeight
			let bottomY = centerY + progressHeight
			let arcTop = centerY - radius
			let arcBottom = centerY + radius
			
			let lengthOfDrop = 40
			
			Path { path in
				path.addArc(center: CGPoint(x:progressHeight, y:centerY), radius: progressHeight, startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
				path.addLine(to: CGPoint(x: offset-radius, y: bottomY))
				path.addCurve(to: CGPoint(x: offset+radius, y: arcBottom), control1: CGPoint(x:control1x, y: bottomY), control2: CGPoint(x:control2x, y: arcBottom))
				path.addArc(center: CGPoint(x: offset+radius, y: centerY), radius: radius, startAngle: .degrees(90), endAngle: .degrees(-90), clockwise: true)
				path.addCurve(to: CGPoint(x: offset-radius, y: topY), control1: CGPoint(x:control2x, y: arcTop), control2: CGPoint(x:control1x, y: topY))
			}
			.fill(LinearGradient(colors: [outherColor, innerColor], startPoint: .leading, endPoint: .trailing))
		}
    }
}

#Preview {
	@State var offset:Double = 100.0
	FilledSliderBackground(offset: $offset).frame(height: 20)
}
