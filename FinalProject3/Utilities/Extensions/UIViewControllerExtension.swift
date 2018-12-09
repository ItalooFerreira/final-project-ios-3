//
//  UIViewControllerExtension.swift
//  FinalProject3
//
//  Created by Ítalo Ferreira on 09/12/18.
//  Copyright © 2018 Ítalo Ferreira. All rights reserved.
//

import UIKit

extension UIViewController {
    
    var contents: UIViewController {
        return (self as? UINavigationController)?.viewControllers.first ?? self
    }
    
    func presentAlert(title: String, message: String) {
        let controller: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let doneAction: UIAlertAction = UIAlertAction(title: "Got it", style: .cancel, handler: nil)
        controller.view.tintColor = UIColor.black
        controller.addAction(doneAction)
        present(controller, animated: true)
    }
    
    func startLoading() {
        let loadingView = LoadingView(frame: view.bounds)
        view.addSubview(loadingView)
    }
    
    func stopLoading() {
        view.viewWithTag(LoadingView.tag)?.removeFromSuperview()
    }
}
