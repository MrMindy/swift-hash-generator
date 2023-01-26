//
//  StringHashExtension.swift
//  HashGenerator
//
//  Created by Gustavo Nunes Pereira on 25/01/23.
//

import Foundation
import CryptoKit

extension String {
    
    var cryptoSHA256: String {
        let digest = SHA256.hash(data: self.data(using: .utf8)!);
        return digest.description;
    }
    
    var cryptoMD5: String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return digest.description;
    }
    
    var cryptoSHA512: String {
        let digest = SHA512.hash(data: self.data(using: .utf8)!)
        return digest.description;
    }
}
