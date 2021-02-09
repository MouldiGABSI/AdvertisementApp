//
//  HomeModels.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 03/02/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  DRI: Mouldi GABSI
//

import UIKit

/// struct HomeModelsViewModel
///
/// Will be used to transit data to the presenter and the ViewController
///
struct HomeViewModel : TableViewModel {
    var sections: [TableSectionViewModel]
    
}

struct AdvertisementSectionViewModel: TableSectionViewModel {
    var dataModel: [TableRowViewModel]
    
}

struct AdvertisementRowViewModel: TableRowViewModel {
    
    var rowClass: AnyClass { return AdvertisementCell.self }
    
    var rowHeight: CGFloat { return UITableView.automaticDimension }
    var identifier: Int
    var title: String
    var category: Category
    var price: Double
    var images: ImageURL
    var isUrgent: Bool
    func configure(_ cell: UITableViewCell) {
        
        if let cityCell = cell as? AdvertisementCell {
            cityCell.configure(model: self)
        }
        
    }
    
    
}
