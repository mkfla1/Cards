//
//  Shapes.swift
//  Cards
//
//  Created by shuo zhang on 2022/7/9.
//

import SwiftUI

struct Shapes: View {
  var body: some View {
    let currentShape = Heart()
    
    VStack {
      currentShape
        .stroke(
          Color.primary,
          style: StrokeStyle(
            lineWidth: 10,
            lineJoin: .round))
        .aspectRatio(1, contentMode: .fit)
        .padding()
        .background(Color.yellow)
    }
  }
}

extension Shapes {
  static let shapes: [AnyShape] = [
    AnyShape(Circle()),
    AnyShape(Rectangle()),
    AnyShape(Cone()),
    AnyShape(Lens()),
    AnyShape(RoundedRectangle(cornerRadius: 25)),
    AnyShape(Heart()),
  ]
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

struct Cone: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let radius = min(rect.midX, rect.midY)
    path.addArc(
      center: CGPoint(x: rect.midX, y: rect.midY),
      radius: radius,
      startAngle: Angle(degrees: 0),
      endAngle: Angle(degrees: 180),
      clockwise: true)
    path.addLine(to: CGPoint(x: rect.midX, y: rect.height))
    path.addLine(to: CGPoint(x: rect.midX + radius, y: rect.midY))
    path.closeSubpath()
    return path
  }
}

struct Lens: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: 0, y: rect.midY))
    path.addQuadCurve(
      to: CGPoint(x: rect.width, y: rect.midY),
      control: CGPoint(x: rect.midX, y: 0))
    path.addQuadCurve(
      to: CGPoint(x: 0, y: rect.midY),
      control: CGPoint(x: rect.midX, y: rect.height))
    path.closeSubpath()
    return path
  }
}

struct Heart: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let width = rect.width, height = rect.height
    let radius = width / 4
    path.move(to: CGPoint(x: rect.midX, y: height * 0.25))
    path.addArc(
      center: CGPoint(x: width / 4, y: height / 4),
      radius: radius,
      startAngle: Angle(degrees: 0),
      endAngle: Angle(degrees: 180),
      clockwise: true)
    path.addCurve(
      to: CGPoint(x: rect.midX, y: rect.height),
      control1: CGPoint(x: rect.minX, y: rect.midY),
      control2: CGPoint(x: rect.midX * 0.7, y: height * 0.9))
    path.addCurve(
      to: CGPoint(x: rect.maxX, y: rect.height * 0.25),
      control1: CGPoint(x: rect.midX * 1.3, y: rect.height * 0.9),
      control2: CGPoint(x: width, y: rect.midY))
    path.addArc(
      center: CGPoint(x: width * 3 / 4, y: height / 4),
      radius: radius,
      startAngle: Angle(degrees: 0),
      endAngle: Angle(degrees: 180),
      clockwise: true)
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
