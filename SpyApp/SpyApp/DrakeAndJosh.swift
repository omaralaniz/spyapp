import Foundation


protocol cipher3: Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    func decrypt(_ encrypted: String, secret: String) -> String?
    
}

struct DrakeAndJosh: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            
            var word = String(character)
            if unicode%2 == 0
            {
                word = String(UnicodeScalar(UInt8(unicode)))
                word = "drake"
            }else{
                word = String(UnicodeScalar(UInt8(unicode)))
                word = "josh"
            }
            encoded = encoded + word
        }
        return encoded
    }
    
    func decrypt(_ encrypted: String, secret: String) -> String? {
        var decoded = ""
        
        for character in encrypted {
            let unicode = character.unicodeScalars.first!.value
            
            var word = String(character)
            if unicode%2 == 0
            {
                word = String(UnicodeScalar(UInt8(unicode)))
                word = "drake"
            }else{
                word = String(UnicodeScalar(UInt8(unicode)))
                word = "josh"
            }
            decoded = decoded + word
        }
        return decoded
    }
}
