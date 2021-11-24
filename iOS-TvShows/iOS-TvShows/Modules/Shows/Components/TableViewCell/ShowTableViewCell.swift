//
//  ShowTableViewCell.swift
//  iOS-TvShows
//
//  Created by Filip Ban on 24.11.2021..
//

import UIKit
import Kingfisher

struct ShowTableCellItem: TableCellItem {
    let show: Show

    func cell(from tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: ShowTableViewCell.self, for: indexPath)
        cell.setData(with: show)
        return cell
    }

    var height: CGFloat {
        114
    }
}

class ShowTableViewCell: UITableViewCell {

    var customImageView: UIImageView!
    var label: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        customImageView = UIImageView()
        contentView.addSubview(customImageView)
        label = UILabel(with: UIFont.systemFont(ofSize: 17))
        contentView.addSubview(label)

        customImageView.clipsToBounds = true
        customImageView.roundAllCorners(withRadius: 4)

        customImageView.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 64, height: 90))
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }

        label.snp.makeConstraints {
            $0.leading.equalTo(customImageView.snp.trailing).offset(24)
            $0.trailing.equalToSuperview().inset(24)
            $0.centerY.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setData(with show: Show) {
        let placeholderImage = UIImage.TVShows.Icons.showPlaceholder
        label.text = show.title

        guard let url = URL(string: show.imageUrl ?? "") else {
            customImageView.image = placeholderImage
            return
        }
        customImageView.kf.setImage(with: url, placeholder: placeholderImage, options: nil, completionHandler: nil)
    }
}
