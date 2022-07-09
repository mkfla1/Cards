//
//  Shapes.swift
//  Cards
//
//  Created by shuo zhang on 2022/7/9.
//

import SwiftUI

struct Shapes: View {
  var body: some View {
    let currentShape = Triangle()
    
    VStack {
      currentShape
        .aspectRatio(1, contentMode: .fit)
        .background(Color.yellow)
    }
  }
}

struct Triangle: Shape {
  func path(in rect: CGRect) -> Path {
    let width = rect.width
    let height = rect.height
    var path = Path()
    path.addLines([
      CGPoint(x: width * 0.13, y: height * 0.2),
      CGPoint(x: width * 0.87, y: height * 0.47),
      CGPoint(x: width * 0.4, y: height * 0.93)
    ])
    path.closeSubpath()
    return path
  }
}

struct Shapes_Previews: PreviewProvider {
  static var previews: some View {
    Shapes()
      .previewLayout(.sizeThatFits)
  }
}
