//
//  ResizableView.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/9.
//

import SwiftUI

struct ResizableView: View {
  @State private var transform = Transform()
  @State private var prevOffset = CGSize.zero
  @State private var prevRotate = Angle.zero
  @State private var scale: CGFloat = 1.0
  
  private let content = RoundedRectangle(cornerRadius: 30)
  private let color = Color.red
  
  var body: some View {
    let dragGesture = DragGesture()
      .onChanged { val in
        transform.offset = val.translation + prevOffset
      }
      .onEnded { _ in
        prevOffset = transform.offset
      }
    
    let rotationGesture = RotationGesture()
      .onChanged { angle in
        transform.rotation = angle + prevRotate
      }
      .onEnded { _ in
        prevRotate = transform.rotation
      }
    
    let scaleGesture = MagnificationGesture()
      .onChanged { scale in
        self.scale = scale
      }
      .onEnded { _ in
        transform.size.width *= scale
        transform.size.height *= scale
        scale = 1.0
      }
    
    content
      .foregroundColor(color)
      .frame(width: transform.size.width, height: transform.size.height)
      .rotationEffect(transform.rotation)
      .offset(transform.offset)
      .scaleEffect(scale)
      .gesture(dragGesture)
      .gesture(SimultaneousGesture(rotationGesture, scaleGesture))
  }
}

struct ResizableView_Previews: PreviewProvider {
  static var previews: some View {
    ResizableView()
  }
}
