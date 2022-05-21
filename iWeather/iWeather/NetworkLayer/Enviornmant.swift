//
//  Enviornmant.swift
//  iWeather
//
//  Created by Huned on 21/05/2022.
//

import Foundation

public enum PlistKey {
    case BaseURL
    case APIKey
    
    func value() -> String {
        switch self {
        case .BaseURL:
            return "base_url"
        case .APIKey:
            return "api_key"
        }
    }
}

public struct Environment {
    
    fileprivate var infoDict: [String: Any]  {
        get {
            if let dict = Bundle.main.infoDictionary {
                return dict
            }else {
                fatalError("Plist file not found")
            }
        }
    }
    
    public func configuration(_ key: PlistKey) -> String {
        switch key {
        case .BaseURL:
            return infoDict[PlistKey.BaseURL.value()] as! String
        case .APIKey:
            return infoDict[PlistKey.APIKey.value()] as! String
        }
    }
}
