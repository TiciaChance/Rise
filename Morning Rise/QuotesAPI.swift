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
    
    func APICall() {
        Alamofire.request("http://quotes.rest/qod").responseJSON { response in
            
            let jsonObject = JSON(data: response.data!).dictionaryValue
            
            self.quote = (jsonObject["contents"]?["quotes"][0]["quote"].stringValue)!
            self.author = (jsonObject["contents"]?["quotes"][0]["author"].stringValue)!
            
            if self.author == "" {
                self.author = "Unknown"
            }
            
        }
        
    }
}

