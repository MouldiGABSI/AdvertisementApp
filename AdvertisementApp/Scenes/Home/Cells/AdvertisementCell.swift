//
//  AdvertisementCell.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 03/02/2021.
//

import UIKit

class AdvertisementCell: UITableViewCell {

    var icon             = UIImageView()
    var titleLabel       = UILabel ()
    var urgentLabel      = UILabel()
    var priceLabel       = UILabel()
    var categoryLabel    = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func setIconLayoutConstraints() {
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalToConstant: 80),
            icon.widthAnchor.constraint(equalToConstant: 80),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
         ])
    }
    
    func setTitleLayoutConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 20),
            titleLabel.heightAnchor.constraint(equalToConstant: 32)
         ])
    }
    
    func setUrgentLayoutConstraints() {
        
        NSLayoutConstraint.activate([
            urgentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            urgentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            urgentLabel.widthAnchor.constraint(equalToConstant: 100),
            urgentLabel.heightAnchor.constraint(equalToConstant: 15)
         ])
    }
    
    func setPriceLayoutConstraints() {
        NSLayoutConstraint.activate([
            priceLabel.heightAnchor.constraint(equalToConstant: 28),
            priceLabel.widthAnchor.constraint(equalToConstant: 120),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            priceLabel.topAnchor.constraint(greaterThanOrEqualTo: icon.bottomAnchor, constant: 10),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20)
         ])
    }
    
    func setCategoryLayoutConstraints() {
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            categoryLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 20),
            categoryLabel.heightAnchor.constraint(equalToConstant: 32)
         ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.addSubview(icon)
        setIconLayoutConstraints()
        contentView.addSubview(titleLabel)
        setTitleLayoutConstraints()
        contentView.addSubview(urgentLabel)
        setUrgentLayoutConstraints()
        contentView.addSubview(categoryLabel)
        setCategoryLayoutConstraints()
        contentView.addSubview(priceLabel)
        setPriceLayoutConstraints()
    }

    func configure(model: AdvertisementTableRowViewModel) {
        titleLabel.text      = model.title
        categoryLabel.text   = model.category.description
        priceLabel.text      = "\(model.price)"
        urgentLabel.text     = "Urgent"
        urgentLabel.backgroundColor = UIColor(red: 238.0, green: 104.0, blue: 40.0, alpha: 1.0)
        urgentLabel.textColor       = .white
        urgentLabel.isHidden = !model.isUrgent
    }

}
