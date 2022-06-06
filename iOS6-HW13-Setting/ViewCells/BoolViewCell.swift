//
//  BoolViewCell.swift
//  iOS6-HW13-Setting
//
//  Created by temp user on 06.06.2022.
//

import UIKit

struct BoolOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (()->Void)
    // Режим подключения
    var isOn: Bool
    // Состояние подключения
    let label: String
}

class BoolViewCell: UITableViewCell {
    
    static let identifier = "BoolViewCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let moodLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .systemGray2
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
    
    // Инициализация
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        contentView.addSubview(moodLabel)
        iconContainer.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // Настройка размеров и положения ячейки и элементов
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
        
        label.frame = CGRect(
            x: 25 + iconContainer.frame.size.width,
            y: 0,
            width: contentView.frame.size.width - 15 - iconContainer.frame.size.width,
            height: contentView.frame.size.height
        )
        
        moodLabel.frame = CGRect(
            x: contentView.frame.width - 90,
            y: 0,
            width: contentView.frame.size.width - 15 - iconContainer.frame.size.width,
            height: contentView.frame.size.height
        )
    }
    
    // поготовка к повторному использованию
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        moodLabel.text = nil
        iconContainer.backgroundColor = nil
    }
    
    // передача значений элементам структуры
    public func configure(with model: BoolOption) {
        label.text = model.title
        moodLabel.text = model.label
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
    }
    
}
