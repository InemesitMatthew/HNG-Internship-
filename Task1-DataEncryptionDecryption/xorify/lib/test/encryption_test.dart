import 'package:test/test.dart';
import 'package:xorify/utils/encryption.dart';

void main() {
  group('Encryption and Decryption Tests', () {
    const String plaintext = 'HelloXorify';
    const String key = 'SecretKey';

    test('Encryption should return a non-empty string', () {
      final encrypted = encrypt(plaintext, key);
      expect(encrypted, isNotEmpty);
    });

    test('Decryption should return the original plaintext', () {
      final encrypted = encrypt(plaintext, key);
      final decrypted = decrypt(encrypted, key);
      expect(decrypted, equals(plaintext));
    });

    test('Encryption should be consistent for same input and key', () {
      final encrypted1 = encrypt(plaintext, key);
      final encrypted2 = encrypt(plaintext, key);
      expect(encrypted1, equals(encrypted2));
    });

    test('Different keys should produce different encrypted outputs', () {
      final encrypted1 = encrypt(plaintext, key);
      final encrypted2 = encrypt(plaintext, 'AnotherKey');
      expect(encrypted1, isNot(equals(encrypted2)));
    });
  });
}
