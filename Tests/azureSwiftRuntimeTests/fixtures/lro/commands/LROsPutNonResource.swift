import Foundation
import azureSwiftRuntime
// PutNonResource long running put request with non resource. This method may poll for completion. Polling can be
// canceled by passing the cancel channel argument. The channel will be used to cancel polling and any outstanding HTTP
// requests.
class LROsPutNonResourceCommand : BaseCommand {
    var sku :  SkuTypeProtocol?

    override init() {
        super.init()
        self.method = "Put"
        self.isLongRunningOperation = true
        self.path = "/lro/putnonresource/202/200"
    }

    override func preCall()  {
        self.body = sku
    }

    override func encodeBody() throws -> Data? {
        return try CoderFactory.encoder(for: .json).encode(sku as! SkuType?)
    }

    public func execute(client: RuntimeClient) throws -> SkuTypeProtocol? {
        return try client.execute(command: self) as! SkuTypeProtocol?
    }
    
    override func returnFunc(data: Data) throws -> Decodable? {
        return try CoderFactory.decoder(for: .json).decode(SkuType?.self, from: data)
    }
    
    public func executeAsync(client: RuntimeClient, completionHandler: @escaping (SkuTypeProtocol?, Error?) -> Void) {
        client.executeAsyncLRO (command: self) {
            (result: SkuType?, error: Error?)  in
            completionHandler(result, error)
        }
    }
}
