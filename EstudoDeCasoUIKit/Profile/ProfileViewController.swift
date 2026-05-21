//
//  ProfileViewController.swift
//  EstudoDeCasoUIKit
//
//  Created by Cauê Carneiro on 14/05/26.
//  Implementação via UIKit ViewCode

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Views

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    // MARK: - Data

    private let menuSections: [(title: String, items: [(icon: String, label: String)])] = [
        ("Minha Conta", [
            ("shippingbox", "Meus Pedidos"),
            ("heart", "Favoritos"),
            ("mappin", "Endereços"),
        ]),
        ("Configurações", [
            ("bell", "Notificações"),
            ("questionmark.circle", "Ajuda"),
            ("arrow.right.square", "Sair"),
        ]),
    ]

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Perfil"
        view.backgroundColor = .systemGroupedBackground
        setupTableView()
        setupHeaderView()
    }

    // MARK: - Setup

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    private func setupHeaderView() {
        let header = UIView()
        header.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 180)

        let avatarImageView = UIImageView()
        avatarImageView.image = nil
        avatarImageView.backgroundColor = .systemIndigo
        avatarImageView.layer.cornerRadius = 40
        avatarImageView.clipsToBounds = true
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false

        let initialsLabel = UILabel()
        initialsLabel.text = "CC"
        initialsLabel.font = .systemFont(ofSize: 28, weight: .bold)
        initialsLabel.textColor = .white
        initialsLabel.textAlignment = .center
        initialsLabel.translatesAutoresizingMaskIntoConstraints = false

        let nameLabel = UILabel()
        nameLabel.text = "Cauê Carneiro"
        nameLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        let emailLabel = UILabel()
        emailLabel.text = "caue@email.com"
        emailLabel.font = .systemFont(ofSize: 14)
        emailLabel.textColor = .secondaryLabel
        emailLabel.textAlignment = .center
        emailLabel.translatesAutoresizingMaskIntoConstraints = false

        avatarImageView.addSubview(initialsLabel)
        header.addSubview(avatarImageView)
        header.addSubview(nameLabel)
        header.addSubview(emailLabel)

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: header.topAnchor, constant: 24),
            avatarImageView.centerXAnchor.constraint(equalTo: header.centerXAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 80),
            avatarImageView.heightAnchor.constraint(equalToConstant: 80),

            initialsLabel.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor),
            initialsLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),

            nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -16),

            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            emailLabel.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 16),
            emailLabel.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: -16),
        ])

        tableView.tableHeaderView = header
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return menuSections.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menuSections[section].title
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuSections[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        let item = menuSections[indexPath.section].items[indexPath.row]

        var config = cell.defaultContentConfiguration()
        config.text = item.label
        config.image = UIImage(systemName: item.icon)
        cell.contentConfiguration = config
        cell.accessoryType = .disclosureIndicator

        if item.label == "Sair" {
            config.textProperties.color = .systemRed
            config.imageProperties.tintColor = .systemRed
            cell.contentConfiguration = config
            cell.accessoryType = .none
        }

        return cell
    }
}

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let item = menuSections[indexPath.section].items[indexPath.row]
        if item.label == "Sair" {
            let alert = UIAlertController(title: "Sair", message: "Tem certeza que deseja sair?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
            alert.addAction(UIAlertAction(title: "Sair", style: .destructive))
            present(alert, animated: true)
        }
    }
}
