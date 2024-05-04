/// Removes characters enclosed within square brackets from the input string.
///
/// This function iterates through the input string and keeps track of whether
/// it is currently inside square brackets. If it encounters an opening bracket
/// '[', it sets the `insideBrackets` flag to true. If it encounters a closing
/// bracket ']', it sets the flag to false. Characters outside the brackets are
/// appended to the result.
///
/// Example:
/// Input: "[Hello] world [from] Dart"
/// Output: " world Dart"
///
/// Parameters:
/// - [inputString]: The original input string.
///
/// Returns:
/// A new string with characters inside square brackets removed.



  String delchrs(String inputString) {
  StringBuffer result = StringBuffer();
  bool insideBrackets = false;

  for (int i = 0; i < inputString.length; i++) {
    if (inputString[i] == '[') {
      insideBrackets = true;
      continue;
    } else if (inputString[i] == ']') {
      insideBrackets = false;
      continue;
    }

    if (!insideBrackets) {
      result.write(inputString[i]);
    }
  }

  return result.toString();
}