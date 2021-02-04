//
//  TableViewModel.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 03/02/2021.
//

import Foundation
import UIKit

// MARK: - Generic Table View Model
protocol TableViewModel {
    var sections: [TableSectionViewModel] { get set }
    var count: Int { get }
    
    func headerViewModel(_ section: Int) -> TableHeaderViewModel?
    func numberOfRows(_ section: Int) -> Int
    func row(rowAt indexPath: IndexPath) -> TableRowViewModel?
}

extension TableViewModel {
    var count: Int { return sections.count }
    
    func headerViewModel(_ section: Int) -> TableHeaderViewModel? { return sections[section].header }
    func numberOfRows(_ section: Int) -> Int { return sections[section].count }
    func row(rowAt indexPath: IndexPath) -> TableRowViewModel? {
        if indexPath.section < sections.count {
            if indexPath.row < sections[indexPath.section].dataModel.count {
                return sections[indexPath.section].dataModel[indexPath.row]
            }
        }
        return nil
    }
}

protocol TableSectionViewModel {
    var header: TableHeaderViewModel? { get }
    var dataModel: [TableRowViewModel] { get }
    
    var count: Int { get }
}

extension TableSectionViewModel {
    var header: TableHeaderViewModel? { return nil }
    var count: Int { return dataModel.count }
}

protocol TableHeaderViewModel {
    var rowClass: AnyClass { get }
    var headerHeight: CGFloat { get }
    
    func configure(_ view: UITableViewHeaderFooterView, isExpanded: Bool?)
}

protocol TableRowViewModel {
    var rowClass: AnyClass { get }
    var rowHeight: CGFloat { get }
    
    func configure(_ cell: UITableViewCell)
}
