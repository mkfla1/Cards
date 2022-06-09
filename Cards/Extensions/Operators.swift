//
//  Operators.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/9.
//

import SwiftUI

func + (left: CGSize, right: CGSize) -> CGSize {
  CGSize(
    width: left.width + right.width,
    height: left.height + right.height)
}
