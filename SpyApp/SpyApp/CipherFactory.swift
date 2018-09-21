import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "caesar": CeaserCipher(),
        "alphanumeric caesar": AlphanumericCesarCipher(),
        "drake n' josh": DrakeAndJosh(),
        "unicode": UnicodeCipher()
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
