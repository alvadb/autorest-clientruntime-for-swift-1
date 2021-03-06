// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

// Enum is the test Infrastructure for AutoRest Swagger BAT
import Foundation
import azureSwiftRuntime

struct EnumNamespace {
    // GetNotExpandable get enum value 'red color' from enumeration of 'red color', 'green-color', 'blue_color'.
    public class GetNotExpandableCommand : BaseCommand {
        
        public override init() {
            super.init()
            self.method = "Get"
            self.isLongRunningOperation = false
            self.path = "/string/enum/notExpandable"
        }

        public override func preCall()  {
        }

        override func returnFunc(data: Data) throws -> Decodable? {
            let val = try CoderFactory.decoder(for: .json).decode(String.self, from: data)
            return Colors(rawValue: val)
        }
        
        public func execute(client: RuntimeClient) throws -> Colors? {
            return try client.execute(command: self) as! Colors?
        }
    }

    // GetReferenced get enum value 'red color' from enumeration of 'red color', 'green-color', 'blue_color'.
    public class GetReferencedCommand : BaseCommand {

        public override init() {
            super.init()
            self.method = "Get"
            self.isLongRunningOperation = false
            self.path = "/string/enum/Referenced"
        }

        public override func preCall()  {
        }


        override func returnFunc(data: Data) throws -> Decodable? {
            let val = try CoderFactory.decoder(for: .json).decode(String.self, from: data)
            return  Colors(rawValue: val)
        }
        
        public func execute(client: RuntimeClient) throws -> Colors? {
            return try client.execute(command: self) as! Colors?
        }
    }

    // GetReferencedConstant get value 'green-color' from the constant.
    public class GetReferencedConstantCommand : BaseCommand {
       
        public override init() {
            super.init()
            self.method = "Get"
            self.isLongRunningOperation = false
            self.path = "/string/enum/ReferencedConstant"
        }

        public override func preCall()  {
        }

        override func returnFunc(data: Data) throws -> Decodable? {
            return try CoderFactory.decoder(for: .json).decode(RefColorConstantData.self, from: data)
        }
        
        public func execute(client: RuntimeClient) throws -> RefColorConstantProtocol? {
            return try client.execute(command: self) as! RefColorConstantProtocol?
        }
    }

    // PutNotExpandable sends value 'red color' from enumeration of 'red color', 'green-color', 'blue_color'
    public class PutNotExpandableCommand : BaseCommand {
        public var stringBody :  Colors?

        public override init() {
            super.init()
            self.method = "Put"
            self.isLongRunningOperation = false
            self.path = "/string/enum/notExpandable"
            self.headerParameters = ["Content-Type":"application/json"]
        }

        public override func preCall()  {
            self.body = stringBody
        }

        public override func encodeBody() throws -> Data? {
            return try CoderFactory.encoder(for: .json).encode(stringBody?.rawValue)
        }

        public func execute(client: RuntimeClient) throws -> Decodable? {
            return try client.execute(command: self)
        }
    }

    // PutReferenced sends value 'red color' from enumeration of 'red color', 'green-color', 'blue_color'
    public class PutReferencedCommand : BaseCommand {
        public var enumStringBody :  Colors?

        public override init() {
            super.init()
            self.method = "Put"
            self.isLongRunningOperation = false
            self.path = "/string/enum/Referenced"
            self.headerParameters = ["Content-Type":"application/json"]
        }

        public override func preCall()  {
            self.body = enumStringBody
        }

        public override func encodeBody() throws -> Data? {
            return try CoderFactory.encoder(for: .json).encode(enumStringBody?.rawValue)
        }

        public func execute(client: RuntimeClient) throws -> Decodable? {
            return try client.execute(command: self)
        }
    }

    // PutReferencedConstant sends value 'green-color' from a constant
    public class PutReferencedConstantCommand : BaseCommand {
        public var enumStringBody :  RefColorConstantProtocol?

        public override init() {
            super.init()
            self.method = "Put"
            self.isLongRunningOperation = false
            self.path = "/string/enum/ReferencedConstant"
            self.headerParameters = ["Content-Type":"application/json"]
        }

        public override func preCall()  {
            self.body = enumStringBody
        }

        public override func encodeBody() throws -> Data? {
            return try CoderFactory.encoder(for: .json).encode(enumStringBody as? RefColorConstantData)
        }

        public func execute(client: RuntimeClient) throws -> Decodable? {
            return try client.execute(command: self)
        }
    }
}
