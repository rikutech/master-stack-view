//
//  ArticleTableViewCell.swift
//  master-stack-view
//
//  Created by 今陸成 on 2020/02/26.
//  Copyright © 2020 今陸成. All rights reserved.
//

import UIKit

final class ArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    var article: Article? {
        didSet {
            guard let article = article else { return }
            titleLabel.text = article.title
            descriptionLabel.text = article.description
            usernameLabel.text = article.username

            if let imageUrl = article.imageUrl {
                articleImageView.isHidden = false
                let url = URL(string: imageUrl)!
                URLSession.shared.dataTask(with: url, completionHandler: { [weak self] data, _, error in
                    if error != nil { return }
                    DispatchQueue.main.async {
                        self?.articleImageView.image = UIImage(data: data!)
                    }
                }).resume()
            } else {
                articleImageView.isHidden = true
            }
        }
    }
}
