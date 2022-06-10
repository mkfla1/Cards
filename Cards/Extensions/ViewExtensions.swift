//
//  ViewExtensions.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/10.
//

import SwiftUI

extension View {
  func resizableView() -> some View {
    return modifier(ResizableView())
  }
}
