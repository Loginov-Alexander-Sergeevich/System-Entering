//
//  SystemEnteringViewController.swift
//  SystemEntering
//
//  Created by Александр Александров on 30.12.2021.
//

import Foundation
import UIKit
import SnapKit

class SystemEnteringViewController: UIViewController {
    
    /// UIScrollView
    let scrollView: UIScrollView = {
        let skroll = UIScrollView()
        skroll.alwaysBounceVertical = true
        skroll.clipsToBounds = true
        return skroll
    }()

    var loginSystemBaseView = LoginSystemBaseView()
    
    /// UIView
    var systemEnteringMobileView = SystemEnteringMobileView()
    
    /// UIView
    let systemEnteringElectronicSignatureView = SystemEnteringElectronicSignatureView()
    
    /// UIView
    let emailNotificationView = EmailNotificationView()
    
    /// UIView
    let securityQuestionView = SecurityQuestionView()

    /// UIStackView
    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Расположи элементы на View
        setView()
        // Установи ограничения
        configureConstraints()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Тайтл view
        navigationItem.title = "Вход в систему"
    }


    /// Расположи элементы на View
    private func setView() {
        view.addSubview(scrollView)
        
        stackView.addArrangedSubview(systemEnteringMobileView)
        stackView.addArrangedSubview(systemEnteringElectronicSignatureView)
        stackView.addArrangedSubview(emailNotificationView)
        stackView.addArrangedSubview(securityQuestionView)
        
        scrollView.addSubview(stackView)
        
    }
    

    
    /// Установи ограничения
    private func configureConstraints() {
        
        scrollView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview()

        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.top)
            make.bottom.equalToSuperview()
            make.leading.trailing.equalTo(view).inset(8)
        }
    }
}
