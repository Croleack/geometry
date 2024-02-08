//
//  Figures.swift
//  geometry
//
//  Created by Enzhe Gaysina on 08.02.2024.
//

import Foundation

protocol Figure {
    func calculateArea() -> Double
}

struct Circle: Figure {
    var radius: Double
    
    func calculateArea() -> Double {
	   return Double.pi * pow(radius, 2)
    }
}

struct Triangle: Figure {
    var sideA, sideB, sideC: Double
    
    func calculateArea() -> Double {
	   let s = (sideA + sideB + sideC) / 2
	   return sqrt(s * (s - sideA) * (s - sideB) * (s - sideC))
    }
    
    func isRightTriangle() -> Bool {
	   let sides = [sideA, sideB, sideC].sorted(by: <)
	   return sides[0] * sides[0] + sides[1] * sides[1] == sides[2] * sides[2]
    }
}
