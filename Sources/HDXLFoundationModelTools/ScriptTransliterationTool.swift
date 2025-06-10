import FoundationModels
import CoreFoundation

public struct ScriptTransliterationTool: Tool {
  
  public let transliterationOperation: ScriptTransliterationOperation
  
  public init(transliterationOperation: ScriptTransliterationOperation) {
    self.transliterationOperation = transliterationOperation
  }
  
  public typealias Arguments = String
  
  public var name: String {
    // TODO: "unique name" => should we inject a prefix like `com.whatever` just for uniqueness?
    // or does it just have to be unique in this context
    transliterationOperation.suggestedToolName
  }
  
  public var description: String {
    """
    Converts a word in \(transliterationOperation.sourceScript) to equivalent in \(transliterationOperation.destinationScript).
    """
    
    // TODO: give `ScriptTransliterationOperation` a way to supply example inputs-and-outputs that can be included used here
    // TODO: give `ScriptTransliterationOperation` a property to find the (optional) reverse, and mention it here.
  }

  public func call(arguments: Arguments) async throws -> ToolOutput {
    guard !arguments.isEmpty else {
      return ToolOutput("")
    }
    
    return ToolOutput(
      try arguments.applying(stringTransform: transliterationOperation.stringTransformDescriptor)
    )
  }
  
}
