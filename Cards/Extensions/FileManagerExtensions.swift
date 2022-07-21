//
//  FileManagerExtensions.swift
//  Cards
//
//  Created by shuo zhang on 2022/7/21.
//

import Foundation

extension FileManager {
  static var documentURL: URL? {
    Self.default.urls(
      for: .documentDirectory,
      in: .userDomainMask).first
  }
}
