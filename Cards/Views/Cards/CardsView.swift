//
//  CardsView.swift
//  Cards
//
//  Created by shuo zhang on 2022/6/8.
//

import SwiftUI

struct CardsView: View {
  @EnvironmentObject var viewState: ViewState
  
  var body: some View {
    ZStack {
      CardsListView()
      
      if !viewState.showAllCards {
        SingleCardView()
      }
    }
  }
}

struct CardsView_Previews: PreviewProvider {
  static var previews: some View {
    CardsView()
      .environmentObject(ViewState())
  }
}
