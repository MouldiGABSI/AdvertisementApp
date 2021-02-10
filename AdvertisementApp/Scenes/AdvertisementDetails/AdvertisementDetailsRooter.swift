//
//  AdvertisementDetailsRooter.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 09/02/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol AdvertisementDetailsRouterProtocol {

    var viewController: AdvertisementDetailsViewController? { get }

    func navigateToSomewhere()
}

final class AdvertisementDetailsRouter {

    weak var viewController: AdvertisementDetailsViewController?


    // MARK: - Initializers

    init(viewController: AdvertisementDetailsViewController?) {

        self.viewController = viewController
    }
}


// MARK: - AdvertisementDetailsRouterProtocol

extension AdvertisementDetailsRouter: AdvertisementDetailsRouterProtocol {


    // MARK: - Navigation

    func navigateToSomewhere() {

    }
}
