//
//  ViewController.swift
//  TheDoors
//
//  Created by Admin on 01.09.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let ve = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        ve.collectionView.delegate = self
        ve.collectionView.dataSource = self
        
        addSubview()
        setConstraint()
        action()
    }
  
    var myView: MainView = {
        let model: Model = Model()
        let rView = MainView(with: model)
        rView.translatesAutoresizingMaskIntoConstraints = false
        
        return rView
    }()

    //Функция нажатия на кнопку настроек
    @objc private func buttonTapped(sender: UIButton){
        print("Функционал в разработке")
    }
    
    /*
    @objc func labelTapped(_ sender: UITapGestureRecognizer){
        print("Функционал в разработке")
       // let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
    }
    
    
    
    func createTimer(){
         let timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(myTimer), userInfo: nil, repeats: false)
         DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {timer.fire()})
    }
    
    @objc func myTimer(){
      
    }
     
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createTimer()
    }
    */
  
    func addSubview(){
        view.addSubview(myView)
        view.addSubview(ve.settingButton)
        view.addSubview(ve.myView)
        view.addSubview(ve.myDoorLabel)
        view.addSubview(ve.titleImage)
        view.addSubview(ve.welcomeLabel)
        view.addSubview(ve.houseImageView)
        ve.myView.addSubview(ve.collectionView)
    }
    
    func setConstraint(){
        // Прорисовываю картинку с названием программы
        ve.titleImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(15)
            make.top.equalToSuperview().inset(40)
            make.width.equalTo(125)
            make.height.equalTo(35)
        }
        
        // Прорисовываю кнопоку настрек
        ve.settingButton.snp.makeConstraints{ make in
            make.width.height.equalTo(50)
            make.leading.equalTo(ve.titleImage.snp.trailing).offset(200)
            make.top.equalTo(50)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        // Прорисовываю Label с приветствием
        ve.welcomeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(200)
        }
        
        // Прописываю позицию для картинки с домиком
        ve.houseImageView.snp.makeConstraints{ make in
            make.leading.equalTo(ve.welcomeLabel.snp.trailing).offset(12)
            make.centerY.equalTo(ve.welcomeLabel.snp.centerY)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(225)
            make.height.equalTo(200)
        }
        
        ve.myDoorLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(ve.welcomeLabel.snp.bottom).offset(100)
        }
        
        ve.myView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(ve.myDoorLabel.snp.bottom).offset(5)
            make.height.equalTo(500)
        }
        
        ve.collectionView.snp.makeConstraints{make in
            make.top.equalTo(ve.myView.snp.top).inset(5)
            make.leading.trailing.equalToSuperview().inset(5)
            make.height.equalToSuperview().inset(5)
            make.bottom.equalToSuperview().inset(5)
        }
        
    }
    
    func action(){
        ve.settingButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside) //привязываю функционал для кнопки
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let model: Model = Model()
        return model.door.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model: Model = Model()
        //collectionView.scrollToItem(at: indexPath, at: .top, animated: true)
        collectionView.setNeedsLayout()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.doorTitleLabel.text = String("\(model.door[indexPath.item].doorTitle)")
    
        cell.doorDescrLabel.text = String("\(model.door[indexPath.item].doorDescr)")
        cell.doorDescrLabel.textColor = .gray
    
        cell.doorStateLabel.text = String("\(model.door[indexPath.item].doorState)")
        cell.doorStateLabel.textColor = .systemBlue
        cell.doorStateLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        cell.doorStateLabel.textAlignment = .center
        cell.doorStateLabel.isUserInteractionEnabled = true
        
        let gue = UITapGestureRecognizer(target: self, action: #selector(cell.labelTapped(_:)))
        cell.doorStateLabel.addGestureRecognizer(gue)
    
        cell.doorTitleLabel.snp.makeConstraints{ make in
            make.leading.top.equalToSuperview().inset(5)
        }
        cell.doorDescrLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().inset(5)
            make.top.equalTo(cell.doorTitleLabel.snp.bottom).offset(10)
        }
        cell.doorStateLabel.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
        cell.layer.cornerRadius = 15
        cell.backgroundColor = .white
        cell.layer.borderWidth = 1
        cell.layer.borderColor = CGColor(red: 224/255.0, green: 224/255.0, blue: 224/255.0, alpha: 1.0)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 50, height: 150)
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let doorIsLocked = "Locked"
        let doorIsUnlocked = "Unlocked"
        let doorIsUnlocking = "Unlocking..."
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        cell.doorStateLabel.text! = String("Unlocking...")
        let doorIs = cell.doorStateLabel.text!
      
        if doorIs == doorIsUnlocking {
           let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
                cell.doorStateLabel.text = doorIsUnlocked
               let timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { timer in
                   cell.doorStateLabel.text = doorIsLocked
               }
           }
        }
        else{
           cell.doorStateLabel.text = doorIsLocked
        }
   }
}
