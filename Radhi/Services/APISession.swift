//
//  APISession.swift
//  Radhi
//
//  Created by Dalal Macbook on 24/11/2023.
//

import Foundation
import Combine

enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}

protocol RequestBuilder {
    var urlRequest: URLRequest { get }
}

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder, test: String) -> AnyPublisher<T, NetworkError>
}

struct APISession: APIService {
    func request<T>(with builder: RequestBuilder, test: String) -> AnyPublisher<T, NetworkError> where T: Decodable {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return URLSession.shared
            .dataTaskPublisher(for: builder.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in NetworkError.badUrl}
            .flatMap { data, response -> AnyPublisher<T, NetworkError> in
                if let response = response as? HTTPURLResponse {

                    if (200...299).contains(response.statusCode) {
                        print(String(data: data, encoding: .utf8) ?? "")
                        return Just(data)
                            .decode(type: T.self, decoder: decoder)
                            .mapError {_ in NetworkError.failedToDecodeResponse}
                            .eraseToAnyPublisher()
                    } else {
                        return Fail<T, NetworkError>(error: NetworkError.badStatus)
                            .eraseToAnyPublisher()
                    }
                }
                return Fail<T, NetworkError>(error: NetworkError.badUrl)
                        .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
