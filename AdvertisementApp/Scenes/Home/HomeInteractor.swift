//
//  HomeInteractor.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 03/02/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  DRI: Mouldi GABSI
//

import UIKit
import LBCAnnouncementsCore
/// Class HomeInteractorInteractor
///
/// Will handle all (inter)actions from the HomeInteractor
///
class HomeInteractor: Interactor {
    /// The presenter var will store a reference to the HomeInteractorPresenter
    var presenter: HomePresenter
    var service: HomeAPIServiceProtocol?
    /**
     We setup the HomeInteractorPresenter in the
     HomeInteractorInteractor, because only the interactor
     is allowed to call the presenter
     */
    init(presenter: HomePresenter) {
        self.presenter = presenter
    }
    
    /**
     This method will preform an action
     You may create another func if your interactor needs to do multiple actions
     Remember the single responsability principle: one function = one action
     Don't forget to write the corresponding XCTest
     */
    func fetchAnnounecement() {
        // If your action needs complex computation, you may considerate to create a HomeInteractorworker
        service?.fetchAdvertisementsList(completion: { (result:Result<[Advertisement], APIError>) in
            switch result {
            case .success(let advertisements) :
                let worker = HomeWorker()
                if let viewModel = worker.generateViewModel(advertisements: advertisements) {
                    self.presenter.present(viewModel: viewModel)
                }
            case .failure(let error):
                print("-----> \(error)")
            }
            
        })
    }
}
