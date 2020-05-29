//
//  ViewController.swift
//  Tags
//
//  Created by Tatevik Tovmasyan on 5/26/20.
//  Copyright © 2020 Helix Consulting LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    var tagCells: [TagCollectionViewCell] = []
    var tags: [String] = ["Fix you",
                             "Burn my bridges down",
                             "Lose Somebody",
                             "Paradise",
                             "Paris in the rain",
                             "Lights will guide you home",
                             "Who are you?",
                             "Fake love",
                             "Better days",
                             "Doin time",
                             "Lost on you",
                             "Monster",
                             "Say something I am giving up on you",
                             "AI",
                             "Tear",
                             "Ugh",
                             "Take my hand now",
                             "Ocean eyes",
                             "Bellyache",
                             "Lie",
                             "Mama",
                             "Mocking bird",
                             "Demian",
                             "Thank u, next",
                             "Demons",
                             "Do I wanna know?"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configCollectionView()
        self.configCells()
    }
    
    func configCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "default")
        self.collectionView.setCollectionViewLayout(UICollectionViewFlowLayout(), animated: false)
    }
    
    func configCells() {
        self.tagCells = tags.enumerated().map({ (index, option) -> TagCollectionViewCell in
            let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "default", for: IndexPath(item: index, section: 0)) as! TagCollectionViewCell
            cell.config(info: option)
            return cell
        })
        
        let optimalCells = self.collectionView.getOptimalCells(self.tagCells, maxWidth: UIScreen.main.bounds.width)
        self.tagCells = optimalCells.reduce(into: [TagCollectionViewCell](), { (cells, resultCells) in
            cells.append(resultCells)
        }) as! [TagCollectionViewCell]
        self.collectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tagCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return self.tagCells[indexPath.item]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = tagCells[indexPath.item]
        return cell.intrinsicContentSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
}
