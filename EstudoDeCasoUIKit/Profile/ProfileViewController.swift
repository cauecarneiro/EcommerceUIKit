//
//  ProfileViewController.swift
//  EstudoDeCasoUIKit
//
//  Created by Cauê Carneiro on 14/05/26.
//

import UIKit

// MARK: - Implementação via UIKit ViewCode
class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Perfil"
        setupView()
        setupHierarchy()
        setupConstraints()
    }

    // MARK: - Setup

    private func setupView() {
        view.backgroundColor = .systemBackground
    }

    private func setupHierarchy() {
        // Adicione subviews aqui
    }

    private func setupConstraints() {
        // Configure constraints aqui
    }
}
