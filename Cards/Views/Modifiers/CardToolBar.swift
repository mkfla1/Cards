//
//  CardToolBar.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/11.
//

import SwiftUI

struct CardToolBar: ViewModifier {
  @EnvironmentObject var viewState: ViewState
  @Binding var cardModal: CardModal?
  
  func body(content: Content) -> some View {
    content
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: { viewState.showAllCards.toggle() }) {
            Text("完成")
          }
        }
        
        ToolbarItem(placement: .bottomBar) {
          CardBottomToolbar(cardModal: $cardModal)
        }
      }
  }
}
