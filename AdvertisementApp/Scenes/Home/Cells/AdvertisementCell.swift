//
//  AdvertisementCell.swift
//  AdvertisementApp
//
//  Created by Mouldi GABSI on 03/02/2021.
//

import UIKit

class AdvertisementCell: UITableViewCell {

    let icon: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.clipsToBounds = true
        return img
    }()
    let titleLabe: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let urgentLabel: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
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
   
    func setIconLayoutConstraints() {
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalToConstant: 80),
            icon.widthAnchor.constraint(equalToConstant: 80),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
         ])
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    func setTitleLayoutConstraints() {
        NSLayoutConstraint.activate([
            titleLabe.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            titleLabe.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            titleLabe.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 20),
            titleLabe.heightAnchor.constraint(equalToConstant: 32)
         ])
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    func setUrgentLayoutConstraints() {
        
        NSLayoutConstraint.activate([
            urgentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            urgentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 10),
            urgentLabel.widthAnchor.constraint(equalToConstant: 100),
            urgentLabel.heightAnchor.constraint(equalToConstant: 15)
         ])
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    func setPriceLayoutConstraints() {
        NSLayoutConstraint.activate([
            priceLabel.heightAnchor.constraint(equalToConstant: 28),
            priceLabel.widthAnchor.constraint(equalToConstant: 120),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            priceLabel.topAnchor.constraint(greaterThanOrEqualTo: icon.bottomAnchor, constant: 10),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20)
         ])
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    func setCategoryLayoutConstraints() {
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: titleLabe.bottomAnchor, constant: 20),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            categoryLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 20),
            categoryLabel.heightAnchor.constraint(equalToConstant: 32)
         ])
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //setUp()
        contentView.addSubview(titleLabe)
        contentView.backgroundColor = .red
        titleLabe.textColor = .red
        titleLabe.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive           = true
        titleLabe.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20).isActive = true
        titleLabe.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20).isActive  = true
        titleLabe.heightAnchor.constraint(equalToConstant: 32).isActive                                 = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUp() {
        contentView.addSubview(icon)
        setIconLayoutConstraints()
        contentView.addSubview(titleLabe)
        setTitleLayoutConstraints()
        contentView.addSubview(urgentLabel)
        setUrgentLayoutConstraints()
        contentView.addSubview(categoryLabel)
        setCategoryLayoutConstraints()
        contentView.addSubview(priceLabel)
        setPriceLayoutConstraints()
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    
    func configure(model: AdvertisementRowViewModel) {
        titleLabe.text       = model.title
        categoryLabel.text   = model.category.description
        priceLabel.text      = "\(model.price)"
        urgentLabel.text     = "Urgent"
        //urgentLabel.backgroundColor = UIColor(red: 238.0, green: 104.0, blue: 40.0, alpha: 1.0)
        urgentLabel.textColor       = .red
        urgentLabel.isHidden = !model.isUrgent
    }

}
