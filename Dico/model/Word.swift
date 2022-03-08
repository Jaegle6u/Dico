import Foundation

// MARK: - Word
struct Word: Decodable {
    let word: String
    let results: [Result]
    let syllables: Syllables
    let pronunciation: Pronunciation
    let frequency: Double
}

// MARK: - Pronunciation
struct Pronunciation: Decodable {
    let all: String
}

// MARK: - Result
struct Result: Decodable, Hashable {
    let definition: String
    let partOfSpeech: PartOfSpeech
    let synonyms: [String]?
    let typeOf: [String]
    let usageOf, hasTypes, examples, memberOf: [String]?
    let derivation: [String]?
}

enum PartOfSpeech: String, Decodable {
    case noun = "noun"
    case verb = "verb"
}

// MARK: - Syllables
struct Syllables: Decodable {
    let count: Int
    let list: [String]
}
