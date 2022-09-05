//
//  ViewController.swift
//  TheDoors
//
//  Created by Admin on 01.09.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var collectionView: UICollectionView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(myView)
    }
  
    var myView: MainView = {
        let model: Model = Model()
        let rView = MainView(with: model)
        rView.translatesAutoresizingMaskIntoConstraints = false
        return rView
    }()

    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
    }
}
