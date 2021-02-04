//
//  HomeViewController.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 03/02/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  DRI: Mouldi GABSI
//

import UIKit

class HomeViewController: UITableViewController, VIPController {
    var interactor: HomeInteractor?
    var viewModel: HomeViewModel? {
        didSet { tableView.reloadData() }
    }
    var router: HomeRouter?
    
    // MARK: - Initializers
    
    init(configurator: HomeConfigurator = HomeConfigurator.shared) {
        
        super.init(nibName: nil, bundle: nil)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        configure()
    }
    
    // MARK: - Configurator
    
    private func configure(configurator: HomeConfigurator = HomeConfigurator.shared) {
        
        configurator.configure(viewController: self)
    }
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAnnounecementOnLoad()
    }
    
    // MARK: Event handling
    
    /**
     fetchAnnounecementOnLoad() is called by the ViewController
     AKA: Ask the Interactor to do fetch announecements
     */
    func fetchAnnounecementOnLoad() {
        interactor?.fetchAnnounecement()
    }
    
    // MARK: Display logic
    
    /**
     layout() is called by the presenter AFTER being requested by the interactor
     AKA: Display the result from the Presenter
     */
    func layout(model: HomeViewModel) {
        viewModel = model
    }
}

// MARK: UITableViewDataSource

extension HomeViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows(section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let rowClass = viewModel?.row(rowAt: indexPath)?.rowClass {
            if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: rowClass)) {
                viewModel?.row(rowAt: indexPath)?.configure(cell)
                return cell
            }
        }
        return UITableViewCell()
    }
}

// MARK: UITableViewDelegate
extension HomeViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel?.row(rowAt: indexPath)?.rowHeight ?? 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedRow = viewModel?.row(rowAt: indexPath) as? AdvertisementTableRowViewModel {
        }
        performSegue(withIdentifier: "WeatherForecast", sender: self)
    }
}

