//
//  MainView.swift
//  TheDoors
//
//  Created by Admin on 01.09.2022.
//

import UIKit
import SnapKit

class MainView: UIView {
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
    private var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    //
    lazy var doorTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    //
    lazy var doorDescrLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textAlignment = .left
        label.textColor = .gray
        label.numberOfLines = 1
        return label
    }()
    //
    lazy var doorStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [doorTitleLabel, doorDescrLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()
    // Инициализирую кнопку настроек
    private var settingButton: UIButton = {
        let image = UIImage(named: "Setting_img")
        let settingButton = UIButton(type: .system)
        settingButton.backgroundColor = .green
        settingButton.layer.cornerRadius = 15
        settingButton.setTitle("", for: .normal)
        settingButton.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
        return settingButton
    }()
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
       // collection.delegate = self
       // collection.dataSource = self
        collection.backgroundColor = .gray
        return collection
    }()
    
    override init (frame: CGRect){
        super.init(frame: frame)
        self.addView()
        self.setConstraint()
        self.buttonTapped()
        settingButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    public convenience init (with model: Model){
        self.init(frame: .zero)
        //self.imageView.image = UIImage(named: model.doorImgNAme)
        self.doorTitleLabel.text = model.door[1].doorTitle
        self.doorDescrLabel.text = model.door[1].doorDescr
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addView(){
        addSubview(welcomeLabel)
        addSubview(doorTitleLabel)
        addSubview(doorStackView)
        addSubview(collectionView)
        addSubview(settingButton)
        addSubview(titleImage)
        addSubview(houseImageView)
    }
     
    private func setConstraint(){
        // Прорисовываю картинку с названием программы
        titleImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(40)
            make.width.equalTo(125)
            make.height.equalTo(35)
        }
        // Прорисовываю кнопоку настрек
        settingButton.snp.makeConstraints{ make in
            make.width.height.equalTo(50)
            make.leading.equalTo(titleImage.snp.trailing).offset(200)
            make.top.equalTo(50)
            make.trailing.equalToSuperview().offset(-20)
        }
        // Прорисовываю Label с приветствием
        welcomeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(200)
        }
        // Прописываю позицию для картинки с домиком
        houseImageView.snp.makeConstraints{ make in
            make.leading.equalTo(welcomeLabel.snp.trailing).offset(12)
            make.centerY.equalTo(welcomeLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(225)
            make.height.equalTo(200)
        }
        
        /*
        doorStackView.snp.makeConstraints{ make in
            make.leading.top.equalTo(60)
            make.centerX.equalTo(welcomeLabel.snp.centerX)
            make.trailing.equalToSuperview().offset(-20)
        }
        
       
         */
        //settingButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    //Функция нажатия на кнопку настроек
    @objc private func buttonTapped(){
        print("Функционал в разработке")
    }
    
}
