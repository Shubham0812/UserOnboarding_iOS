//
//  OnboardingCollectionViewCell.swift
//  UserOnboarding
//
//  Created by Shubham Singh on 25/04/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import UIKit
import Lottie


struct Page {
    let animationName: String
    let title: String
    let description: String
}

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var animationContainer: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
        
    static let identifier = "OnboardingCollectionViewCell"
    
    var animation = AnimationView()

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(page: Page){
        
        animation = AnimationView(name: page.animationName)
        animation.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height * 0.8)
        animation.animationSpeed = 1
        animation.loopMode = .loop
        animation.play()
        animationContainer.addSubview(animation)
        
        self.titleLabel.text = page.title
        self.descriptionTextView.text = page.description
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        animation.removeFromSuperview()
//        titleLabel.text = ""
//        descriptionTextView.text = ""
//    }
//    
}
