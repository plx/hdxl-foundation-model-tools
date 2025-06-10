import CoreFoundation

extension String {
  
  enum TransliterationError: Error {
    case unableToTransliterate(String, String)
  }
  
  package func applying(
    stringTransform stringTransformDescriptor: StringTransformDescriptor
  ) throws -> String {
    let argumentsAsCFString: CFString = self as CFString
    
    guard let clone = CFStringCreateMutableCopy(
      kCFAllocatorDefault,
      CFStringGetLength(argumentsAsCFString) * 2,
      argumentsAsCFString
    ) else {
      throw TransliterationError.unableToTransliterate(
        self,
        stringTransformDescriptor.label
      )
    }
    
    var fullRange = CFRangeMake(
      0,
      CFStringGetLength(clone)
    )
    
    guard CFStringTransform(
      clone,
      &fullRange,
      stringTransformDescriptor.identifier,
      stringTransformDescriptor.reversed
    ) else {
      throw TransliterationError.unableToTransliterate(
        self,
        stringTransformDescriptor.label
      )
    }
    
    return clone as String
  }
  
}
