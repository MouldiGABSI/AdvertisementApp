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
    var selectedCategory: Category?
    
    let advertisementsTableView = UITableView()
    
    var filterController: FilterTableViewController<Category>?
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(displayFilter))
        filterController = FilterTableViewController<Category>(Category.allValues) { (category) -> String in
            category.description
        } onSelect: { (category) in
            self.selectedCategory = (self.selectedCategory == category) ? nil : category
            self.interactor?.getAdvertisement(byCategory: self.selectedCategory)
        }
        filterController?.preferredContentSize = CGSize(width: 300, height: 400)
    }
    
    @objc @IBAction func displayFilter(_ sender: UIBarButtonItem) {
        if let _filterController = filterController {
            showPopup(_filterController, sourceView: sender)
        }
    }
    
    private func showPopup(_ controller: UIViewController, sourceView: UIBarButtonItem) {
        if let presentationController = self.configurePresentation(forController: controller) {
            presentationController.barButtonItem = sourceView
            presentationController.permittedArrowDirections = .up
            self.present(controller, animated: true)
        }
    }
    
    func configurePresentation(forController controller : UIViewController) -> UIPopoverPresentationController? {
        controller.modalPresentationStyle = .popover
        let presentationController = controller.presentationController as? UIPopoverPresentationController
        presentationController?.delegate = self
        return presentationController
    }
    
    func configureView() {
        view.backgroundColor = .white
        
        view.addSubview(advertisementsTableView)
        
        advertisementsTableView.translatesAutoresizingMaskIntoConstraints = false
        advertisementsTableView.estimatedRowHeight = 10
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
            if let selectedAdvertisement = interactor?.getAdvertisement(byId: selectedRow.identifier) {
                router?.navigateToAdvertisementDetails(advertisement: selectedAdvertisement)
            }
        }
    }
}

extension HomeViewController : UIPopoverPresentationControllerDelegate {
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
}
