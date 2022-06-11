//
//  ColorExtensions.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/11.
//

import SwiftUI

extension Color {
  static let colors: [Color] = [
    .green, .red, .blue, .gray, .yellow, .pink, .orange, .purple
  ]
  
  static func random() -> Color {
    colors.randomElement() ?? .black
  }
}
