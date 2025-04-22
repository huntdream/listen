//
//  TrackService.swift
//  music
//
//  Created by Yu Mao on 4/18/25.
//

import Alamofire
import Foundation

class TrackService {
    static let shared = TrackService()
    
    private init() {}
    
    func check(id:Int, completion: @escaping (Bool) -> Void) {
        NetworkAdapter.shared.request(endpoint: .check(id: id), method: .get) { (result: Result<CheckResult, AFError>) in
            switch result {
            case .success(let data):
                completion(data.success)
            case .failure:
                completion(false)
            }
        }
    }
    
    func fetchDetail(id: Int, completion: @escaping (Result<Track, AFError>) -> Void) {
        NetworkAdapter.shared.request(endpoint: .trackDetail(ids: id), method: .get) { (result: Result<TracksDetail, AFError>) in
            switch result {
            case .success(let data):
                completion(.success(data.songs[0]))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchUrl(id: Int, completion: @escaping (Result<URL, AFError>) -> Void) {
        NetworkAdapter.shared.request(endpoint: .trackUrl(id: id), method: .get) { (result: Result<TrackURLResult, AFError>) in
            switch result {
            case .success(let data):
                guard let urlString = data.data.first?.url.replacingOccurrences(of: "http://", with: "https://"), let url = URL(string: urlString) else {
                    completion(.failure(AFError.responseValidationFailed(reason: .dataFileNil)))
                    return
                }
                completion(.success(url))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
