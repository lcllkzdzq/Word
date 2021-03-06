// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: Account.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct AccountInfo {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var uuid: String = String()

  var username: String = String()

  var password: String = String()

  var registerDate: String = String()

  var lastSignInDate: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

extension AccountInfo: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = "AccountInfo"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "uuid"),
    2: .same(proto: "username"),
    3: .same(proto: "password"),
    4: .same(proto: "registerDate"),
    5: .same(proto: "lastSignInDate"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.uuid)
      case 2: try decoder.decodeSingularStringField(value: &self.username)
      case 3: try decoder.decodeSingularStringField(value: &self.password)
      case 4: try decoder.decodeSingularStringField(value: &self.registerDate)
      case 5: try decoder.decodeSingularStringField(value: &self.lastSignInDate)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.uuid.isEmpty {
      try visitor.visitSingularStringField(value: self.uuid, fieldNumber: 1)
    }
    if !self.username.isEmpty {
      try visitor.visitSingularStringField(value: self.username, fieldNumber: 2)
    }
    if !self.password.isEmpty {
      try visitor.visitSingularStringField(value: self.password, fieldNumber: 3)
    }
    if !self.registerDate.isEmpty {
      try visitor.visitSingularStringField(value: self.registerDate, fieldNumber: 4)
    }
    if !self.lastSignInDate.isEmpty {
      try visitor.visitSingularStringField(value: self.lastSignInDate, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  func _protobuf_generated_isEqualTo(other: AccountInfo) -> Bool {
    if self.uuid != other.uuid {return false}
    if self.username != other.username {return false}
    if self.password != other.password {return false}
    if self.registerDate != other.registerDate {return false}
    if self.lastSignInDate != other.lastSignInDate {return false}
    if unknownFields != other.unknownFields {return false}
    return true
  }
}
