//
//  AdvertisementDetailsPresenter.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 09/02/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  DRI: Mouldi GABSI
//

import UIKit

/// Class AdvertisementDetailsPresenter
///
/// Will be the Layout Updater for the AdvertisementDetailsPresenter
///
class AdvertisementDetailsPresenter: Presenter {
    /// The viewController var will store a reference to the AdvertisementDetailsPresenter
    var viewController: AdvertisementDetailsViewController
    
    /**
     We setup the AdvertisementDetailsPresenterViewController in the
     AdvertisementDetailsPresenter, because only the Presenter
     can update the viewController
     */
    init(vc: AdvertisementDetailsViewController) {
        viewController = vc
    }
    
    /**
     This method will call the presenter to display the result of your doSomething() func
     Don't forget to write the corresponding XCTest
     */
    func presentSomething() {
        /// This will be called in the AdvertisementDetailsPresenterViewController
        present(viewModel: AdvertisementDetailsViewModel())
    }
}
