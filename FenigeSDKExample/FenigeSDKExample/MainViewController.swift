//
//  MainViewController.swift
//  FenigeSDKExample
//
//  Created by Dmytro Onyshchuk on 30.05.2024.
//

import UIKit
import FenigeSDK

final class MainViewController: UIViewController {
	
	private let fenigeSDKInstance = Fenige()
	private var transactionLabel: UILabel?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		let createPaymentButton = UIButton(type: .system)
		createPaymentButton.setTitle("Create Payment", for: .normal)
		createPaymentButton.backgroundColor = .systemBlue
		createPaymentButton.setTitleColor(.white, for: .normal)
		createPaymentButton.layer.cornerRadius = 10
		createPaymentButton.translatesAutoresizingMaskIntoConstraints = false
		createPaymentButton.addTarget(self, action: #selector(createPaymentButtonAction), for: .touchUpInside)
		
		view.addSubview(createPaymentButton)
		
		NSLayoutConstraint.activate([
			createPaymentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			createPaymentButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			createPaymentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			createPaymentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
			createPaymentButton.heightAnchor.constraint(equalToConstant: 50)
		])
	}
	
}

// MARK: Actions
private extension MainViewController {
	
	@objc private func createPaymentButtonAction() {
		createPayment()
	}
	
}

// MARK: Private functions
private extension MainViewController {
	
	private func createPayment() {
		
		let redirectUrl = RedirectUrl(successUrl: "https://paytool-dev.fenige.pl/demo/?success=1",
									  failureUrl: "https://paytool-dev.fenige.pl/demo/?success=0")
		
		let address = Address(countryCode: "PL",
							  city: "Testowo",
							  postalCode: "12-345",
							  street: "Testowa",
							  houseNumber: "1")
		
		let sender = Sender(firstName: "Test",
							lastName: "Testowy",
							address: address)
		
		let payment = Payment(transactionId: "0000-0000-0000-0000-0000",
							  currencyCode: "USD",
							  amount: 10,
							  description: "Test transaction",
							  formLanguage: "en",
							  redirectUrl: redirectUrl,
							  sender: sender,
							  merchantUrl: "https://paytool-dev.fenige.pl/demo/",
							  orderNumber: "1")
		
		fenigeSDKInstance.initPayment(apiKey: "0000-0000-0000-0000-0000", payment: payment, containerViewController: self, completion: { [weak self] (transactionId: String?) in
			let transactionIdText = transactionId ?? "NIL"
			print("Transaction ID: " + transactionIdText)
			self?.displayTransactionId(transactionIdText)
		})
		
	}
	
	private func displayTransactionId(_ transactionId: String) {
		
		transactionLabel?.removeFromSuperview()
		
		let label = UILabel()
		label.text = "Transaction ID: \(transactionId)"
		label.textColor = .black
		label.textAlignment = .center
		label.numberOfLines = 0
		label.font = .boldSystemFont(ofSize: 16)
		label.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(label)
		
		NSLayoutConstraint.activate([
			label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
			label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
		])
		
		transactionLabel = label
	}
	
}
