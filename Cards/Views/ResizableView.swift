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
    
    content
      .foregroundColor(color)
      .frame(width: transform.size.width, height: transform.size.height)
      .offset(transform.offset)
      .gesture(dragGesture)
  }
}

struct ResizableView_Previews: PreviewProvider {
  static var previews: some View {
    ResizableView()
  }
}
