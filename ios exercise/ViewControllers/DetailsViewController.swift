//
//  DetailsViewController.swift
//  ios exercise
//
//  Created by user220264 on 4/16/22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageView: LazyImageView!
    @IBOutlet weak var describeLbl: UILabel!
    
    var titleTxt = ""
    var describeTxt = ""
    var imageURL = ""
    
    func configure(title: String, describe: String, url: String){
        titleTxt = title
        describeTxt = describe
        imageURL = url
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLbl.text = titleTxt
        describeLbl.text = describeTxt
        if !imageURL.isEmpty , let url = URL(string: imageURL)  {
            imageView.loadImage(from: url)
            imageView.isHidden = false
        }
        else{
            imageView.isHidden = true
        }

    }
    

}
