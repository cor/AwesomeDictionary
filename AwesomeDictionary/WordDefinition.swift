//
//  WordDefinition.swift
//  AwesomeDictionary
//
//  Created by Cor Pruijs on 29-10-15.
//  Copyright © 2015 Cor Pruijs. All rights reserved.
//

import Foundation

struct WordDefinition {
    let word: String
    let definition: String
    let example: String?
    
    init(word: String, definition: String, example: String?) {
        self.word = word
        self.definition = definition
        self.example = example
    }
}
