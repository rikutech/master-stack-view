//
//  ViewController.swift
//  master-stack-view
//
//  Created by 今陸成 on 2020/02/26.
//  Copyright © 2020 今陸成. All rights reserved.
//

import UIKit



struct Article {
    var title: String
    var description: String
    var imageUrl: String?
    var username: String
}

let tallImageUrl = "https://alu-web-herokuapp-com.global.ssl.fastly.net/cropped_images/rbbRMCbiL3WzMuJ0Nf9RKnaBoH42/c_1568031531493?auto=webp&format=jpg&width=1360"
let wideImageUrl = "https://alu-web-herokuapp-com.global.ssl.fastly.net/cropped_images/RpvJia8dfYbIJqnzLNDBztOQeZ92/c_1573262325630?auto=webp&format=jpg&width=1360"

let longTitle = "長いタイトルです長いタイトルです長いタイトルです長いタイトルです長いタイトルです長いタイトルです長いタイトルです"
let shortTitle = "短いタイトルです"

let longDescription = "長い説明です長い説明です長い説明です長い説明です長い説明です長い説明です長い説明です長い説明です長い説明です長い説明です長い説明です長い説明です長い説明です長い説明です長い説明です長い説明です長い説明です長い説明です長い説明です長い説明です長い説明です長い説明です長い説明です長い説明です"
let shortDescription = "短い説明です"

let longUsername = "長いユーザー名です長いユーザー名です長いユーザー名です長いユーザー名です"
let shortUsername = "短いユーザー名です"

let articles = [
    Article(title: longTitle,
            description: longDescription,
            imageUrl: nil,
            username: longUsername),
    Article(title: shortTitle,
            description: shortDescription,
            imageUrl: tallImageUrl,
            username: shortUsername),
    Article(title: longTitle,
            description: longDescription,
            imageUrl: wideImageUrl,
            username: longUsername),
]

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ArticleTableViewCell
        cell.article = articles[indexPath.row]
        return cell
    }
}
