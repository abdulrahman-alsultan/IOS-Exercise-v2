//
//  LazyImageView.swift
//  ios exercise
//
//  Created by user220264 on 4/17/22.
//

import Foundation
import UIKit

class LazyImageView: UIImageView{
    
    func loadImage(from url: URL){
        
        self.image = UIImage(systemName: "icloud.and.arrow.down")
        
                
        DispatchQueue.global().async {
            [weak self] in
            
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
