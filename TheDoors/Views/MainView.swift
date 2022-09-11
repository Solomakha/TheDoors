//
//  MainView.swift
//  TheDoors
//
//  Created by Admin on 01.09.2022.
//

import UIKit
import SnapKit

class MainView: UIView{
   
    //var collectionView: UICollectionView!
    lazy var myView: UIView = {
        let view = UIView()
        view.frame = .zero
        return view
    }()
    
    //Инициализирую картинку с названием программы
    lazy var titleImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Logo"))
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        return imageView
        }()
    //Инициализирую картинку с домиком
    lazy var houseImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "House"))
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        return imageView
        }()
    //Инициализирую надпись приветствия
    lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    //Инициализирую подпись коллекции
    lazy var myDoorLabel: UILabel = {
        let label = UILabel()
        label.text = "My Doors"
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 1
        label.isUserInteractionEnabled = true
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        var layout : UICollectionViewFlowLayout {
                let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
                let boundSize: CGSize = UIScreen.main.bounds.size
                layout.itemSize = CGSize(width: boundSize.width, height: 50)
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 5
            layout.minimumInteritemSpacing = 5
                return layout
            }
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.reloadData()
        return collectionView
    }()
    
    // Инициализирую кнопку настроек
    lazy var settingButton: UIButton = {
        let image = UIImage(named: "Setting_img")
        let settingButton = UIButton(type: .system)
        settingButton.backgroundColor = .green
        settingButton.layer.cornerRadius = 15
        settingButton.setTitle("", for: .normal)
        settingButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        return settingButton
    }()
    
    override init (frame: CGRect){
        super.init(frame: frame)
        self.addView()
    
    }
    
    public convenience init (with model: Model){
        self.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addView(){
        addSubview(welcomeLabel)
        addSubview(myView)
        addSubview(titleImage)
        addSubview(houseImageView)
        addSubview(myDoorLabel)
        addSubview(collectionView)
        addSubview(settingButton)
    }

}
