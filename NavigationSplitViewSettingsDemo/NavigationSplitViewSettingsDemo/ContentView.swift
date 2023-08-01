//
//  ContentView.swift
//  NavigationSplitViewSettingsDemo
//
//  Created by HIROKI IKEUCHI on 2023/08/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(.blue)
                .frame(width: 100, height: 100)
                .shadow(color: .black, radius: 10, x: 0, y: 10)
                .padding(.bottom, 20)
            Text("このあのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。")
                .frame(width: 200)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
