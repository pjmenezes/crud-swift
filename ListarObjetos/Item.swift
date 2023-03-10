//
//  Item.swift
//  ListarObjetos
//
//  Created by pedro on 09/03/23.
//

import Foundation

struct Item: Identifiable, Encodable, Decodable{
    let id = UUID()
    var todo:String
}
