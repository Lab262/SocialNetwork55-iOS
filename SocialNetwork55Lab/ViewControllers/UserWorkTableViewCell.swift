//
//  UserWorkTableViewCell.swift
//  SocialNetwork55Lab
//
//  Created by Huallyd Smadi on 13/03/17.
//  Copyright © 2017 Lab262. All rights reserved.
//

import UIKit

class UserWorkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var arrayImages: [UIImage]?
    
    static var identifier: String {
        return "userWorkTableCell"
    }
    
    static var cellHeight: CGFloat {
        return 50.0
    }
    
    static var nibName: String {
        return "UserWorkTableViewCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        registerNibs()
        dummyContent()
    }
    
    func dummyContent() {
        arrayImages = [#imageLiteral(resourceName: "user-work-default"), #imageLiteral(resourceName: "user-work-default-2"), #imageLiteral(resourceName: "user-work-default-3"), #imageLiteral(resourceName: "user-work-default-4"), #imageLiteral(resourceName: "user-work-default-5"), #imageLiteral(resourceName: "user-work-default-6"), #imageLiteral(resourceName: "user-work-default-7"), #imageLiteral(resourceName: "user-work-default-8")]
    }
    
    func registerNibs() {
        collectionView.registerNibFrom(UserWorkCollectionViewCell.self)
    }
}

extension UserWorkTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserWorkCollectionViewCell.identifier, for: indexPath) as! UserWorkCollectionViewCell
        
        cell.photoButton.setImage(arrayImages?[indexPath.row], for: .normal)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrayImages!.count
    }
}

extension UserWorkTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 60.0, height: 60.0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30.0
    }
    
    
}

