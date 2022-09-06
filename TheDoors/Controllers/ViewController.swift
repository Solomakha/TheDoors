//
//  ViewController.swift
//  TheDoors
//
//  Created by Admin on 01.09.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(myView)
        view.addSubview(settingButton)
        
        // Прорисовываю кнопоку настрек
        settingButton.snp.makeConstraints{ make in
            make.width.height.equalTo(50)
            make.leading.equalTo(myView.titleImage.snp.trailing).offset(200)
            make.top.equalTo(50)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        settingButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
  
    var myView: MainView = {
        let model: Model = Model()
        let rView = MainView(with: model)
        rView.translatesAutoresizingMaskIntoConstraints = false
        
        return rView
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
    
    //Функция нажатия на кнопку настроек
    @objc private func buttonTapped(sender: UIButton){
        print("Функционал в разработке")
    }
}
