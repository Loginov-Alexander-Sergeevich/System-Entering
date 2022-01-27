//
//  SystemEnteringElectronicSignatureView.swift
//  SystemEntering
//
//  Created by Александр Александров on 18.01.2022.
//

import Foundation
import UIKit

class SystemEnteringElectronicSignatureView: LoginSystemBaseExpandView {

    // Создать view поожить эелементы в созданную view и эту вью положить в первый стек потом положить туда стек2
    
    let infoView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = CGColor(gray: 100/110, alpha: 5)
        view.layer.cornerRadius = 12
        return view
    }()
    
    let infoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "warningSigns")
        return image
    }()
    
    let infoWarningLabel: UILabel = {
        let label = UILabel()
        label.text = "Функция будет работать только при наличии электроноой подписи"
        label.numberOfLines = 0
        return label
    }()
    
    let infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("как получить", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView1()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setView1() {
        addSubviews(views: [infoView])
        infoView.addSubviews(views: [infoImage, infoWarningLabel, infoButton])
        stack1.addArrangedSubviews(views: [infoView, siporatorView2, stack2])
        
    }
    
    func setConstraints() {
        
        infoView.snp.makeConstraints { make in
            make.height.equalTo(150)
        }
        
        siporatorView2.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        infoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
        }
        
        infoWarningLabel.snp.makeConstraints { make in
            make.leading.equalTo(infoImage.snp.trailing).offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(infoImage.snp.top)
        }
        
        infoButton.snp.makeConstraints { make in
            make.leading.equalTo(infoImage.snp.trailing).offset(20)
            make.top.equalTo(infoWarningLabel.snp.bottom).offset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}
