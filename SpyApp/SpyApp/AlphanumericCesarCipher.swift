
import Foundation

protocol Extended: Cipher {
    func encode(_ plaintext: String, secret: String) -> String?
    func decrypt(_ encrypted: String, secret: String) -> String?
    
}

struct AlphanumericCesarCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = Int32(secret) else {
            return nil
        }
        var encoded = ""

        for character in plaintext {
            var unicode = character.unicodeScalars.first!.value
            if(97 <= unicode && unicode <= 122){
                unicode = unicode - 32
            };
            
            var shiftedUnicode = Int32(unicode) + shiftBy
            if(97 > shiftedUnicode && shiftedUnicode > 90){
                shiftedUnicode = 46 + shiftBy
            };if(unicode == 90){
                if(shiftBy > 0){
                    shiftedUnicode = 47 + shiftBy
                };if(shiftBy <= 0){
                    shiftedUnicode = 90 + shiftBy
                }
            };if(unicode == 65){
                if(shiftBy <= 0){
                    shiftedUnicode = 58 + shiftBy
                }
            };if(65 > shiftedUnicode && shiftedUnicode > 57){
                shiftedUnicode = 57 + shiftBy
            }
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        

        return encoded
    }
    
    func decrypt(_ encrypted: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var decoded = ""
        
        for character in encrypted {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode - shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decoded = decoded + shiftedCharacter
        }
        return decoded
    }
    
    
}
