import Alamofire



enum APIPath {
    case check(id: Int)
    case trackDetail(ids: Int)
    case trackUrl(id: Int)
    
    var path: String {
        switch self {
        case .check(let id):
            return "/check/music\(id)"
        case .trackDetail(let ids):
            return "/song/detail?ids=\(ids)"
        case .trackUrl(let id):
            return "/song/url/v1?id=\(id)&level=lossless"
        }
    }
}

class NetworkAdapter {
    static let shared = NetworkAdapter()
    private let baseURL = AppConfig.baseURL
    
    private init() {}
    
    func request<T: Decodable>(
        endpoint: APIPath,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        headers: HTTPHeaders? = nil,
        completion: @escaping (Result<T, AFError>) -> Void
    ) {
        let url = baseURL + endpoint.path
        
        AF.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
