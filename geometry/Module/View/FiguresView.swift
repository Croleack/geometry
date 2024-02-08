//
//  ContentView.swift
//  geometry
//
//  Created by Enzhe Gaysina on 08.02.2024.
//

import SwiftUI

struct FiguresView: View {
    @ObservedObject var viewModel: FiguresViewModel = FiguresViewModel()
    @State private var showRightTriangleText = false
    
    var body: some View {
	   
	   VStack(alignment: .leading) {
		  Picker(Constants.pickerName,
			    selection: $viewModel.shapeType) {
			 Text(Constants.circle).tag(0)
			 Text(Constants.triangle).tag(1)
		  }.pickerStyle(SegmentedPickerStyle())
			 .padding()
		  
		  if viewModel.shapeType == .zero {
			 textFieldWithLabel(title: Constants.radius,
							binding: $viewModel.radius
			 )
		  } else {
			 HStack {
				textFieldWithLabel(title: Constants.sideA,
							    binding: $viewModel.sideA
				)
				textFieldWithLabel(title: Constants.sideB,
							    binding: $viewModel.sideB
				)
				textFieldWithLabel(title: Constants.sideC,
							    binding: $viewModel.sideC
				)
			 }
		  }
		  
		  Button(Constants.calculateArea) {
			 viewModel.calculateArea()
			 showRightTriangleText = viewModel.isRightTriangle()
		  }
		  .padding()
		  
		  if showRightTriangleText {
			 Text(Constants.triangleRectangular)
				.foregroundColor(.green)
				.padding()
		  }
		  
		  Text("\(Constants.area) \(viewModel.calculateArea())")
			 .padding()
	   }
	   .padding()
    }
}
//MARK: - func textFieldWithLabel
extension FiguresView {
    private func textFieldWithLabel(title: String, binding: Binding<Double>) -> some View {
	   VStack {
		  TextField(title, text: Binding(get: {
			 "\(binding.wrappedValue)"
		  }, set: {
			 if let value = Double($0), value >= .zero {
				binding.wrappedValue = value
			 } else {}
		  }))
		  .keyboardType(.decimalPad)
		  .padding()
		  
		  Text(title)
			 .font(.caption)
			 .foregroundColor(.gray)
	   }
	   .padding(.leading)
    }
}

// MARK: - Constants

fileprivate extension FiguresView {
    enum Constants {
	   
	   static let pickerName = "Выберите фигуру"
	   static let circle = "Круг"
	   static let triangle = "Треугольник"
	   static let radius = "Радиус"
	   static let sideA = "Сторона A"
	   static let sideB = "Сторона B"
	   static let sideC = "Сторона C"
	   static let calculateArea = "Вычислить площадь"
	   static let area = "Площадь:"
	   static let triangleRectangular = "Треугольник прямоугольный"
    }
}
