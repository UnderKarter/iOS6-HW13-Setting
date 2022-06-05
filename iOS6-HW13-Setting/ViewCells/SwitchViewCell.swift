//
//  SwitchViewCell.swift
//  iOS6-HW13-Setting
//
//  Created by temp user on 05.06.2022.
//

import UIKit

struct SwitchOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (()->Void)
    var isOn: Bool
}

class SwitchViewCell: UITableViewCell {
    
    static let identifier = "SwitchViewCell"
    
    private let label: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let switchButton: UISwitch = {
        let switchButton = UISwitch()
        switchButton.onTintColor = .systemBlue
        return switchButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        contentView.addSubview(switchButton)
        iconContainer.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .none
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(
            x: 15,
            y: 8,
            width: size,
            height: size
        )
        
        let imageSize: CGFloat = size
        iconImageView.frame = CGRect(
            x: (size-imageSize)/2,
            y: (size-imageSize)/2,
            width: imageSize,
            height: imageSize
        )
        
        switchButton.sizeToFit()
        switchButton.frame = CGRect(
            x: contentView.frame.size.width - switchButton.frame.size.width - 20,
            y: (contentView.frame.size.height - switchButton.frame.size.height) / 2,
            width: switchButton.frame.size.width,
            height: switchButton.frame.size.height
        )
        
        label.frame = CGRect(
            x: 25 + iconContainer.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 15 - iconContainer.frame.size.width,
            height: contentView.frame.size.height
        )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        switchButton.isOn = false
    }
    
    public func configure(with model: SwitchOption) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        switchButton.isOn = model.isOn
    }
}

