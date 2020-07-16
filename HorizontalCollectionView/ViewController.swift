//
//  ViewController.swift
//  flowlayout
//
//  Created by Inpyo Hong on 2020/07/15.
//  Copyright © 2020 Inpyo Hong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    var collectionView: UICollectionView?
    var collectionLayout: HorizontalCollectionViewLayout = HorizontalCollectionViewLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        /*
         *
            |<-------     view width     -------->|
            ---------------------------------------
            |                                     |
            |<-w0->|<ws>|<--   wi  -->|<ws>|<-w0->|
     ---------------    ---------------    ---------------
     |             |    |             |    |             |
     |             |    |             |    |             |
     ---------------    ---------------    ---------------
            |                                     |
            |                                     |
            ---------------------------------------
         *
         * w0: itemEdgeOffset
         * ws: space
         * wi: itemWidth
         * in this example: ws == w0
         */
 
        let space: CGFloat                  = 0
        
        self.view                           = UIView(frame: self.view.bounds)
        self.view.backgroundColor           = .black
        
        let collectionFrame                 = self.view.bounds
        
        self.collectionView                 = UICollectionView(frame: collectionFrame, collectionViewLayout: collectionLayout)
       
        
        collectionView?.register(UINib(nibName: "WLCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CELL")
        collectionView?.backgroundColor     = self.view.backgroundColor
        collectionView?.dataSource          = self
        collectionView?.isPagingEnabled     = false
        collectionView?.contentInset        = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionLayout.scrollDirection    = .horizontal
        collectionLayout.itemSize           = self.view.frame.size
        collectionLayout.minimumLineSpacing = space
        
        self.view.addSubview(self.collectionView!)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if let cell: WLCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath) as? WLCollectionCell {
//
//            return cell
//        }
//
//        return UICollectionViewCell()
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath) as? WLCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}
