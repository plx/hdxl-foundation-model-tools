import CoreFoundation

public enum ScriptTransliterationOperation {
  
  public enum Script: String {
    case hiragana
    case katakana
    case latin
    case hangul
    case arabic
    case mandarin
    case hebrew
    case cyrillic
    case thai
    case greek
  }
  
  case katakanaToHiragana
  case hiraganaToKatakana
  case hiraganaToRomaji
  case romajiToHiragana
  case katakanaToRomaji
  case romajiToKatakana
  case mandarinToLatin
  case hangulToLatin
  case latinToHangul
  case arabicToLatin
  case latinToArabic
  case hebrewToLatin
  case latinToHebrew
  case cyrillicToLatin
  case latinToCyrillic
  case thaiToLatin
  case latinToThai
  case greekToLatin
  case latinToGreek
  
  var sourceScript: Script {
    switch self {
    case .katakanaToHiragana:
      .katakana
    case .hiraganaToKatakana:
        .hiragana
    case .hiraganaToRomaji:
      .hiragana
    case .romajiToHiragana:
      .latin
    case .katakanaToRomaji:
      .katakana
    case .romajiToKatakana:
      .latin
    case .mandarinToLatin:
      .mandarin
    case .hangulToLatin:
      .hangul
    case .latinToHangul:
      .latin
    case .arabicToLatin:
      .arabic
    case .latinToArabic:
      .latin
    case .hebrewToLatin:
      .hebrew
    case .latinToHebrew:
      .latin
    case .cyrillicToLatin:
      .cyrillic
    case .latinToCyrillic:
      .latin
    case .thaiToLatin:
      .thai
    case .latinToThai:
      .latin
    case .greekToLatin:
      .greek
    case .latinToGreek:
      .latin
    }
  }

  var destinationScript: Script {
    switch self {
    case .katakanaToHiragana:
      .hiragana
    case .hiraganaToKatakana:
      .katakana
    case .hiraganaToRomaji:
      .latin
    case .romajiToHiragana:
      .hiragana
    case .katakanaToRomaji:
      .latin
    case .romajiToKatakana:
      .katakana
    case .mandarinToLatin:
      .latin
    case .hangulToLatin:
      .latin
    case .latinToHangul:
      .hangul
    case .arabicToLatin:
      .latin
    case .latinToArabic:
      .arabic
    case .hebrewToLatin:
      .latin
    case .latinToHebrew:
      .hebrew
    case .cyrillicToLatin:
      .latin
    case .latinToCyrillic:
      .cyrillic
    case .thaiToLatin:
      .latin
    case .latinToThai:
      .thai
    case .greekToLatin:
      .latin
    case .latinToGreek:
      .greek
    }
  }
  

  var suggestedToolName: String {
    "transliterate_\(sourceScript)_to_\(destinationScript)"
  }
  
  var sourceToDestinationDescription: String {
    "\(sourceScript)-to-\(destinationScript)"
  }

}

extension ScriptTransliterationOperation: Sendable { }
extension ScriptTransliterationOperation: Equatable { }
extension ScriptTransliterationOperation: Hashable { }
extension ScriptTransliterationOperation: CaseIterable { }

extension ScriptTransliterationOperation: CustomStringConvertible {
  public var description: String {
    sourceToDestinationDescription
  }
}

extension ScriptTransliterationOperation: CustomDebugStringConvertible {
  public var debugDescription: String {
    switch self {
    case .katakanaToHiragana:
      ".katakanaToHiragana"
    case .hiraganaToKatakana:
      ".hiraganaToKatakana"
    case .hiraganaToRomaji:
      ".hiraganaToRomaji"
    case .romajiToHiragana:
      ".romajiToHiragana"
    case .katakanaToRomaji:
      ".katakanaToRomaji"
    case .romajiToKatakana:
      ".romajiToKatakana"
    case .mandarinToLatin:
      ".mandarinToLatin"
    case .hangulToLatin:
      ".hangulToLatin"
    case .latinToHangul:
      ".latinToHangul"
    case .arabicToLatin:
      ".arabicToLatin"
    case .latinToArabic:
      ".latinToArabic"
    case .hebrewToLatin:
      ".hebrewToLatin"
    case .latinToHebrew:
      ".hebrewToLatin"
    case .cyrillicToLatin:
      ".cyrillicToLatin"
    case .latinToCyrillic:
      ".latinToCyrillic"
    case .thaiToLatin:
      ".thaiToLatin"
    case .latinToThai:
      ".latinToThai"
    case .greekToLatin:
      ".greekToLatin"
    case .latinToGreek:
      ".latinToGreek"
    }
  }
}

extension ScriptTransliterationOperation: StringTransformDescriptorConvertible {
  
  package var transformInformation: (CFString, Bool) {
    switch self {
    case .katakanaToHiragana:
      (kCFStringTransformHiraganaKatakana, true)
    case .hiraganaToKatakana:
      (kCFStringTransformHiraganaKatakana, false)
    case .hiraganaToRomaji:
      (kCFStringTransformLatinHiragana, true)
    case .romajiToHiragana:
      (kCFStringTransformLatinHiragana, false)
    case .katakanaToRomaji:
      (kCFStringTransformLatinKatakana, true)
    case .romajiToKatakana:
      (kCFStringTransformLatinKatakana, false)
    case .mandarinToLatin:
      (kCFStringTransformMandarinLatin, false)
    case .hangulToLatin:
      (kCFStringTransformLatinHangul, true)
    case .latinToHangul:
      (kCFStringTransformLatinHangul, false)
    case .arabicToLatin:
      (kCFStringTransformLatinArabic, true)
    case .latinToArabic:
      (kCFStringTransformLatinArabic, false)
    case .hebrewToLatin:
      (kCFStringTransformLatinHebrew, true)
    case .latinToHebrew:
      (kCFStringTransformLatinHebrew, false)
    case .cyrillicToLatin:
      (kCFStringTransformLatinCyrillic, true)
    case .latinToCyrillic:
      (kCFStringTransformLatinCyrillic, false)
    case .thaiToLatin:
      (kCFStringTransformLatinThai, true)
    case .latinToThai:
      (kCFStringTransformLatinThai, false)
    case .greekToLatin:
      (kCFStringTransformLatinGreek, true)
    case .latinToGreek:
      (kCFStringTransformLatinGreek, false)
    }
  }
  
  package var stringTransformDescriptor: StringTransformDescriptor {
    let (transformID, reversed) = transformInformation
    
    return StringTransformDescriptor(
      identifier: transformID,
      label: sourceToDestinationDescription,
      reversed: reversed
    )
  }
}
