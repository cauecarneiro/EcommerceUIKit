//
//  CartView.swift
//  EstudoDeCasoUIKit
//
//  Created by Cauê Carneiro on 14/05/26.
//
//  Implementação via SwiftUI com ciclo de vida UIKit

import SwiftUI

struct CartItem: Identifiable {
    let id = UUID()
    let name: String
    let price: Double
    let quantity: Int
    let icon: String
}

struct CartView: View {

    @State private var items: [CartItem] = [
        CartItem(name: "Tênis Air Max", price: 599.90, quantity: 1, icon: "bag.fill"),
        CartItem(name: "Camiseta Premium", price: 149.90, quantity: 2, icon: "tag.fill"),
        CartItem(name: "Boné Vintage", price: 89.90, quantity: 1, icon: "star.fill"),
    ]

    private var total: Double {
        items.reduce(0) { $0 + $1.price * Double($1.quantity) }
    }

    var body: some View {
        List {
            ForEach(items) { item in
                CartRowView(item: item)
            }
            .onDelete { items.remove(atOffsets: $0) }
        }
        .listStyle(.insetGrouped)
        .safeAreaInset(edge: .bottom) {
            checkoutFooter
        }
    }

    private var checkoutFooter: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Total")
                    .font(.headline)
                Spacer()
                Text(total, format: .currency(code: "BRL"))
                    .font(.title3)
                    .fontWeight(.bold)
            }
            Button("Finalizar Compra") {
                // checkout action
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(.regularMaterial)
    }
}

struct CartRowView: View {
    let item: CartItem

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: item.icon)
                .font(.title2)
                .foregroundStyle(.indigo)
                .frame(width: 52, height: 52)
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.subheadline)
                    .fontWeight(.medium)
                Text(item.price, format: .currency(code: "BRL"))
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Text("x\(item.quantity)")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 4)
    }
}
