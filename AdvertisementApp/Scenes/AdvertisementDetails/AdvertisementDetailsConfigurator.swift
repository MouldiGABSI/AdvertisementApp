//
//  AdvertisementDetailsConfigurator.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 09/02/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class AdvertisementDetailsConfigurator {


    // MARK: - Singleton

    static let shared: AdvertisementDetailsConfigurator = AdvertisementDetailsConfigurator()


    // MARK: - Configuration

    func configure(viewController: AdvertisementDetailsViewController) {

        let router = AdvertisementDetailsRouter(viewController: viewController)
        let presenter = AdvertisementDetailsPresenter(vc: viewController)
        let interactor = AdvertisementDetailsInteractor(presenter: presenter)

        viewController.interactor = interactor
        viewController.router = router
    }
}
