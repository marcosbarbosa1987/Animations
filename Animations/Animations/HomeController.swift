//
//  HomeController.swift
//  Animations
//
//  Created by Marcos Barbosa on 01/08/18.
//  Copyright © 2018 Marcos Barbosa. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    var viewPulse: UIView = {
        var view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 0.3
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var booleanViewPulse = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(viewPulse)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.barTintColor = UIColor.gray
    }
    
    override func viewWillLayoutSubviews() {
        
        viewPulse.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        viewPulse.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        viewPulse.widthAnchor.constraint(equalToConstant: 200).isActive = true
        viewPulse.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
         pulseInOutAnimation()
    }

    internal func pulseInOutAnimation(){
        
        if booleanViewPulse{
            UIView.animate(withDuration: 0.5) {
                self.viewPulse.transform.scaledBy(x: 0.7, y: 0.7)
                self.view.layoutIfNeeded()
            }
        }else{
            UIView.animate(withDuration: 0.5) {
                self.viewPulse.transform.scaledBy(x: 1.0, y: 1.0)
                self.view.layoutIfNeeded()
            }
        }
        
        booleanViewPulse = !booleanViewPulse
        
    }
    
}

