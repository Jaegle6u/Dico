//
//  WordApi.swift
//  Di
import SwiftUI
//import SwiftyJSON
//SWIFT
class ViewModel: ObservableObject {
    
    @Published var word = Word(word: "[WORD UNKNOWN]",
    results: [Result(definition: "[NO DEFINITON AVAILABLE]", partOfSpeech: .noun, synonyms: ["[NO SYNONYM AVAILABLE]"], typeOf: ["",""], usageOf: [""], hasTypes: [""], examples: ["[NO EXAMPLE AVAILABLE]"], memberOf: [""], derivation: [""])],
        syllables: Syllables(count: 0, list: [""]),
        pronunciation: Pronunciation(all: "[NO PRONUNCIATION AVAILABLE]"),
        frequency: 0)

    func getWord(searchWord: String) {
        var url = URL(string: "")
        url = searchWord == "Random" || searchWord == "random" ? URL(string: "https://wordsapiv1.p.rapidapi.com/words/?random=true") : URL(string: "https://wordsapiv1.p.rapidapi.com/words/\(searchWord)")
         
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("wordsapiv1.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.setValue("e3a2df9d7fmshf696ae7fd4ad0bep17be64jsn2341491a3a4b", forHTTPHeaderField: "x-rapidapi-key")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            print(data)
            let result = try? JSONDecoder().decode(Word.self, from: data)
            
            if let result = result {
                DispatchQueue.main.async {
                    self.word = result
                
                    print(result)
                }
            }
        }.resume()
    }
}
