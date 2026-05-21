//
//  HomeViewController.swift
//  EstudoDeCasoUIKit
//
//  Created by Cauê Carneiro on 14/05/26.
//  Implementação via Storyboard

import UIKit

struct Product {
    let name: String
    let price: Double
    let image: UIImage?
}

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let products: [Product] = [
        Product(name: "Tênis Air Max", price: 599.90, image: nil),
        Product(name: "Camiseta Premium", price: 149.90, image: nil),
        Product(name: "Boné Vintage", price: 89.90, image: nil),
        Product(name: "Calça Slim Fit", price: 279.90, image: nil),
        Product(name: "Jaqueta Corta-Vento", price: 399.90, image: nil),
        Product(name: "Mochila Urban", price: 199.90, image: nil),
    ]

    private let formatter: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .currency
        f.locale = Locale(identifier: "pt_BR")
        return f
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Produtos"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProductCell")
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        let product = products[indexPath.row]

        var config = cell.defaultContentConfiguration()
        config.text = product.name
        config.secondaryText = formatter.string(from: NSNumber(value: product.price))
        config.image = product.image
        cell.contentConfiguration = config
        cell.accessoryType = .disclosureIndicator

        return cell
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let product = products[indexPath.row]

        let alert = UIAlertController(
            title: product.name,
            message: "Deseja adicionar ao carrinho?",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel))
        alert.addAction(UIAlertAction(title: "Adicionar", style: .default))
        present(alert, animated: true)
    }
}
