//
//  Tab.swift
//  UI-630
//
//  Created by nyannyan0328 on 2022/08/03.
//

import SwiftUI

struct Tab: Identifiable,Hashable {
    var id = UUID().uuidString
    var tabName : String
    var sampleImage : String
}

var sampleTabs : [Tab] = [

    .init(tabName: "Look Eye", sampleImage: "p1"),
    .init(tabName: "Watch out!", sampleImage: "p2"),
    .init(tabName: "Koarea", sampleImage: "p3"),
    .init(tabName: "In Kyoto", sampleImage: "p4"),


]
