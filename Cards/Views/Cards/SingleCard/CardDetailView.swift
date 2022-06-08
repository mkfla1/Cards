//
//  CardDetailView.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/8.
//

import SwiftUI

struct CardDetailView: View {
  @EnvironmentObject var viewState: ViewState
  @State private var cardModal: CardModal?
  
  var body: some View {
    Color.yellow
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

struct CardDetailView_Previews: PreviewProvider {
  static var previews: some View {
    CardDetailView()
      .environmentObject(ViewState())
  }
}
