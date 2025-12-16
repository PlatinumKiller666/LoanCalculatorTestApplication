//
//  SliderView.swift
//  LoanCalculator-iOS
//
//  Created by Kirill Zolotarev on 14.12.2025.
//

import SwiftUI


class CurrentFormatter: NumberFormatter, @unchecked Sendable {
	override init() {
		super.init()
		self.usesGroupingSeparator = true
		self.groupingSeparator = " "
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

struct SliderViewC: View {
	//Stripes
	let widthStripe = 5.0
	let spacingStripe = 5.0
	let diffTopBottom = 15.0
	
	var title = "How much?"
	var minValue = 5000.0
	var maxValue = 2_000_000.0
	var formatter = CurrentFormatter()
	var steps:[Int]? = nil
	@State var current = 0.0
	@State var percentage = 0.0
	@State var pinOffset = 0.0
	@State var loanSize = 0.0
	@Binding var value:Double
	
	
    var body: some View {
		GeometryReader{geometry in
			VStack{
				HStack{
					Text(title)
					Spacer()
					Text(formatter.string(for: loanSize) ?? "error formating")
				}
				Text(title)
				ZStack{
					StrippedBackGround(widthStripe: 5, spacingStripe: 5, diffTopBottom: 15, startOffset: -5)
						.frame(height: 20)
					FilledSliderBackground(offset: $pinOffset)
						.frame(height: 20)
					PinView().offset(x:pinOffset)
						.frame(height: 60)
				}
//				.frame(height: 38)
					.gesture(DragGesture(minimumDistance: 0)
						.onChanged({ value in
							self.current = value.location.x-30
							self.pinOffset = min(max(30, value.location.x), geometry.size.width-30)-30
							
							if let steps = steps {
								let count = steps.count
								let index = Int(((pinOffset) / (geometry.size.width-60))*Double(count))
								
								let fixedIndex = min(max(0, index),count-1)
								self.loanSize = Double(steps[fixedIndex])
								return
							}
							
							self.percentage = Double(min(max(0, Float(((pinOffset) / (geometry.size.width-60)) * 100)), 100))
							self.loanSize = (maxValue-minValue)*self.percentage/100.0 + minValue
//							self.loanSize = Int(minValue + (maxValue-minValue)*self.percentage/100.0)
						}))
					.animation(Animation.default.speed(2), value: pinOffset)
				
				HStack{
					Text(formatter.string(for: minValue) ?? "error formating")
					Spacer()
					Text(formatter.string(for: maxValue) ?? "error formating")
				}
			}
		}
	}
}




#Preview {
	
	struct Preview: View {
		@State var amount:Double = 0.0
		@State var period:Double = 0.0
	 var body: some View {
		 VStack{
			 SliderViewC(value: $amount).padding(10)
			 SliderViewC(minValue: 1, maxValue: 28, steps:[1,7,14,28], value: $period).padding(10)
		 }
	 }
 }

 return Preview()
}
