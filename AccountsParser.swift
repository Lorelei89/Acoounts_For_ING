//
//  AccountsParser.swift
//  Acoounts_For_ING
//
//  Created by Sabina Buruiana on 1/24/17.
//  Copyright © 2017 sabina. All rights reserved.
//

import Foundation
typealias JSONDictionary = [String: Any]

class AccountsParser {
    func jsonDictionary(with data: Data?) -> JSONDictionary? {
        do {
            if let data = data,
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSONDictionary {
                return json
            }
        } catch {
            print("Couldn't parse JSON. Error: \(error)")
        }
        return nil
    }
    
    func accounts(with data: Data?) -> [Account]? {
        guard let dict = jsonDictionary(with: data) else {
            print("Error: couldn't parse dictionary from data")
            return nil
        }
        
        guard let accountDicts = dict["accounts"] as? [JSONDictionary] else {
            print("Error: couldn't parse items from JSON: \(dict)")
            return nil
        }
        
        return accountDicts.flatMap { account(with: $0) }
    }
    
    func account(with dictionary: JSONDictionary) -> Account? {
        if let accountBalanceInCents = dictionary["accountBalanceInCents"] as? Int,
        let accountCurrency = dictionary["accountCurrency"] as? String,
        let accountId = dictionary["accountId"] as? Int,
        let accountName = dictionary["accountName"] as? String,
        let accountNumber = dictionary["accountNumber"] as? String,
        let accountType = dictionary["accountType"] as? String,
        let alias = dictionary["alias"] as? String,
        let iban = dictionary["iban"] as? String {
            let account = Account(accountBalanceInCents: accountBalanceInCents, accountCurrency: accountCurrency, accountId: accountId, accountName: accountName, accountNumber: accountNumber, accountType: accountType, alias: alias, iban: iban)
            return account
        } else {
            print("Error: couldn't parse JSON dictionary: \(dictionary)")
        }
        return nil
    }
}
