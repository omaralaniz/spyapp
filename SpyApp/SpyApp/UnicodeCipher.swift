import Foundation


protocol cipher4: Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    func decrypt(_ encrypted: String, secret: String) -> String?
    
}

struct UnicodeCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let numcharacter = String(unicode)
            encoded = encoded + numcharacter
        }
        return encoded
    }
    
    func decrypt(_ encrypted: String, secret: String) -> String? {
        var decoded = ""
        
        for character in encrypted {
            let encrypted = character.unicodeScalars.first!.value
            let normalharacter = String(UnicodeScalar(UInt8(encrypted)))
            decoded = decoded + normalharacter
        }
        return decoded
    }
}
