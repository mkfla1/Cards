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
  @StateObject private var cardStore = CardStore()
  
  var body: some Scene {
    WindowGroup {
      CardsView()
        .environmentObject(viewState)
        .environmentObject(cardStore)
        .onAppear {
          print(FileManager.documentURL ?? "")
        }
    }
  }
  
}
