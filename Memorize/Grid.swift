//
//  Grid.swift
//  Memorize
//
//  Created by Jeng-Wei Chen on 19/10/2020.
//  Copyright © 2020 Jeng-Wei Chen. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
//    init(_ items: [Item], viewForItem: (Item) -> ItemView) {
//        self.items = items
//        self.viewForItem = viewForItem
//    }
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
