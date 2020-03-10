//
//  RightViewController.swift
//  testTabBar
//
//  Created by Lisbeth Eslava on 9/03/20.
//  Copyright © 2020 Lisbeth Eslava. All rights reserved.
//

import UIKit

class RightViewController: UIViewController {
    
    @IBOutlet weak var seriesCollectionView: UICollectionView!
    @IBOutlet weak var seriesTitleLabel: UILabel!
    
    var fabric: FabricMovie?

    override func viewDidLoad() {
        super.viewDidLoad()
        fabric = FabricMovie(tipo: 2, completion: {
            self.seriesCollectionView.reloadData()
        })
        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView(){
        seriesCollectionView.register(UINib(nibName: SeriesCell.identifier, bundle: nil), forCellWithReuseIdentifier: SeriesCell.identifier)
        seriesCollectionView.delegate = self
        seriesCollectionView.dataSource = self
        seriesTitleLabel.text = "Top Rated Series"
    }

}

extension RightViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fabric != nil ? fabric!.getLengthSeriesTR() : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeriesCell.identifier, for: indexPath) as! SeriesCell
        cell.serieImageView.downloadedFrom(link: fabric!.seriesTR.movies![indexPath.row].getUrlImage(jpg: fabric!.seriesTR.movies![indexPath.row].poster_path!))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destination = DetailView()
        let navigation = UINavigationController(rootViewController: destination)
        navigation.modalPresentationStyle = .overFullScreen
       // self.present(navigation, animated: true, completion: nil)
    }
}
