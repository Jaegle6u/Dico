//
//  ContentView.swift
//  Dico
//
//  Created by Killian VAUBOURG on 01/03/2022.
//

import SwiftUI
import Foundation
    
    
struct ContentView: View {
    var body: some View {
        Acceuil()
    }
}

struct Acceuil: View {
    @State private var isShowingDetailView = false
    @State private var mot: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 250.0, height: 250.0, alignment: .top)
                    .clipShape(Circle())
                    .padding(.top, -100)
                    .padding(.bottom, 250)
                
                
                Text("Please enter a noun or a verb")
                    .frame(width: 250.0, height: 50)
                    .padding(.top, -250)
                    
                TextField("Example", text: $mot)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 250.0, height: 75)
                    .disableAutocorrection(false)
                    .padding(.top, -200)
                
                NavigationLink(destination: InfoMot(mot: mot), isActive: $isShowingDetailView) { EmptyView() }
                Button("Find") {
                    isShowingDetailView = true
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color(red: 0, green: 0.22, blue: 0.67))
                .cornerRadius(10)
                
                
                Text("Or")
                    .frame(width: 250.0, height: 50)
                
                
                NavigationLink(destination: InfoMot(mot: mot), isActive: $isShowingDetailView) { EmptyView() }
                Button("Random word"){
                    mot = "Random"
                    isShowingDetailView = true
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color(red: 0, green: 0.75, blue: 0.50))
                .cornerRadius(10)
            }
        }
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

struct InfoMot: View {
    @ObservedObject private var viewModel = ViewModel()
    var mot: String
    
    var body: some View {
        NavigationView {
            VStack{
                List{
                    Text("Word : \(viewModel.word.word.capitalizingFirstLetter())").font(.title)
                    
                    // Définitions de mots
                    ForEach(viewModel.word.results, id: \.self)  {item in
                        Text("Definition").font(.title3)
                        Text(item.definition.capitalizingFirstLetter())
                        
                        if item.synonyms == nil?! {
                        }else{
                            Text("Synonyms").font(.title3)
                        
                            ForEach(item.synonyms!, id: \.self)  {item in
                                Text(item.capitalizingFirstLetter())
                            }
                        }
                        
                        if item.examples == nil?! {
                        }else{
                            Text("Examples").font(.title3)
                            
                            ForEach(item.examples!, id: \.self)  {item in
                                Text(item.capitalizingFirstLetter())
                            }
                        }
                        Text("")
                    }
                }
                
            }.padding(.top,-385)
        }.onAppear {
            viewModel.getWord(searchWord: mot)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
