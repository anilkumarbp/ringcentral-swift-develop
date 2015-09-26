import Foundation

class Transaction {
    
    internal var jsonAsArray = [String: AnyObject]()
    internal var jsonAsObject = AnyObject?()
    internal var multipartTransactions = AnyObject?()
    internal var request: NSMutableURLRequest?
    internal var raw = AnyObject?()
    
    private var data: NSData?
    private var response: NSURLResponse?
    private var error: NSError?
    
    init(request: NSMutableURLRequest, status: Int = 200) {
        self.request = request
    }
    
    func getText() -> String {
        if let check = data {
            return check.description
        } else {
            return "No data."
        }
    }
    
    func getRaw() -> Any {
        return raw
    }
    
    func getJson() -> [String: AnyObject] {
        return jsonAsArray
    }
    
    func setData(data: NSData?) {
        self.data = data
    }
    
    func setResponse(response: NSURLResponse?) {
        self.response = response
    }
    
    func setError(error: NSError?) {
        self.error = error
    }
    
    func getMultipart() -> AnyObject? {
        return self.multipartTransactions
    }
    
    func isOK() -> Bool {
        return (self.response as! NSHTTPURLResponse).statusCode / 100 == 2
    }
    
    func getError() -> NSError? {
        return error
    }
    
    func getRequest() -> NSMutableURLRequest? {
        return request
    }
    
    func getResponse() -> NSURLResponse? {
        return response
    }
    
    func isContentType(type: String) -> Bool {
        return false
    }
    
    func getContentType() {
        
    }
    
}