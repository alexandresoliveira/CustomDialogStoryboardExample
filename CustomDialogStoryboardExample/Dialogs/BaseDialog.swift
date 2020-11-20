//
//  BaseDialog.swift
//  CustomDialogStoryboardExample
//
//  Created by Alexandre Oliveira on 19/11/20.
//  Copyright © 2020 Alexandre Oliveira. All rights reserved.
//

import Foundation
import UIKit

class BaseDialog: UIView {
    
    static let shared = BaseDialog()
    
    let baseDialogView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("BaseDialog", owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func commonInit() {
        self.frame = CGRect(
            x: 0,
            y: 0,
            width: UIScreen.main.bounds.width,
            height: UIScreen.main.bounds.height)
        self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.backgroundColor = .black
        self.alpha = 0.4
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismiss)))
    }
    
    func showAlert(view: UIView) {
        baseDialogView.backgroundColor = .white
        
        self.addSubview(baseDialogView)
        
        baseDialogView.translatesAutoresizingMaskIntoConstraints = false
        baseDialogView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        baseDialogView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        baseDialogView.widthAnchor.constraint(equalToConstant: 280).isActive = true
        
        baseDialogView.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: baseDialogView.topAnchor, constant: 0).isActive = true
        view.trailingAnchor.constraint(equalTo: baseDialogView.trailingAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: baseDialogView.bottomAnchor, constant: 0).isActive = true
        view.leadingAnchor.constraint(equalTo: baseDialogView.leadingAnchor, constant: 0).isActive = true
        
        UIApplication.shared.keyWindow?.addSubview(self)
    }
    
    @objc func dismiss() {
        dismissAlert()
    }
    
    func dismissAlert() {
        self.removeFromSuperview()
    }
}
