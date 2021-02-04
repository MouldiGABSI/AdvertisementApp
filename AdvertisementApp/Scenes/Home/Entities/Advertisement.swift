//
//  Advertisement.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 03/02/2021.
//

import Foundation

public enum Category : Int, Codable {
    case cars = 1, fashion, diy, home, hobbies, realEstate, booksCDDVD, multimédia, services, pets, children
    
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
    var creationDate: Date
    var images: ImageURL
    
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
    var small: String
    var thumb: String
}

/*
 {
     "id":1461267313,
     "category_id":4,
     "title":"Statue homme noir assis en plâtre polychrome",
     "description":"Magnifique Statuette homme noir assis fumant le cigare en terre cuite et plâtre polychrome réalisée à la main.  Poids  1,900 kg en très bon état, aucun éclat  !  Hauteur 18 cm  Largeur : 16 cm Profondeur : 18cm  Création Jacky SAMSON  OPTIMUM  PARIS  Possibilité de remise sur place en gare de Fontainebleau ou Paris gare de Lyon, en espèces (heure et jour du rendez-vous au choix). Envoi possible ! Si cet article est toujours visible sur le site c'est qu'il est encore disponible",
     "price":140.00,
     "images_url":{
        "small":"https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-small/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg",
        "thumb":"https://raw.githubusercontent.com/leboncoin/paperclip/master/ad-thumb/2c9563bbe85f12a5dcaeb2c40989182463270404.jpg"
     },
     "creation_date":"2019-11-05T15:56:59+0000",
     "is_urgent":false
  }
 */
