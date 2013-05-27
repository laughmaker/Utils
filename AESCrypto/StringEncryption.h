// http://www.wuleilei.com/

#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

#define kChosenCipherBlockSize	kCCBlockSizeAES128
#define kChosenCipherKeySize	kCCKeySizeAES128
#define kChosenDigestLength		CC_SHA1_DIGEST_LENGTH

@interface StringEncryption : NSObject

+ (NSString *)encryptString:(NSString *)plainSourceStringToEncrypt;
+ (NSString *)decryptString:(NSString *)base64StringToDecrypt;
+ (NSData *)encrypt:(NSData *)plainText;
+ (NSData *)decrypt:(NSData *)plainText;
+ (NSData *)doCipher:(NSData *)plainText context:(CCOperation)encryptOrDecrypt;

@end
