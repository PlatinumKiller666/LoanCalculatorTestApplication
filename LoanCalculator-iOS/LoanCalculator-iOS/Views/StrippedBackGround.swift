//
//  StrippedBackGround.swift
//  LoanCalculator-iOS
//
//  Created by Kirill Zolotarev on 14.12.2025.
//

import SwiftUI

struct StrippedBackGround: View {
	
	let widthStripe:Double
	let spacingStripe:Double
	let diffTopBottom:Double
	let startOffset:Double
	
    var body: some View {
		GeometryReader { geometry in
			
			Path { path in
				let width = geometry.size.width
				let height = geometry.size.height
				
				var currentOffset = startOffset
				while currentOffset < width {
					path.addLines([
						CGPoint(x: currentOffset, y: height),
						CGPoint(x: currentOffset+widthStripe, y: height),
						CGPoint(x: currentOffset+widthStripe+diffTopBottom, y: 0),
						CGPoint(x: currentOffset+diffTopBottom, y: 0)
					])
					currentOffset += spacingStripe + widthStripe
				}
			}
			.fill(.gray)
			.clipShape(Capsule())
//			.allowsHitTesting(false)
		}
	}
}

#Preview {
	VStack{
		StrippedBackGround(widthStripe: 5, spacingStripe: 5, diffTopBottom: 15, startOffset: -5).frame(height: 100.0)
	}
}
