//
//  NetworkServices.swift
//  Acoounts_For_ING
//
//  Created by sabina on 19/01/17.
//  Copyright © 2017 sabina. All rights reserved.
//

import Foundation
class NetworkService
{
static func parseJSONFromData(_ jsonData: Data?) -> [String : AnyObject]?
{
    if let data = jsonData {
        do {
            let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String : AnyObject]
            return jsonDictionary
            
        } catch let error as NSError {
            print("error processing json data: \(error.localizedDescription)")
        }
    }
    
    return nil
}
}
