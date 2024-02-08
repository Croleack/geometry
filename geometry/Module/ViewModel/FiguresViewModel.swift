//
//  ViewModel.swift
//  geometry
//
//  Created by Enzhe Gaysina on 08.02.2024.
//

import Foundation

class FiguresViewModel: ObservableObject {
    @Published var shapeType: Int = .zero
    @Published var radius: Double = .zero
    @Published var sideA: Double = .zero
    @Published var sideB: Double = .zero
    @Published var sideC: Double = .zero
    
    func calculateArea() -> Double {
	   if shapeType == 0 {
		  return Circle(radius: radius).calculateArea()
	   } else {
		  return Triangle(sideA: sideA, sideB: sideB, sideC: sideC).calculateArea()
	   }
    }
    
    func isRightTriangle() -> Bool {
	   if shapeType == 1 {
		  return Triangle(sideA: sideA, sideB: sideB, sideC: sideC).isRightTriangle()
	   }
	   return false
    }
}
