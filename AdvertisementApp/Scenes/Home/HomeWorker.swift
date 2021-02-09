//
//  HomeWorker.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 03/02/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  DRI: Mouldi GABSI
//

import UIKit

/// Class HomeWorkerWorker
///
/// Will perfom all the work requested by the HomeWorkerInteractor
///
class HomeWorker {
    
    /**
     This method will do a single work
     Called from the interactor
     */
    func generateViewModel(advertisements: [Advertisement]) -> HomeViewModel? {
        
        let rows = advertisements.map { (advertisement) -> AdvertisementRowViewModel in
            AdvertisementRowViewModel(identifier: advertisement.identifier,
                                      title: advertisement.title,
                                      category: advertisement.category,
                                      price: advertisement.price,
                                      images: advertisement.images,
                                      isUrgent: advertisement.isUrgent)
        }
        let sections = rows.count > 0 ? [AdvertisementSectionViewModel(dataModel: rows)] : []
        return HomeViewModel(sections: sections)
    }
}
