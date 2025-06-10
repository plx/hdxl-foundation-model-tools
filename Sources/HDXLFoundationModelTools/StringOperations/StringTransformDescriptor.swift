import CoreFoundation

package struct StringTransformDescriptor {
  
  package var identifier: CFString
  package var label: String
  package var reversed: Bool
  
  package init(identifier: CFString, label: String, reversed: Bool) {
    self.identifier = identifier
    self.label = label
    self.reversed = reversed
  }
  
}

extension StringTransformDescriptor: @unchecked Sendable { }
extension StringTransformDescriptor: Equatable { }
extension StringTransformDescriptor: Hashable { }

extension StringTransformDescriptor: Identifiable {
  package typealias ID = String
  
  package var id: ID { identifier as String }
}
