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
  
  var content: some View {
    ZStack {
      Group {
        Capsule()
          .foregroundColor(.yellow)
        Text("Resize Me!")
          .bold()
          .font(.system(size: 500))
          .minimumScaleFactor(0.01)
          .lineLimit(1)
      }
      .resizableView()
      Circle()
        .resizableView()
        .offset(CGSize(width: 50, height: 200))
    }
  }
  
  var body: some View {
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

struct CardDetailView_Previews: PreviewProvider {
  static var previews: some View {
    CardDetailView()
      .environmentObject(ViewState())
  }
}
