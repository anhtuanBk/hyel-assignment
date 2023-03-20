//
//  BaseApi.swift
//  Repository
//
//

import Combine

public class BaseApi {
    private let baseUrl: BaseUrl
    private let urlSession: URLSession
    private let retryTimes: Int
    
    public init(_ baseUrl: BaseUrl, urlSession: URLSession = URLSession.shared, retryTimes: Int = 3) {
        self.baseUrl = baseUrl
        self.urlSession = urlSession
        self.retryTimes = retryTimes
    }
    
    func refreshToken() -> AnyPublisher<String, Never> {
        return Future { promise in
            promise(.success("new_token"))
        }
        .eraseToAnyPublisher()
    }
    
    func get<T:Codable>(path: Endpoints) -> AnyPublisher<T, Error> {
        let request = baseUrl.getRequest(of: path)
        
        return Deferred  {
            Future { [weak self] promise in
                guard let self else {
                    promise(.failure(CancellationError()))
                    return
                }
                let task = self.urlSession.dataTask(with: request) {(data , response, error) in
                    print("got response")
                    if let error = error as? URLError {
                        promise(.failure(ApiError.url(error)))
                    }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                        promise(.failure(ApiError.badResponse(statusCode: response.statusCode)))
                    }else if let data = data {
                        let decoder = JSONDecoder()
                        // Custom date formater
                        let dateFormater = DateFormatter()
                        dateFormater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
                        decoder.dateDecodingStrategy = .formatted(dateFormater)
                        do {
                            let result = try decoder.decode(T.self, from: data)
                            promise(.success(result))
                            
                        }catch {
                            promise(.failure(ApiError.parsing(error as? DecodingError)))
                        }
                        
                    }
                }
                
                task.resume()
            }
        }.retry(times: retryTimes, if: { [unowned self] error in
            if error is UnauthorizedError {
                return refreshToken()
                    .map { newToken  in
                        // update new token to Authorization object here
                        
                        return true
                    }
                    .eraseToAnyPublisher()
            }
            return Just(false).eraseToAnyPublisher()
        })
        .eraseToAnyPublisher()
    }
}
