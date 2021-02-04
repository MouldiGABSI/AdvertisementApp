//
//  String+Utils.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 04/02/2021.
//

import Foundation

extension String {
    
    var toDate : Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss+SSSS"
        return formatter.date(from: self)
    }
}
