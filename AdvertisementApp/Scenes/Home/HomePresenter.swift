//
//  HomePresenter.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 03/02/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  DRI: Mouldi GABSI
//

import UIKit

/// Class HomePresenterPresenter
///
/// Will be the Layout Updater for the HomePresenter
///
class HomePresenter: Presenter {
    /// The viewController var will store a reference to the HomePresenter
    var viewController: HomeViewController
    
    /**
     We setup the HomePresenter in the
     HomePresenterPresenter, because only the Presenter
     can update the viewController
     */
    init(vc: HomeViewController) {
        viewController = vc
    }
}
