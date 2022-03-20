//
//  ViewController.swift
//  MyMaterialDesignApp
//
//  Created by 山本響 on 2022/03/20.
//

import UIKit
import MaterialComponents.MaterialActionSheet

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let button = UIButton(frame: CGRect(x: (view.frame.size.width - 220)/2,
                                            y: 100,
                                            width: 220,
                                            height: 50))
        button.setTitle("Alert", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self,
                         action: #selector(didTapAlert),
                         for: .touchUpInside)
        view.addSubview(button)
        
        let sheetButton = UIButton(frame: CGRect(x: (view.frame.size.width - 220)/2,
                                            y: 200,
                                            width: 220,
                                            height: 50))
        sheetButton.setTitle("ActionSheet", for: .normal)
        sheetButton.backgroundColor = .systemBlue
        sheetButton.addTarget(self,
                         action: #selector(didTapActionSheet),
                         for: .touchUpInside)
        view.addSubview(sheetButton)
    }
    
    @objc private func didTapAlert() {
        // Present a modal alert
        let alertController = MDCAlertController(title: "Log Out",
                                                 message: "Are you sure you would like to log out?")
        alertController.backgroundColor = .systemBackground
        alertController.titleColor = .label
        alertController.messageColor = .secondaryLabel
        alertController.buttonTitleColor = .link
        let action1 = MDCAlertAction(title:"Cancel") { (action) in print("OK") }
        let action2 = MDCAlertAction(title:"Log Out", emphasis: .high) { (action) in
            print("OK")
        }
        alertController.addAction(action2)
        alertController.addAction(action1)

        present(alertController, animated:true, completion: nil)
    }
    
    @objc private func didTapActionSheet() {
        let actionSheet = MDCActionSheetController(title: "Action Sheet",
                                                   message: "Secondary line text")
        actionSheet.backgroundColor = .systemBackground
        actionSheet.titleTextColor = .label
        actionSheet.messageTextColor = .secondaryLabel
        actionSheet.actionTintColor = .label
        actionSheet.actionTextColor = .label
        let actionOne = MDCActionSheetAction(title: "Home",
                                             image: UIImage(systemName: "house"),
                                             handler: { _ in print("Home action") })
        let actionTwo = MDCActionSheetAction(title: "Settings",
                                             image: UIImage(systemName: "gear"),
                                             handler: { _ in  print("Email action") })
        actionSheet.addAction(actionOne)
        actionSheet.addAction(actionTwo)

        present(actionSheet, animated: true, completion: nil)
    }
}

