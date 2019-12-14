//
//  APIClient.swift
//  CleanWeather
//
//  Created by Marek Skrzelowski on 13/12/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

struct InvalidURLError: Error {} // przenies gdzies to
struct MissingAPIResponse: Error {} // przenies gdzies to
struct APIError: Error {
    let statusCode: Int
    let data: Data?
}
struct MissingAPIData: Error {} // przenies gdzies to

final class APIClient {

    private let defaultSession = URLSession(configuration: .default)
    private let jsonDeserializer = SerializerHelper.shared.decoder
    
    func perform<T>(request: Request<T>) {
        
        guard let urlRequest = buildURLRequest(request: request) else {
            request.completion?(.failure(InvalidURLError()))
            return
        }
        
        let dataTask = defaultSession.dataTask(with: urlRequest) { data, response, error in
            // raczej nie weak self, bo chcemy miec pewnosc ze COMPLETION sie wywola, zeby jajkies spinnery nie zostaly na zawsze
            self.handleResponse(data: data, response: response, error: error, request: request)
        }
        dataTask.resume()
    }
}

private extension APIClient {
    
    private func buildURLRequest<T>(request: Request<T>) -> URLRequest? {
        
        guard let url = URL(string: request.url) else {
            return nil
        }

        let urlRequest = URLRequest(url: url)
        
        // w przyszłości pewnie tu by były jeszcze heeadery do requeestu
        
        return urlRequest
    }
    
    private func handleResponse<T>(data: Data?, response: URLResponse? , error: Error?, request: Request<T>) {
        
        if let error = error {
            request.completion?(.failure(error))
            return
        }
        
        guard let response = response as? HTTPURLResponse else {
            request.completion?(.failure(MissingAPIResponse()))
            return
        }
        
        guard response.statusCode >= 200 && response.statusCode < 300 else {
            request.completion?(.failure(APIError(statusCode: response.statusCode, data: data)))
            return
        }
        
        serializeResponse(request: request, data: data)
        
    }
    
    private func serializeResponse<T>(request: Request<T>, data: Data?) {
        
        // GENERYKI
        // to 'T' wszedzie to jest nasz typ do ktorego bedziemy serializowac
        // on w Requescie jest zaszyty w Completionie
        // tu sprawdzamy czy jest on typu EMPTY - empty to nasze brak danych w odpowiedzi, wystarczy nam ze jest kod 200 i mozna dzialac dalej, wiec sukces
        if let completion = request.completion as? ((Result<Empty, Error>) -> ()) {
            completion(.success(Empty()))
            return
        }
        
        guard let data = data else {
            request.completion?(.failure(MissingAPIData()))
            return
        }
        
        // a jezeli nie to seerializujemy JSONA do naszego typu 'T' który jest Codable
        
        if let niceString = data.prettyStringValue {
            print(niceString)
        }
        
        do {
            let decodedObject = try jsonDeserializer.decode(T.self, from: data)
            request.completion?(.success(decodedObject))
        } catch let error {
            request.completion?(.failure(error))
            return
        }
        
    }

}

// wywal do osobnego pliku, to jest tylko po to zeby sobie ladnie w konsoli wyswietlic JSONA z Data
extension Data {
    
    var stringValue: String? {
        return String(data: self, encoding: .utf8)
    }
    
    var prettyStringValue: String? {
        if let dictionaryValue = try? JSONSerialization.jsonObject(with: self, options: .allowFragments),
            let dataValue = try? JSONSerialization.data(withJSONObject: dictionaryValue, options: .prettyPrinted),
            let stringValue = dataValue.stringValue {
            return stringValue
        }
        guard let stringValue = stringValue else { return nil }
        return stringValue
    }
    
}
