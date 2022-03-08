//
//  ContentView.swift
//  Dico
//
//  Created by Killian VAUBOURG on 01/03/2022.
//

import SwiftUI
import Foundation
//import SwiftyJSON


struct ContentView: View {
 
    
    var body: some View {
        Acceuil()
        }
    
}
struct Acceuil: View {
    @State private var isShowingFindView = false
    @State private var isShowingDetailView = false
    @State private var mot: String = ""
    @State private var word: String = ""
    @ObservedObject private var viewModel = ViewModel()
    
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
                    
                    
                    
                    
                    NavigationLink(destination: InfoMot(wordsDefinition: viewModel.word), isActive: $isShowingDetailView) { EmptyView() }
                    Button("Find") {
                        isShowingDetailView = true
                        
                        viewModel.getWord(searchWord: mot)
                    }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color(red: 0, green: 0.22, blue: 0.67))
                    .cornerRadius(10)
                    
                    Text("Or")
                        .frame(width: 250.0, height: 50)
                    
                    NavigationLink(destination: InfoMot(wordsDefinition: viewModel.word), isActive: $isShowingDetailView) { EmptyView() }
                    .padding(.top, 100)
                    .padding(.bottom, -100)
                    Button("Random word") {
                            isShowingDetailView = true
                        
                            mot = "random"
                            viewModel.getWord(searchWord: mot)
                        }
                    .padding()
                    .foregroundColor(Color.white)
                    .background(Color(red: 0, green: 0.22, blue: 0.67))
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
    
    var wordsDefinition: Word
    
    var body: some View {
        
        NavigationView {
            VStack{
                List{
                    Text("Word : \(wordsDefinition.word.capitalizingFirstLetter())").font(.title)
                    Text("Definitions").font(.title3)
                    
                    // Définitions de mots
                    ForEach(wordsDefinition.results, id: \.self)  {item in
                        Text(item.definition.capitalizingFirstLetter())
                    }
                    
                    // Synonyms de mots
                    Text("Synonyms").font(.title3)
                    ForEach(wordsDefinition.results, id: \.self)  {item in
                        ForEach(item.synonyms!, id: \.self)  {item in
                            Text(item.capitalizingFirstLetter())
                        }
                    }
                }
                
            }.padding(.top,-385)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



