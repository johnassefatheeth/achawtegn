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