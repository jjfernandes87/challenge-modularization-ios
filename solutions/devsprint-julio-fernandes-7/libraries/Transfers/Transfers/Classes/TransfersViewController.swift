//
//  TransfersViewController.swift
//  Transfers
//
//  Created by Gustavo Fernandes on 08/11/22.
//

import UIKit
import Confirmation


public class TransfersViewController: UIViewController {
    
    lazy var transferView: TransfersView = {
        
        let transferView = TransfersView()
        transferView.delegate = self
        return transferView
    }()
    
    override func loadView() {
        self.view = transferView
    }
}

extension TransfersViewController: TransferViewDelegate {
    
    public func didPressChooseContactButton() {
        
        let contactListViewController = ContactListViewController()
        contactListViewController.delegate = self
        let navigationController = UINavigationController(rootViewController: contactListViewController)
        self.present(navigationController, animated: true)
    }
    
    public func didPressTransferButton(with amount: String) {
        
        let confirmationViewController = ConfirmationViewController(amount: amount)
        let navigationController = UINavigationController(rootViewController: confirmationViewController)
        self.present(navigationController, animated: true)
    }
}

extension TransfersViewController: ContactListViewControllerDelegate {
    
    func didSelectContact() {
        
        self.dismiss(animated: true)
        
        let alertViewController = UIAlertController(title: "Contact selection", message: "A contact was selected", preferredStyle: .alert)
        let action = UIAlertAction(title: "Thanks", style: .default)
        alertViewController.addAction(action)
        self.present(alertViewController, animated: true)
    }
}
