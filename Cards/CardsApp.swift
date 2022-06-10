//
//  CardsApp.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/8.
//

import SwiftUI

@main
struct CardsApp: App {
  @StateObject private var viewState = ViewState()
  
  var body: some Scene {
    WindowGroup {
      CardsView()
        .environmentObject(viewState)
    }
  }
}
