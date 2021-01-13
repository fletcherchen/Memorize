//
//  Array+Indentifiable.swift
//  Memorize
//
//  Created by Jeng-Wei Chen on 13/01/2021.
//  Copyright © 2021 Jeng-Wei Chen. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}
