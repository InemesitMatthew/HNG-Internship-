// Encrypts a plaintext string using a simple XOR algorithm.
// The result is returned as a hexadecimal string.

/// Takes a plaintext string and a key string, and returns the encrypted
/// result as a hexadecimal string.
/// 
/// Parameters:
/// - `plaintext`: The string to be encrypted.
/// - `key`: The string used as the key for encryption.
/// 
/// Returns:
/// - A hexadecimal string representing the encrypted plaintext.
String encrypt(String plaintext, String key) {
  final buffer = StringBuffer();

  for (int i = 0; i < plaintext.length; i++) {
    // get the utf-16 code unit of the plaintext character.
    int plainChar = plaintext.codeUnitAt(i);
    // Get the UTF-16 code unit of the corresponding key character (repeat key if needed).
    int keyChar = key.codeUnitAt(i % key.length);
    // XOR the plaintext character code with the key character code.
    int encryptedChar = plainChar ^ keyChar;
    // Convert the result to a 2-digit hexadecimal string and add it to the buffer.
    buffer.write(encryptedChar.toRadixString(16).padLeft(2, '0'));
  }
  return buffer.toString();
}


/// Decrypts a hexadecimal string back to the original plaintext using the same XOR algorithm.
String decrypt(String cipherHex, String key) {
  final buffer = StringBuffer();

  // Process the cipher string two characters (one byte) at a time.
  for (int i = 0; i < cipherHex.length; i += 2) {
    // Extract a 2-character hex segment from the cipher string.
    String hexByte = cipherHex.substring(i, i + 2);
    // Convert the hex segment to an integer.
    int encryptedChar = int.parse(hexByte, radix: 16);
    // Get the corresponding key character's code unit.
    int keyChar = key.codeUnitAt((i ~/ 2) % key.length);
    // XOR to retrieve the original character code.
    int decryptedChar = encryptedChar ^ keyChar;
    // Append the character represented by the decrypted code unit.
    buffer.writeCharCode(decryptedChar);
  }
  return buffer.toString();
}