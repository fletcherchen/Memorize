//
//  Array+Only.swift
//  Memorize
//
//  Created by Jeng-Wei Chen on 14/01/2021.
//  Copyright © 2021 Jeng-Wei Chen. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
