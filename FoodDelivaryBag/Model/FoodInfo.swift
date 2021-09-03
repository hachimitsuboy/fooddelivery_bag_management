//
//  FoodInfo.swift
//  FoodDelivaryBag
//
//  Created by Nagae on 2021/05/27.
//

import Foundation

struct FoodInfo: Codable {
    
    var pick = String()
    var drop = String()
    var time = String()
    var company = String()
    var memo = String()
    
    init(pick : String , drop : String , time : String, company: String, memo: String){
        
        self.pick = pick
        self.drop = drop
        self.time = time
        self.company = company
        self.memo = memo
    
    }

    
}
