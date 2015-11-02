//
//  Extensions.swift
//  AwesomeDictionary
//
//  Created by Cor Pruijs on 30-10-15.
//  Copyright © 2015 Cor Pruijs. All rights reserved.
//

import UIKit

extension UILabel {
    func allowMultipleLines() {
        self.lineBreakMode = .ByWordWrapping
        self.numberOfLines = 0
    }
}