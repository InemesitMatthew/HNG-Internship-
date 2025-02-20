extension StringExtensions on String {
  // Capitalize the first letter of the string
  String capitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
