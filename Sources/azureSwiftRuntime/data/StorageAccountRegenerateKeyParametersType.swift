import Foundation
public struct StorageAccountRegenerateKeyParametersType : StorageAccountRegenerateKeyParametersTypeProtocol {
    public var keyName: String?

    enum CodingKeys: String, CodingKey {
        case keyName = "keyName"
    }

  public init() {
  }

  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    keyName = try container.decode(String?.self, forKey: .keyName)
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(keyName, forKey: .keyName)
  }
}