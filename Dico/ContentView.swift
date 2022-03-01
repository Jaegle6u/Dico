//
//  ContentView.swift
//  Dico
//
//  Created by Loic Jaegle on 01/03/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("logo").resizable()
        Button("Chercher un mot"){
            print("lol")
        }.buttonStyle(.bordered)
        Button("Mot aléatoire"){
            print("lol2")
        }.buttonStyle(.bordered)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
