//
//  LeftViewController.swift
//  testTabBar
//
//  Created by Lisbeth Eslava on 9/03/20.
//  Copyright © 2020 Lisbeth Eslava. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var navBarTitle: UILabel!
    
    var fabric: FabricMovie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fabric = FabricMovie(tipo: 1, completion: {
            self.newsTableView.reloadData()
        })
       // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView(){
        newsTableView.register(UINib(nibName: MovieTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MovieTableViewCell.identifier)
        newsTableView.dataSource = self
        newsTableView.delegate = self
        navBarTitle.text = "Top Rated Movies"
    }

}

extension LeftViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fabric != nil ? fabric!.getLengthMoviesTR() : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        cell.titleLabel.text = fabric!.moviesTR.movies![indexPath.row].title
        cell.descriptionLabel.text = "Year: \(fabric!.moviesTR.movies![indexPath.row].getYearMovie())"
        cell.posterImageView.downloadedFrom(link: fabric!.moviesTR.movies![indexPath.row].getUrlImage(jpg: fabric!.moviesTR.movies![indexPath.row].poster_path!))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.newsTableView.bounds.height * 0.15
    }
    
    
}
