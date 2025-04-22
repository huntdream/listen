//
//  ContentView.swift
//  music
//
//  Created by Yu Mao on 4/11/25.
//

import SwiftUI
import SwiftData
import Foundation
import Combine


struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \UserModel.username) private var users: [UserModel]
 
    
    var body: some View {
        VSplitView {
            HSplitView {
                VStack {
                    Nav()
                }
                .frame(minWidth: 200, maxWidth: 200, maxHeight: .infinity)
                .padding()
                
                VStack {
                    MainView()
                }
                .background(Color.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack(spacing: 0) {
                VStack {
                    PlayerView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
            }
            .frame(height: 48)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
           
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(PlayerState())
}
