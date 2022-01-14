//
//  Post.swift
//  H4X0R
//
//  Created by Mohamed Nasr on 29/11/2021.
//

import Foundation


struct Result: Codable{
    
    var hits : [Posts]
    
}


struct Posts: Codable , Identifiable{

    var title : String
    var url : String?
    var objectID : String

    var id : String {
        return objectID
    }
}

