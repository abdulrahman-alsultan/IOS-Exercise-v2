//
//  ArticleCell.swift
//  ios exercise
//
//  Created by user220264 on 4/16/22.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var descibeLbl: UILabel!
    @IBOutlet weak var articleImage: LazyImageView!
    
    func configure(title: String, describe: String, img: String){
        titleLbl.text = title
        descibeLbl.text = describe

        if !img.isEmpty, let url = URL(string: img)  {
            articleImage.loadImage(from: url)
            
        }
        else{
            imageView?.isHidden = true
        }
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
