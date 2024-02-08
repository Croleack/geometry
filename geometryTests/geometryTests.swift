//
//  geometryTests.swift
//  geometryTests
//
//  Created by Enzhe Gaysina on 08.02.2024.
//

import XCTest
@testable import geometry

final class geometryTests: XCTestCase {
    
    var viewModel: FiguresViewModel!
    
    override func setUpWithError() throws {
	   viewModel = FiguresViewModel()
    }
    
    override func tearDownWithError() throws {
	   viewModel = nil
    }
    
    func testCalculateCircleArea() throws {
	   viewModel.shapeType = 0
	   viewModel.radius = 5.0
	   
	   let area = viewModel.calculateArea()
	   
	   XCTAssertEqual(area, Double.pi * pow(5.0, 2))
    }
    
    func testCalculateTriangleArea() throws {
	   viewModel.shapeType = 1
	   viewModel.sideA = 3.0
	   viewModel.sideB = 4.0
	   viewModel.sideC = 5.0
	   
	   let area = viewModel.calculateArea()
	   

	   XCTAssertEqual(area, 6.0)
    }
    
    func testRightTriangle() throws {
	   viewModel.shapeType = 1
	   viewModel.sideA = 3.0
	   viewModel.sideB = 4.0
	   viewModel.sideC = 5.0
	   
	   let isRightTriangle = viewModel.isRightTriangle()
	   
	   XCTAssertTrue(isRightTriangle)
    }
    
    func testCircleZeroRadius() throws {
	   viewModel.shapeType = 0
	   viewModel.radius = 0.0
	   
	   let area = viewModel.calculateArea()
	   
	   XCTAssertEqual(area, 0.0)
    }
    
    func testTriangleZeroSide() throws {
	   viewModel.shapeType = 1
	   viewModel.sideA = 3.0
	   viewModel.sideB = 0.0
	   viewModel.sideC = 5.0
	   
	   let area = viewModel.calculateArea()
	   
	   XCTAssertTrue(area.isNaN)
    }
}
