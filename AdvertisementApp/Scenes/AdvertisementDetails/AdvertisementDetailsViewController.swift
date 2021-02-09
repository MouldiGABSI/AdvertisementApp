//
//  AdvertisementDetailsViewController.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 09/02/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  DRI: Mouldi GABSI
//

import UIKit

class AdvertisementDetailsViewController: UIViewController, VIPController {
    var interactor: AdvertisementDetailsInteractor?
    var viewModel: AdvertisementDetailsViewModel?
    var router: AdvertisementDetailsRouter?
    var currentAdvertisement: Advertisement?
    let scrollView = UIScrollView()
    let scrollViewContentView = UIView()
    
    let icon: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.clipsToBounds = true
        return img
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let urgentLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.backgroundColor = UIColor(red: 238.0/255.0, green: 104.0/255.0, blue: 40.0/255.0, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let priceLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let categoryLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    let descriptionLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // MARK: - Initializers

       init(configurator: AdvertisementDetailsConfigurator = AdvertisementDetailsConfigurator.shared) {

           super.init(nibName: nil, bundle: nil)

           configure()
       }

       required init?(coder aDecoder: NSCoder) {

           super.init(coder: aDecoder)

           configure()
       }


       // MARK: - Configurator

       private func configure(configurator: AdvertisementDetailsConfigurator = AdvertisementDetailsConfigurator.shared) {

           configurator.configure(viewController: self)
       }
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: Event handling
    
    /**
     doSomethingOnLoad() is called by the ViewController
     AKA: Ask the Interactor to do some work
     */
    func configureUI() {
        configureScrollView()
        configureTitleLabel()
        configureIconImageView()
        configurePriceLabel()
        configureCategoryLabel()
        configureDescriptionLabel()
        configureIsUrgentLabel()
    }
    
    func configureScrollView() {
        
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.addSubview(scrollViewContentView)
        scrollViewContentView.translatesAutoresizingMaskIntoConstraints = false
        scrollViewContentView.topAnchor.constraint(equalTo:scrollView.topAnchor).isActive = true
        scrollViewContentView.leftAnchor.constraint(equalTo:scrollView.leftAnchor).isActive = true
        scrollViewContentView.rightAnchor.constraint(equalTo:scrollView.rightAnchor).isActive = true
        scrollViewContentView.bottomAnchor.constraint(equalTo:scrollView.bottomAnchor).isActive = true
    }
    
    func configureIconImageView() {
        scrollViewContentView.addSubview(icon)
        icon.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive            = true
        icon.leadingAnchor.constraint(equalTo: scrollViewContentView.leadingAnchor, constant: 30).isActive    = true
        icon.trailingAnchor.constraint(equalTo: scrollViewContentView.trailingAnchor, constant: -30).isActive = true
        icon.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60).isActive = true
        icon.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60).isActive = true
        view.setNeedsLayout()
        view.layoutIfNeeded()
        if let iconUrString = currentAdvertisement?.images.thumb, let iconURL = URL(string: iconUrString) {
            ImageLoader.image(for: iconURL) { image in
              self.icon.image = image
            }
        }
    }
    
    func configureTitleLabel() {
        scrollViewContentView.addSubview(titleLabel)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.topAnchor.constraint(equalTo: scrollViewContentView.topAnchor, constant: 30).isActive            = true
        titleLabel.leadingAnchor.constraint(equalTo: scrollViewContentView.leadingAnchor, constant: 20).isActive    = true
        titleLabel.trailingAnchor.constraint(equalTo: scrollViewContentView.trailingAnchor, constant: -20).isActive = true
        titleLabel.text = currentAdvertisement?.title
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
    }
    
    func configureCategoryLabel() {
        scrollViewContentView.addSubview(categoryLabel)
        categoryLabel.numberOfLines = 0
        categoryLabel.textAlignment = .center
        categoryLabel.textColor = .black
        categoryLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20).isActive                    = true
        categoryLabel.leadingAnchor.constraint(equalTo: scrollViewContentView.leadingAnchor, constant: 30).isActive    = true
        categoryLabel.trailingAnchor.constraint(equalTo: scrollViewContentView.trailingAnchor, constant: -30).isActive = true
        categoryLabel.text = currentAdvertisement?.category.description
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
    }
    
    func configurePriceLabel() {
        scrollViewContentView.addSubview(priceLabel)
        priceLabel.numberOfLines = 1
        priceLabel.textAlignment = .center
        priceLabel.textColor = .black
        priceLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 20).isActive                          = true
        priceLabel.leadingAnchor.constraint(equalTo: scrollViewContentView.leadingAnchor, constant: 80).isActive    = true
        priceLabel.trailingAnchor.constraint(equalTo: scrollViewContentView.trailingAnchor, constant: -80).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 28).isActive                                            = true
        priceLabel.text = "\(currentAdvertisement?.price ?? 0)"
        view.setNeedsLayout()
        view.layoutIfNeeded()
        
    }
    
    func configureDescriptionLabel() {
        scrollViewContentView.addSubview(descriptionLabel)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        descriptionLabel.textColor = .black
        descriptionLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 20).isActive                 = true
        descriptionLabel.leadingAnchor.constraint(equalTo: scrollViewContentView.leadingAnchor, constant: 30).isActive    = true
        descriptionLabel.trailingAnchor.constraint(equalTo: scrollViewContentView.trailingAnchor, constant: -30).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: scrollViewContentView.bottomAnchor, constant: -20).isActive     = true
        descriptionLabel.text = currentAdvertisement?.description
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }
    
    func configureIsUrgentLabel() {
        scrollViewContentView.addSubview(urgentLabel)
        urgentLabel.topAnchor.constraint(equalTo: scrollViewContentView.topAnchor, constant: 5).isActive             = true
        urgentLabel.trailingAnchor.constraint(equalTo: scrollViewContentView.trailingAnchor, constant: -10).isActive = true
        urgentLabel.widthAnchor.constraint(equalToConstant: 100).isActive                                            = true
        urgentLabel.heightAnchor.constraint(equalToConstant: 25).isActive                                            = true
        urgentLabel.text            = "Urgent"
        urgentLabel.textAlignment   = .center
        urgentLabel.backgroundColor = UIColor(red: 238.0/255.0, green: 104.0/255.0, blue: 40.0/255.0, alpha: 1.0)
        urgentLabel.textColor       = .white
        urgentLabel.isHidden = !(currentAdvertisement?.isUrgent ?? false)
        view.setNeedsLayout()
        view.layoutIfNeeded()
    }
    
    // MARK: Display logic
    
    /**
     layout() is called by the presenter AFTER being requested by the interactor
     AKA: Display the result from the Presenter
     */
    func layout(model: AdvertisementDetailsViewModel) {
        viewModel = model
    }
}
