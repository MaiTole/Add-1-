//
//  String.swift
//  Add 1
//
//  Created by Maithili Tole on 3/6/20.
//  Copyright (c) 2020 Maithili Tole. All rights reserved.
//

import Foundation

extension String
{
 static func randomNumber(length: Int) -> String
    
 {
    var result = ""
    
    for _ in 0..<length {
    
        let digit = arc4random_uniform(10)
        
        result += "\(digit)"
    
    }
    return result
}

func integer(at n: Int) -> Int
{
       //let index = self[self.startIndex.advancedBy(n)]
       //let index = self.Index(self.startIndex, offsetBy: n)
    let index = advance(self.startIndex, n)

   // if index % 1 == 0 {
   // return 0
   // } else {
    return String(self[index]).toInt()!
    }
}
