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
/// Will be the Layout Updater for the HomePresenterViewController
///
class HomePresenter: Presenter {
    /// The viewController var will store a reference to the HomePresenterViewController
    var viewController: HomeViewController
    
    /**
     We setup the HomePresenterViewController in the
     HomePresenterPresenter, because only the Presenter
     can update the viewController
     */
    init(vc: HomeViewController) {
        viewController = vc
    }
    
    /**
     This method will call the presenter to display the result of your doSomething() func
     Don't forget to write the corresponding XCTest
     */
    func presentSomething() {
       
    }
}
