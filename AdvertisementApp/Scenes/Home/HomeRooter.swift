//
//  HomeRooter.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 03/02/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomeRouterProtocol {

    var viewController: HomeViewController? { get }

    func navigateToAdvertisementDetails(advertisement: Advertisement)
}

final class HomeRouter {

    weak var viewController: HomeViewController?


    // MARK: - Initializers

    init(viewController: HomeViewController?) {

        self.viewController = viewController
    }
}


// MARK: - HomeRouterProtocol

extension HomeRouter: HomeRouterProtocol {


    // MARK: - Navigation

    func navigateToAdvertisementDetails(advertisement: Advertisement) {
        let advertisementDetails = AdvertisementDetailsViewController()
        advertisementDetails.currentAdvertisement = advertisement
        viewController?.navigationController?.pushViewController(advertisementDetails, animated: true)
    }
}
