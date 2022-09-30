const String defaultLanguageCode = "en";

//Add language code in this list
//visit this to find languageCode for your respective language
//https://developers.google.com/admin-sdk/directory/v1/languages
const List<AppLanguage> appLanguages = [
  //Please add language code here and language name
  AppLanguage(languageCode: "en", languageName: "English"),
  AppLanguage(languageCode: "hi", languageName: "हिन्दी - Hindi"),
  AppLanguage(languageCode: "ur", languageName: "اردو - Urdu"),
];
