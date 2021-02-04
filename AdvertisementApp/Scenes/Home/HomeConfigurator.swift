//
//  HomeConfigurator.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 03/02/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class HomeConfigurator {


    // MARK: - Singleton

    static let shared: HomeConfigurator = HomeConfigurator()


    // MARK: - Configuration

    func configure(viewController: HomeViewController) {

        let router = HomeRouter(viewController: viewController)
        let presenter = HomePresenter(vc: viewController)
        let interactor = HomeInteractor(presenter: presenter)

        viewController.interactor = interactor
        viewController.router = router
    }
}
