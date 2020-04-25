//
//  ViewController.swift
//  UserOnboarding
//
//  Created by Shubham Singh on 24/04/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK:- outlets for the viewController
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var getStartedButton: UIButton!
    
    // data for the Onboarding Screens
    let pages: [Page] = [Page(animationName: "animation1", title: "Learn to Code", description: "Find awesome tutorials on how to code and improve your coding practices"), Page(animationName: "animation2", title: "Code with Friends", description: "Practice with friends and solve problems together to earn points"),  Page(animationName: "animation3", title: "Always there to Help", description: "Having Trouble? Get guidance from our experienced Mentors")]
    
    
    // MARK:- lifeCycle methods for the ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for making the get started button rounded
        self.getStartedButton.layer.cornerRadius = 20
    
        // customizing the collectionView
        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: OnboardingCollectionViewCell.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
    }
    
    // MARK:- outlet functions for the viewController
    @IBAction func pageChanged(_ sender: Any) {
        let pc = sender as! UIPageControl
        
        // scrolling the collectionView to the selected page
        collectionView.scrollToItem(at: IndexPath(item: pc.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func getStartedButtonTapped(_ sender: Any) {
        // move the user to the other view controller
        print("Move to other view controller")
    }
    
    
    
    // MARK:- collectionView dataSource & collectionView FlowLayout delegates
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        cell.configureCell(page: pages[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    
    // for updating the page control
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = collectionView.indexPathsForVisibleItems[0].item
    }
    
}

