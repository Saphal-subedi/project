List<String> words = [];

double? birthindex, marriageindex, deathindex;
void queryTokenize(String sentence) {
  List<String> birth = [
    "BIRTH",
    "REGISTRATION",
    "JANMA",
    "DARTA",
    "BABY",
    "CHILD",
    "NEWBORN",
    "INFANT",
    "CHILDBIRTH",
    "CERTIFICATE",
    "RECORD"
  ];
  List<String> death = [
    "DEATH",
    "REGISTRATION",
    "MRITYU",
    "DARTA",
    "CERTIFICATE",
    "DEPARTED",
    "PASSINGAWAY",
    "FUNERAL",
    "RECORD",
    "DECEASED",
    "BURIAL"
  ];
  List<String> marriage = [
    "MARRIAGE",
    "REGISTRATION",
    "BIBAHA",
    "DARTA",
    "CERTIFICATE",
    "RECORD",
    "WEDDING",
    "MARITAL",
    "SPOUSAL",
    "MATRIMONY",
    "RELATION"
  ];
  words = [];
  String currentWord = '';

  for (int i = 0; i < sentence.length; i++) {
    String char = sentence[i];

    if (char != ' ') {
      currentWord += char;
    } else {
      if (currentWord.isNotEmpty) {
        words.add(currentWord);
        currentWord = '';
      }
    }
  }

  if (currentWord.isNotEmpty) {
    words.add(currentWord);
  }

  birthindex = birthValue(words, birth);
  deathindex = deathvalue(words, death);
  marriageindex = marriagevalue(words, marriage);
}

double birthValue(List<String> sentence, List<String> birth) {
  int commonItem = 0;
  int totalNumberOfItem;

  for (int i = 0; i < sentence.length; i++) {
    for (int j = 0; j < birth.length; j++) {
      if (sentence[i] == birth[j]) {
        commonItem += 1;
      }
    }
  }

  int a = sentence.length;
  int b = birth.length;

  totalNumberOfItem = a + b - commonItem;

  return (commonItem / totalNumberOfItem);
}

double marriagevalue(List<String> sentence, List<String> marriage) {
  int commonItem = 0;
  int totalNumberOfItem;

  for (int i = 0; i < sentence.length; i++) {
    for (int j = 0; j < marriage.length; j++) {
      if (sentence[i] == marriage[j]) {
        commonItem += 1;
      }
    }
  }

  int a = sentence.length;
  int b = marriage.length;
  totalNumberOfItem = a + b - commonItem;
  return (commonItem / totalNumberOfItem);
}

double deathvalue(List<String> sentence, List<String> death) {
  int commonItem = 0;
  int totalNumberOfItem;

  for (int i = 0; i < sentence.length; i++) {
    for (int j = 0; j < death.length; j++) {
      if (sentence[i] == death[j]) {
        commonItem += 1;
      }
    }
  }

  int a = sentence.length;
  int b = death.length;
  totalNumberOfItem = a + b - commonItem;
  return (commonItem / totalNumberOfItem);
}
