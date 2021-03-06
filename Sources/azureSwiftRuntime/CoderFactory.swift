/**
 * Copyright (c) Microsoft Corporation. All rights reserved.
 * Licensed under the MIT License. See License.txt in the project root for
 * license information.
 */

import Foundation

public class CoderFactory {
    public static func encoder(for mimeType: MimeType) throws -> AzureEncoder {
        switch(mimeType) {
            case .json:
                return AzureJSONEncoder()
            case .xml:
                return PropertyListEncoder()
            case .gif, .jpeg, .png:
                return ImageEncoder()
            default:
                throw RuntimeError.general(message: "Decoder for \(mimeType) not found.")
        }
    }
    
    public static func decoder(for mimeType: MimeType) throws -> AzureDecoder {
        switch(mimeType) {
            case .json:
                return AzureJSONDecoder();
            case .xml:
//                let dateFormatter = DateFormatter()
//                dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ssZ"
                let xmlDecoder = XMLDecoder()
//                xmlDecoder.dateDecodingStrategy = .formatted(dateFormatter)
                return xmlDecoder
            default:
                throw RuntimeError.general(message: "Decoder for \(mimeType) not found.")
        }
    }
}

extension XMLDecoder : AzureDecoder {
}

public protocol PageDecoder {
    var isPagedData: Bool { get set }
    var nextLinkName: String? {get set }
    var nextLink: String? { get set }
}

public protocol AzureEncoder {
    func encode<T>(_ value: T?) throws -> Data where T : Encodable
}

public protocol AzureDecoder {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
}

extension AzureJSONEncoder : AzureEncoder {
}

extension PropertyListEncoder : AzureEncoder {
}

extension AzureJSONDecoder : AzureDecoder {
}

public class AzureXMLDecocder : PropertyListDecoder, AzureDecoder, PageDecoder {
    public var isPagedData = false
    public var nextLinkName: String?
    public var nextLink: String?
}

public struct UnknownCodingKey: CodingKey {
    public init?(stringValue: String) { self.stringValue = stringValue }
    public let stringValue: String
    
    public init?(intValue: Int) { return nil }
    public var intValue: Int? { return nil }
    
    public static func decodeStringForKey(decoder: Decoder, keyForDecode: String?) throws -> String? {
        if keyForDecode == nil {
            return nil;
        }
        
        let container = try decoder.container(keyedBy: UnknownCodingKey.self)
        var retVal: String? = nil;
        for key in container.allKeys {
            if key.stringValue != keyForDecode {
                continue;
            }
            
            func decodeUnknownValue<T: Decodable>(_ type: T.Type) -> T? {
                guard let value = try? container.decode(type, forKey: key) else {
                    return nil
                }
                
                return value
            }

            retVal = decodeUnknownValue(String.self)
            break;

        }
        
        return retVal;
    }
}
