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
  @StateObject private var cardStore = CardStore(defaultData: true)
  
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
  
  init() {
    Team.load()
  }
  
  struct Team: Codable {
    let names: [String]
    let count: Int
    
    static func save() {
      do {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        let data = try encoder.encode(teamData)
        
        if let url = FileManager.documentURL?
          .appendingPathComponent("TeamData") {
          try data.write(to: url)
        }
      } catch {
        print(error.localizedDescription)
      }
    }
    
    static func load() {
      guard let url = FileManager.documentURL?
        .appendingPathComponent("TeamData") else {
        return
      }
      
      do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let team = try decoder.decode(Team.self, from: data)
        print(team)
      } catch {
        print(error.localizedDescription)
      }
    }
  }
  
  static let teamData = Team(
    names: ["A", "B", "C", "D", "E"],
    count: 5)
}
