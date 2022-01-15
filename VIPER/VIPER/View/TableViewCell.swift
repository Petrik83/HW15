//
//  TableViewCell.swift
//  VIPER
//
//  Created by Дмитрий Казанков on 06.01.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView()
        iconImageView.layer.cornerRadius = Metric.cornerRadius
        iconImageView.tintColor = .white
        iconImageView.contentMode = .center

        return iconImageView
    }()

    lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metric.fontSize)

        return label
    }()

    // MARK: - TableViewCell init -

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(iconImageView)
        contentView.addSubview(label)
        accessoryType = .disclosureIndicator
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    // MARK: - TableViewCell layOutSubviews -

    override func layoutSubviews() {
        super.layoutSubviews()

        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Metric.leadingAnchorConstant).isActive = true
        iconImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: Metric.iconImageViewSizeMultiplier).isActive =  true
        iconImageView.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: Metric.iconImageViewSizeMultiplier).isActive = true

        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: Metric.leadingAnchorConstant).isActive = true
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconImageView.backgroundColor = nil
        self.accessoryView = nil
    }

    //MARK: - Configure cell -

    func configureCell(with cellInfo: SettingsPoint?, presenter: AnyPresenter?) {
        guard let cellInfo = cellInfo else { return }

        self.label.text = cellInfo.label

        lazy var someImage = UIImage(systemName: cellInfo.iconImageName)
        if cellInfo.iconImageName == "bluetooth" {
            someImage = UIImage(named: cellInfo.iconImageName)
        }
        let someCIImage = CIImage(image: someImage ?? UIImage()) ?? CIImage()
        self.iconImageView.image = UIImage(ciImage: someCIImage, scale: Metric.imageViewScale, orientation: UIImage().imageOrientation).withTintColor(.white)

        self.iconImageView.backgroundColor = UIColor(named: cellInfo.backgroundColorName)

        if let detailTextLabel = self.detailTextLabel {
            detailTextLabel.text = cellInfo.detailLabel
        }

        if cellInfo.needForSwitch {
            let _switch = UISwitch()
            _switch.onTintColor = .systemBlue
            self.accessoryView = _switch
        }
    }
}

