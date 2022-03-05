//
//  WordApi.swift
//  Di
import SwiftUI
import SwiftyJSON

class ViewModel: ObservableObject {


    @Published var words: [Word] = []
    
    
    func getData(searchWord: String) {
        
        var wordsTemp: [Word] = []
        
        guard let url = URL(string: "https://wordsapiv1.p.rapidapi.com/words/\(searchWord)") else {
            fatalError("Invalid URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("wordsapiv1.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.setValue("e3a2df9d7fmshf696ae7fd4ad0bep17be64jsn2341491a3a4b", forHTTPHeaderField: "x-rapidapi-key")
        
        let task = URLSession.shared.dataTask(with: request){ [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            let dataJSON = JSON(data)
            
            let wordToComplete = Word()
            wordToComplete.word = dataJSON["word"].stringValue
            
            for item in dataJSON["results"].arrayValue {
                
                
                wordToComplete.example = item["examples"].arrayValue
               
                
                wordsTemp.append(wordToComplete)
            }
            
            self?.words = wordsTemp
            
            
            
        }
        task.resume()
    }
}
