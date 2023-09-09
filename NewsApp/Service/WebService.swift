import UIKit

//structlarin icerisinde parametre isimleri newsapiden donen response icerisindekiler ile ayni
struct NewsApiResponse: Codable {
    var status: String
    var totalResults: Int
    var articles: [Article]
}

struct Article: Codable {
    var author: String
    var title: String
    var description: String
    var url: String
    var publishedAt: String
    var content: String
    var urlToImage: String
}
                    
class WebService: NSObject, URLSessionDelegate {
    //Class icerisinde static tanimlanan degerleri Constant altinda toparladim
    enum Constant {
        static let host = "newsapi.org"
        static let requestURL = "https://newsapi.org/v2/everything?q=Apple&from=2022-11-01&sortBy=popularity&apiKey=f4f5d9992aa44ed38f5f33a3986ec88c&pageSize=10"
        //pageSize sayisina gore article donuyor. Burada 10 yaptim 10 tane article donuyor.
    }
   
    private lazy var session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue.main)
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
        if challenge.protectionSpace.host == WebService.Constant.host {
            completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
        } else {
            completionHandler(.performDefaultHandling, nil)
        }
    }
    
    //failure closure ekledim.Fail olmasi durumudna controllerin haberi olmasi icin. (Fail olunca view controller icerisinde alert gosterilebilir)
    func downloadNews(success: @escaping ([Article]) -> (), failure: @escaping (Error?) -> ()) {
        var request = URLRequest(url: URL(string: WebService.Constant.requestURL)!)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let data = data,
               let newsReponse = try? JSONDecoder().decode(NewsApiResponse.self, from: data) {
                success(newsReponse.articles)
            } else {
                failure(error)
            }
            
        }
        task.resume()
    }
}

//Yukaridaki ile ayni isi yapiyor sadece func yazimi farkli

//webService.downloadNews(success: { articles in
//    print("Articles : \(articles)")
//}, failure: { error in
//    if let error = error {
//        print("Error : \(error.localizedDescription)")
//    }
//})

