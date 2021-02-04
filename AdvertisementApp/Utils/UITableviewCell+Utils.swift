//
//  UITableviewCell+Utils.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 03/02/2021.
//

import Foundation
import UIKit

/**
 Extension UITableViewCell that offer
 a reuse identifier which is the name of the class
 */
extension UITableViewCell {
    /// Default Identifier for reuse
    @objc static var identifier: String {
        return String(describing: self)
    }
}
