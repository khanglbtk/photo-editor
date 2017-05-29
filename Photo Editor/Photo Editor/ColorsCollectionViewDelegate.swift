//
//  ColorsCollectionViewDelegate.swift
//  Photo Editor
//
//  Created by Mohamed Hamed on 5/1/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit

protocol ColorDelegate {
    func chosedColor(color: UIColor)
}

class ColorsCollectionViewDelegate: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var colorDelegate : ColorDelegate?
    
    let colors = [UIColor.black, UIColor.darkGray, UIColor.gray, UIColor.lightGray, UIColor.white
        , UIColor(red: 0.000, green:0.479, blue:0.999, alpha:1.00)
        , UIColor(red:0.298, green:0.850, blue:0.390, alpha:1.00)
        , UIColor(red:0.999, green:0.230, blue:0.189, alpha:1.00)
        , UIColor(red:1.000, green:0.801, blue:0.005, alpha:1.00)
        , UIColor(red: 0.989, green: 0.486, blue: 0.258, alpha: 1.0)
        , UIColor(red:0.346, green:0.335, blue:0.840, alpha:1.00)
        , UIColor(red:0.346, green:0.335, blue:0.840, alpha:1.00)
        , UIColor(red:0.999, green:0.174, blue:0.335, alpha:1.00)
    ]
    
    override init() {
        super.init()
    }
    
    var stickerDelegate : StickerDelegate?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        colorDelegate?.chosedColor(color: colors[indexPath.item])
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCollectionViewCell", for: indexPath) as! ColorCollectionViewCell
        cell.colorView.backgroundColor = colors[indexPath.item]
        return cell
    }
    
}
