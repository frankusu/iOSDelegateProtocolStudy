//
//  ChooseSideController.swift
//  OnepieceDelegate
//
//  Created by Frank Su on 2020-02-23.
//  Copyright © 2020 frankusu. All rights reserved.
//

import UIKit
protocol SideSelectorDelegate {
    func didChooseSide(image: UIImage, name : String)
}
class SideSelectorController : UIViewController {
    
    var selectorDelegate : SideSelectorDelegate!
    
    let chooseSideLabel : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Choose a side"
        lb.textColor = .black
        lb.font = .boldSystemFont(ofSize: 28)
        return lb
    }()
    
    let marineButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "marine"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 150).isActive = true
        button.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(marineDidTap), for: .touchUpInside)
        return button
    }()
    
    let pirateButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "strawhat"), for: .normal)
        button.heightAnchor.constraint(equalToConstant: 180).isActive = true
        button.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(pirateDidTap), for: .touchUpInside)
        return button
    }()
    
    @objc private func marineDidTap() {
        selectorDelegate.didChooseSide(image: #imageLiteral(resourceName: "garp"), name: "Monkey D. Garp")
        dismiss(animated: true, completion: nil)
    }
    @objc private func pirateDidTap() {
        selectorDelegate.didChooseSide(image: #imageLiteral(resourceName: "luffy"), name: "Monkey D. Luffy")
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(chooseSideLabel)
        
        let sideStackView = UIStackView(arrangedSubviews: [
            marineButton,
            pirateButton
        ])
        sideStackView.axis = .vertical
        sideStackView.spacing = 20
        sideStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sideStackView)
        
        NSLayoutConstraint.activate([
            chooseSideLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            chooseSideLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            chooseSideLabel.heightAnchor.constraint(equalToConstant: 60),
            sideStackView.topAnchor.constraint(equalTo: chooseSideLabel.bottomAnchor, constant: 100),
            sideStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            sideStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            sideStackView.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
}
