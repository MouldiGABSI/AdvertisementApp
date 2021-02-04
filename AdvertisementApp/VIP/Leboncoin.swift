//
//  Leboncoin.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 03/02/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  DRI: Mouldi GABSI
//

import UIKit

/// Protocol Interactor
protocol Interactor {
    associatedtype Presenter
    var presenter: Presenter { get set }
}

/// Protocol Presenter
protocol Presenter {
    associatedtype VC
    var viewController: VC { get set }
}

/// extension Presenter
///
/// Will extend the presenter protocol to add functionnality
///
extension Presenter where VC: VIPController {
    typealias ViewModel = VC.ViewModel
    func present(viewModel: ViewModel) {
        viewController.layout(model:viewModel)
    }
}

/// Protocol VIPViewController
///
/// Need to be implemented by all scenes
///
protocol VIPController {
    associatedtype Interactor
    associatedtype ViewModel
    var interactor: Interactor? { get set }
    func layout(model: ViewModel)
}

/// extension VIPViewController
///
/// Connect interactor, presenter and ViewModel
///
extension VIPController { }
