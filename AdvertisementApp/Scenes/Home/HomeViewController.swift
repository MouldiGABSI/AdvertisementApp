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

class HomeViewController: UIViewController, VIPController {
    var interactor: HomeInteractor?
    var viewModel: HomeViewModel? {
        didSet { DispatchQueue.main.async { self.advertisementsTableView.reloadData() } }
    }
    var router: HomeRouter?
    let advertisementsTableView = UITableView()
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
        configureView()
        fetchAnnounecementOnLoad()
    }
    
    func configureView() {
        view.backgroundColor = .white
        
        view.addSubview(advertisementsTableView)
        
        advertisementsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        advertisementsTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        advertisementsTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        advertisementsTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        advertisementsTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        advertisementsTableView.register(AdvertisementCell.self, forCellReuseIdentifier: AdvertisementCell.identifier)
        advertisementsTableView.dataSource = self
        advertisementsTableView.delegate = self

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

extension HomeViewController : UITableViewDataSource {
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.count ?? 0
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows(section) ?? 0
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
extension HomeViewController : UITableViewDelegate {
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel?.row(rowAt: indexPath)?.rowHeight ?? 0
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedRow = viewModel?.row(rowAt: indexPath) as? AdvertisementRowViewModel {
        }
    }
}

