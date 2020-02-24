//
//  ViewController.swift
//  OnepieceDelegate
//
//  Created by Frank Su on 2020-02-23.
//  Copyright © 2020 frankusu. All rights reserved.
//

import UIKit
let marineNotificationKey = "com.frankusu.marine"
let pirateNotificationKey = "com.frankusu.pirate"

class BaseController: UIViewController {
    //Demonstrate Notification/Observer comminucation pattern
    let marine = Notification.Name(rawValue: marineNotificationKey)
    let pirate = Notification.Name(rawValue: pirateNotificationKey)
    
    let logo : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = #imageLiteral(resourceName: "onepiece")
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    
    let button : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Choose Side", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 24)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(chooseSide), for: .touchUpInside)
        return button
    }()
    
    @objc func chooseSide() {
        let vc = SideSelectorController()
        vc.modalPresentationStyle = .fullScreen
        vc.selectorDelegate = self
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logo)
        view.addSubview(nameLabel)
        view.addSubview(button)
        
        //Comment this out to use delegate/protocol method. Uncomment delegate calls in SideSelectorController
        createObservers()
        
        NSLayoutConstraint.activate([
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logo.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            logo.heightAnchor.constraint(equalToConstant: 300),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: logo.bottomAnchor,constant: 40),
            button.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 250),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80)
        ])
    }
    //MARK: Observers
    //Redundent way to demonstrate one to many communication pattern
    func createObservers() {
        //marine
        NotificationCenter.default.addObserver(self, selector: #selector(updateCharacterImage), name: marine, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateCharacterName), name: marine, object: nil)
        //pirate
        NotificationCenter.default.addObserver(self, selector: #selector(updateCharacterImage), name: pirate, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateCharacterName), name: pirate, object: nil)
    }
    
    @objc func updateCharacterImage(notification : NSNotification) {
        let isMarine = notification.name == marine
        let character = isMarine ? #imageLiteral(resourceName: "garp") : #imageLiteral(resourceName: "luffy")
        logo.image = character
    }
    
    @objc func updateCharacterName(notification : NSNotification) {
        let isMarine = notification.name == marine
        let charName = isMarine ? "Garp the Legend" : "Lucy"
        nameLabel.text = charName
        
    }
}

extension BaseController : SideSelectorDelegate {
    func didChooseSide(image: UIImage, name: String) {
        logo.image = image
        nameLabel.text = name
    }
}
