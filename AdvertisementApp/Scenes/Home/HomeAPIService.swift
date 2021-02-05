//
//  HomeAPIService.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 04/02/2021.
//

import Foundation
import LBCAnnouncementsCore

protocol HomeAPIServiceProtocol {
    func fetchAdvertisementsList(completion: @escaping (Result<[Advertisement], APIError>) -> Void)
}


struct HomeAPIService: HomeAPIServiceProtocol {
    func fetchAdvertisementsList(completion: @escaping (Result<[Advertisement], APIError>) -> Void) {
        let router = Router<APIAnnouncementService>()
        router.request(.getAnnouncementList, completion: completion)
    }
}

struct MockAdvertisementRouter: APIProtocol {
    var jsonFileName: String? 
}

struct MockHomeAPIService: HomeAPIServiceProtocol {
    var fileName: String
    func fetchAdvertisementsList(completion: @escaping (Result<[Advertisement], APIError>) -> Void) {
        let router = Router<MockAdvertisementRouter>()
        router.request(MockAdvertisementRouter(jsonFileName: fileName), completion: completion)
    }

}
