//
//  ArticlesViewModel.swift
//  ios exercise
//
//  Created by user220264 on 4/17/22.
//

import Foundation

class ArticlesViewModel{
    
    var articles: [Article] = []{
        didSet{
            reloadList()
        }
    }
    
    var reloadList = {() -> () in }
    
    var apiTitle: String = ""{
        didSet{
            reloadList()
        }
    }
    
    func getArticles(){
        guard let url = URL(string: "https://no89n3nc7b.execute-api.ap-southeast-1.amazonaws.com/staging/exercise") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [self] data, _, error in
            if let myData = data, error == nil{
                do{
                    var getArticles: [Article] = []
                    let decoder = JSONDecoder()
                    let jsonResult = try decoder.decode(Welcome.self, from: myData)
                    
                    let tempArticales = jsonResult.articles
                    self.apiTitle = jsonResult.title
                    
                    for article in tempArticales{
                        getArticles.append(article)
                    }

                    self.articles = getArticles.sorted(by: {
                        if $0.date == $1.date{
                            if $0.title == $1.title{
                                return $0.authors < $1.authors
                            }
                            return $0.title < $1.title
                        }
                        return $0.date < $1.date
                    })
                    
                }
                catch{
                    print("Error ->\(error.localizedDescription)")
                }
            }
        }
        
        task.resume()
    }
    
}
