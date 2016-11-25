//
//  QuotesAPI.swift
//
//
//  Created by Laticia Chance on 11/24/16.
//
//

import Foundation
import Alamofire
import SwiftyJSON


class QuotesAPI {
    
    var quote = String()
    var author = String()
}

extension QuotesAPI {
    func APICall() {
        Alamofire.request("http://quotes.rest/qod").responseJSON { response in

            
//      let jsonObject = response.result.value
            
        
            
            
            let jsonObject = JSON(data: response.data!).dictionaryValue
            guard let quotes = jsonObject["contents"]?["quotes"][0]["quote"].stringValue else {return}
            
            
            
                print(jsonObject)
                print(quotes)
            }
        
        }
}

