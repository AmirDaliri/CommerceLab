//
//  ContentView.swift
//  CommerceLab
//
//  Created by Amir Daliri on 19.11.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CategoryViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading categories...")
                        .padding()
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                        .padding()
                } else {
                    createList()
                }
            }
            .navigationTitle("Categories")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.loadCategories()
            }
        }
    }

    // MARK: - Helper Views
    
    @ViewBuilder
    private func createList() -> some View {
        List {
            ForEach(viewModel.groupedCategories, id: \.parentId) { group in
                DisclosureGroup(
                    isExpanded: Binding(
                        get: { viewModel.expandedState[group.parentId] ?? false },
                        set: { viewModel.expandedState[group.parentId] = $0 }
                    ),
                    content: {
                        ForEach(group.categories, id: \.id) { category in
                            subcategoryRow(for: category)
                        }
                    },
                    label: {
                        categoryHeader(for: group)
                    }
                )
                .padding(.vertical, 4)
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
    
    @ViewBuilder
    private func categoryHeader(for group: CategoryGroup) -> some View {
        HStack {
            AsyncImage(url: URL(string: group.categories.first?.picture ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 60, height: 60)
            }

            Text(group.categories.first?.name ?? "Unknown")
                .font(.headline)
                .foregroundColor(.primary)
                .lineLimit(1)
                .truncationMode(.tail)
        }
        .padding(.vertical, 8)
    }

    @ViewBuilder
    private func subcategoryRow(for category: Category) -> some View {
        HStack {
            AsyncImage(url: URL(string: category.picture ?? "")) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            } placeholder: {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 40, height: 40)
            }

            Text(category.name)
                .font(.subheadline)
                .foregroundColor(.primary)
                .lineLimit(1)
        }
        .padding(.vertical, 4)
    }
}
