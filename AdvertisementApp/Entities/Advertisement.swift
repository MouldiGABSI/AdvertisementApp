//
//  Advertisement.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 03/02/2021.
//

import Foundation

protocol Filtrable {
    var description : String { get }
}

public enum Category : Int, Codable, Filtrable {
    case cars = 1, fashion, diy, home, hobbies, realEstate, booksCDDVD, multimédia, services, pets, children
    static var allValues = [Category.cars, .fashion, .diy, .home, .hobbies, .realEstate, .booksCDDVD, .multimédia,.services, .pets, .children]
    var description : String {
        switch self {
        case .cars:
            return "Véhicule"
        case .fashion:
            return "Mode"
        case .diy:
            return "Bricolage"
        case .home:
            return "Maison"
        case .hobbies:
            return "Loisirs"
        case .realEstate:
            return "Immobilier"
        case .booksCDDVD:
            return "Livres/CD/DVD"
        case .multimédia:
            return "Multimédia"
        case .services:
            return "Services"
        case .pets:
            return "Animeaux"
        case .children:
            return "Enfants"
        }
        
    }
}

struct Advertisement : Codable {
    
    var identifier: Int
    var category: Category
    var title: String
    var description: String
    var price: Double
    var isUrgent: Bool
    var creationDate: String?
    var images: ImageURL
    var createdOn: Date? { return creationDate?.toDate }
    
    enum CodingKeys: String, CodingKey {
        case identifier   = "id"
        case category     = "category_id"
        case creationDate = "creation_date"
        case images       = "images_url"
        case isUrgent     = "is_urgent"
        case title, description, price
    }
    
}

struct ImageURL: Codable {
    var small: String?
    var thumb: String?
}

extension Advertisement: Equatable {
    static func == (lhs: Advertisement, rhs: Advertisement) -> Bool {
        return lhs.isUrgent == rhs.isUrgent &&
            lhs.category == rhs.category &&
            lhs.creationDate == rhs.creationDate &&
            lhs.price == rhs.price &&
            lhs.title == rhs.title &&
            lhs.description == rhs.description &&
            lhs.images == rhs.images
    }
}

extension ImageURL : Equatable {
    static func == (lhs: ImageURL, rhs: ImageURL) -> Bool {
        return lhs.small == rhs.small && lhs.thumb == rhs.thumb
    }
}
