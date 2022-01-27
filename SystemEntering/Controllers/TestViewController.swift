//
//  TestViewController.swift
//  SystemEntering
//
//  Created by Александр Александров on 06.01.2022.
//

import Foundation
import UIKit

class TestViewController: UIViewController {
    
 let a = SystemEnteringElectronicSignatureView()
    
    let stackV: UIStackView = {
        let stView = UIStackView()
        stView.axis = .vertical
        stView.distribution = .fillEqually
        stView.alignment = .fill
        stView.spacing = 20
        return stView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackV.addArrangedSubviews(views: [a])
        view.addSubview(stackV)
        const()
    }
    
    func const() {
        stackV.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.leading.trailing.equalTo(view).inset(8)
        }
    }
}
