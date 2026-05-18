//
//  CartViewController.swift
//  EstudoDeCasoUIKit
//
//  Created by Cauê Carneiro on 14/05/26.
//
//  Implementação via SwiftUI com ciclo de vida UIKit

import UIKit
import SwiftUI

class CartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Carrinho"
        embedSwiftUIView()
    }

    private func embedSwiftUIView() {
        let hostingController = UIHostingController(rootView: CartView())

        addChild(hostingController)
        view.addSubview(hostingController.view)

        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        hostingController.didMove(toParent: self)
    }
}
