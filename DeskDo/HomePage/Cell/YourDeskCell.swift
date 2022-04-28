//
//  YourDeskCell.swift
//  DeskDo
//
//  Created by Vendly on 27/04/22.
//

import UIKit

class YourDeskCell: UITableViewCell {

    @IBOutlet weak var deskName: UILabel!
    
    @IBOutlet weak var deskImg: UIImageView! {
        didSet {
            deskImg.layer.cornerRadius = 15
            deskImg.layer.masksToBounds = true
            let overlay = UIView()
                        overlay.backgroundColor = UIColor(white: 0, alpha: 0.3) //change to your liking
                        overlay.frame = CGRect(x: 0, y: 0, width: deskImg.frame.width, height: deskImg.frame.height)

            deskImg.addSubview(overlay)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
