//
//  GifCell.swift
//  GiphySearchIOS
//
//  Created by Mark Kim on 6/5/20.
//  Copyright © 2020 Mark Kim. All rights reserved.
//

import UIKit

class GifCell: UITableViewCell {
    
    var gif: Gif?
    
    var gifView: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if gif != nil {
            let gifURL = gif!.getGifURL()
            gifView.image = UIImage.gif(url: gifURL)
            gifView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
            addSubview(gifView)
        }
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
