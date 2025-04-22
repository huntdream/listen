//
//  PlaylistService.swift
//  music
//
//  Created by Yu Mao on 4/18/25.
//


import Alamofire

class PlaylistService {
    static let shared = PlaylistService()
    private init() {}

    func fetchDetail(completion: @escaping (Result<[Track], AFError>) -> Void) {
        let url = "http://localhost:4000/playlist/detail?id=507703055"
        AF.request(url)
            .validate()
            .responseDecodable(of: PlaylistResponse.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data.playlist.tracks))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
