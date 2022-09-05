//
//  MainView.swift
//  TheDoors
//
//  Created by Admin on 01.09.2022.
//

import UIKit
import SnapKit

class MainView: UIView {
   
    public var myView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
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
    private var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    //Инициализирую подпись коллекции
    private var myDoorLabel: UILabel = {
        let label = UILabel()
        label.text = "My Door"
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 1
        return label
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
    
    var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), collectionViewLayout: layout)
        collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .gray
        //collection.scrollToItem(at: IndexPath(item: 1, section: 0), at: .centeredHorizontally, animated: true)
       return collection
    }()
    
    /*
     var scrollView: UIScrollView = {
         let scrollView = UIScrollView()
         scrollView.backgroundColor = .green
         scrollView.frame = view.bounds
         scrollView.contentSize = contentSize
         return scrollView
     }()
     var contentView: UIView = {
         let contentView = UIView()
         contentView.backgroundColor = .red
         contentView.frame.size = contentSize
         return contentView
     }()
     var stackView: UIStackView = {
         let stackView = UIStackView()
         stackView.axis = .vertical
         stackView.alignment = .center
         stackView.spacing = 20
         return stackView
     }()
     
     public var contentSize: CGSize{
         CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
     }
     
     */
    
    override init (frame: CGRect){
        super.init(frame: frame)
        collectionView.delegate = self
        collectionView.dataSource = self
        self.addView()
        self.setConstraint()
       
        //settingButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    public convenience init (with model: Model){
        self.init(frame: .zero)
        //self.imageView.image = UIImage(named: model.doorImgNAme)
        //self.doorTitleLabel.text = model.door[1].doorTitle
        //self.doorDescrLabel.text = model.door[1].doorDescr
        self.buttonTapped()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addView(){
        addSubview(welcomeLabel)
        addSubview(myView)
        addSubview(settingButton)
        addSubview(titleImage)
        addSubview(houseImageView)
        addSubview(myDoorLabel)
        addSubview(collectionView)
        //addSubview(scrollView)
        myView.addSubview(collectionView)
        //scrollView.addSubview(collectionView)
        //addSubview(stackView)
        //collectionView.addSubview(stackView)
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
        myDoorLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(welcomeLabel.snp.bottom).offset(100)
        }
        
        myView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(myDoorLabel.snp.bottom).offset(5)
            make.height.equalTo(500)
        }
        /*scrollView.snp.makeConstraints{ make in
            make.top.equalTo(myView.snp.top).inset(5)
            make.leading.trailing.equalToSuperview().inset(5)
            make.height.equalToSuperview().inset(5)
        }
        */
        collectionView.snp.updateConstraints{make in
            make.top.equalTo(myView.snp.top).inset(5)
            make.leading.trailing.equalToSuperview().inset(5)
            make.height.equalToSuperview().inset(5)
        }
        
        

    }
    //Функция нажатия на кнопку настроек
    @objc private func buttonTapped(){
        print("Функционал в разработке")
    }
    
    
}

extension MainView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let model: Model = Model()
        return model.door.count
       
    }
    
    
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let model: Model = Model()
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
    cell.doorTitleLabel.text = String("\(model.door[indexPath.item].doorTitle)")
    cell.doorDescrLabel.text = String("\(model.door[indexPath.item].doorDescr)")
    
    cell.awakeFromNib()
    return cell
}
   /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
    */
}
