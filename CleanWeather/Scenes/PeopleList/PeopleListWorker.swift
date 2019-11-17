//
//  PeopleListWorker.swift
//  CleanWeather
//
//  Created by Patryk Średziński on 07/11/2019.
//  Copyright © 2019 vandermesis. All rights reserved.
//

import Foundation

protocol PeopleListWorker {
    func fetchPeople(completion: FetchPeopleCompletion?)
}

final class PeopleListWorkerImpl {
    
    private let networking: PeopleNetworking
    
    init(networking: PeopleNetworking) {
        self.networking = networking
    }
    
}

extension PeopleListWorkerImpl: PeopleListWorker {
    
    func fetchPeople(completion: FetchPeopleCompletion?) {
        networking.fetchPeople { [weak self] result in

            guard let self = self, case .success(let people) = result else {
                completion?(result)
                return
            }
            
            let sortedPeople = self.sortPeople(people: people)
            
            if sortedPeople.count < 20 {
                completion?(.failure(AppError(message: "niem asz 20 ludzin")))
                return
            }
            
            completion?(.success(sortedPeople))
        }
    }
    
}

private extension PeopleListWorkerImpl {
    
    private func sortPeople(people: [Person]) -> [Person] {
        return people.sorted(by: { $0.firstName < $1.firstName })
    }
}

struct AppError: Error {
    let message: String
}

extension Error {
    var userFriendlyMessage: String {
        if self is DecodingError {
            return "Bd dekodowania"
        } else if let apperror = self as? AppError {
            return apperror.message
        }
        return "Unknown error"
    }
}
