//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Macbook on 12/16/21.
//

import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListModel:ArticleListViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=021ac8b162974c15841de1b38a9267d1")
    
        Webservice().getArticles(url: url!) { articles in
            
            if let articles = articles {
                self.articleListModel = ArticleListViewModel(articles: articles)
            }

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListModel == nil ? 0 : self.articleListModel.numberOfSection
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.articleListModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("Cell not found")
        }
        
        let articleVM = self.articleListModel.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description
        
        return cell
    }
    
    
}
