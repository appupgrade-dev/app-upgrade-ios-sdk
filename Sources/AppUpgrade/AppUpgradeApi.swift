import UIKit

public struct AppUpgradeApi {
    public func checkVersion(xApiKey: String, appInfo: AppInfo, handler: @escaping(AppUpgradeResponse?)-> Void) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "appupgrade.dev"
        components.path = "/api/v1/versions/check"
                
        var queryParams = [String : String]()
        queryParams["app_name"] = appInfo.appName
        queryParams["app_version"] = appInfo.appVersion
        queryParams["platform"] = appInfo.platform
        queryParams["environment"] = appInfo.environment

        components.queryItems = queryParams.map {k, v in URLQueryItem(name: k, value: v)}
    
        var request = URLRequest(url: URL(string: components.string!)!)
        
        request.httpMethod = "GET"
        
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "x-api-key": xApiKey
        ]
                        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
            if let error = error {
                debugPrint("App Upgrade Error: \(error)")
                handler(nil)
            }

            if let response = response {
                let nsHTTPResponse = response as! HTTPURLResponse
                let statusCode = nsHTTPResponse.statusCode

                if (statusCode != 200) {
                    debugPrint("App Upgrade Error: \(nsHTTPResponse)")
                    handler(nil)
                }
            }

            if let data = data {
                do {
                    let jsonResponse = try JSONDecoder().decode(AppUpgradeResponse.self, from: data)
                    handler(jsonResponse)
                } catch _ {
                    debugPrint("App Upgrade Error: Invalid response.")
                    handler(nil)
                }
            }
        })
        task.resume()
    }
}
