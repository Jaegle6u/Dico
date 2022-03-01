//
//  ContentView.swift
//  Dico
//
//  Created by Killian VAUBOURG on 01/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingDetailView = false
    @State private var isShowingDetailView2 = false
    
    var body: some View {
    NavigationView {
                VStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 250.0, height: 250.0, alignment: .top)
                        .clipShape(Circle())
                        .padding(.bottom, 150)
                    
                    NavigationLink(destination: Recherche(), isActive: $isShowingDetailView) { EmptyView() }
                    Button("Chercher un mot") {
                            isShowingDetailView = true
                        }
                        .padding()
                       .foregroundColor(Color.white)
                       .background(Color(red: 0, green: 0.1, blue: 0.6))
                       .cornerRadius(10)
                    
                    NavigationLink(destination: InfoMot(), isActive: $isShowingDetailView2) { EmptyView() }
                    .padding(.top)
                    Button("Mot aléatoire") {
                            isShowingDetailView2 = true
                        }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color(red: 0, green: 0.1, blue: 0.6))
                    .cornerRadius(10)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .accentColor(Color.black)
                .background(Color.gray)
    }
                
    }
    
}


struct Recherche: View {
    var body: some View {
        Text("This is the detail view 1")
    }
}
    
struct InfoMot: View {
    var body: some View {
        Text("This is the detail view 2")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
