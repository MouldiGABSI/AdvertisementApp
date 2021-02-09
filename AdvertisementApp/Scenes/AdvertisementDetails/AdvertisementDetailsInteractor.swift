//
//  AdvertisementDetailsInteractor.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 09/02/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  DRI: Mouldi GABSI
//

import UIKit

/// Class AdvertisementDetailsInteractorInteractor
///
/// Will handle all (inter)actions from the AdvertisementDetailsInteractorViewController
///
class AdvertisementDetailsInteractor: Interactor {
    /// The presenter var will store a reference to the AdvertisementDetailsInteractorPresenter
    var presenter: AdvertisementDetailsPresenter
    var advertisement: Advertisement?
    /**
     We setup the AdvertisementDetailsInteractorPresenter in the
     AdvertisementDetailsInteractorInteractor, because only the interactor
     is allowed to call the presenter
     */
    init(presenter: AdvertisementDetailsPresenter) {
        self.presenter = presenter
    }
    
    /**
     This method will preform an action
     You may create another func if your interactor needs to do multiple actions
     Remember the single responsability principle: one function = one action
     Don't forget to write the corresponding XCTest
     */
    func doSomething() {
        // If your action needs complex computation, you may considerate to create a AdvertisementDetailsInteractorworker
        let worker = AdvertisementDetailsWorker()
        worker.doSomeWork()
    }
    
    /**
     This method will call the presenter to display the result of your doSomething() func
     Don't forget to write the corresponding XCTest
     */
    func presentSomething() {
        /// This will be called in the AdvertisementDetailsInteractorPresenter
        presenter.presentSomething()
    }
}
