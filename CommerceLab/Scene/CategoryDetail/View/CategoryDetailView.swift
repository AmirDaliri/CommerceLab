//
//  CategoryDetailView.swift
//  CommerceLab
//
//  Created by Amir Daliri on 22.11.2024.
//

import SwiftUI

struct CategoryDetailView: View {
    @ObservedObject var viewModel: CategoryDetailViewModel
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let errorMessage = viewModel.errorMessage {
                errorView(errorMessage)
            } else if let category = viewModel.category?.data {
                categoryDetailsView(category)
            } else {
                emptyView()
            }
        }
        .navigationTitle("Category Details")
    }
}

extension CategoryDetailView {
    @ViewBuilder
    private func errorView(_ message: String) -> some View {
        Text(message)
            .foregroundColor(.red)
            .multilineTextAlignment(.center)
            .padding()
    }

    @ViewBuilder
    private func emptyView() -> some View {
        Text("No category details available.")
            .font(.headline)
            .foregroundColor(.gray)
            .padding()
    }

    @ViewBuilder
    private func categoryDetailsView(_ category: CategoryV2Data) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(category.name ?? "Unknown Category")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                if let description = category.metaDescription {
                    Text(description)
                        .font(.body)
                        .fontWeight(.regular)
                        .padding(.top)
                        .padding(.bottom)
                }


                if let subCategories = category.subCategories,
                    !subCategories.isEmpty {
                    subCategoriesView(subCategories)
                }

                if let products = category.products {
                    productsView(products)
                }
            }
            .padding()
        }
    }

    @ViewBuilder
    private func subCategoriesView(_ subCategories: [SubCategory]) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Subcategories")
                .font(.headline)
            
            ForEach(subCategories, id: \.id) { subCategory in
                HStack {
                    if let iconUrl = subCategory.icon, let url = URL(string: iconUrl) {
                        AsyncImage(url: url)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    Text(subCategory.name ?? "Unknown Subcategory")
                        .font(.subheadline)
                }
                .padding(.vertical, 4)
            }
        }
    }

    @ViewBuilder
    private func productsView(_ products: [Product]) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Products")
                .font(.headline)
            
            ForEach(products, id: \.id) { product in
                NavigationLink(destination: ProductDetailView(product: product)) {
                    HStack {
                        if let pictures = product.pictures, let firstPicture = pictures.first, let url = URL(string: firstPicture.imageUrl ?? "") {
                            AsyncImage(url: url)
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        VStack(alignment: .leading) {
                            Text(product.name ?? "Unknown Product")
                                .font(.subheadline)
                            Text(product.fullDescription ?? "Unknown Description")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
        }
    }
}

#Preview {
    let sampleCategoryData = CategoryV2Data(
        id: "1",
        name: "Sample Category",
        metaKeywords: "Sample, Keywords",
        metaDescription: "This is a detailed description of the sample category.",
        metaTitle: "Sample Meta Title",
        seName: "sample-category",
        flag: "Featured",
        icon: nil,
        subCategories: [
            SubCategory(
                id: "1",
                name: "Subcategory 1",
                icon: nil,
                pictureModel: PictureModel(imageUrl: "https://via.placeholder.com/50")
            ),
            SubCategory(
                id: "2",
                name: "Subcategory 2",
                icon: nil,
                pictureModel: PictureModel(imageUrl: "https://via.placeholder.com/50")
            )
        ],
        products: [
            Product(
                id: "101",
                name: "Sample Product 1",
                seName: "sample-product-1",
                fullDescription: "This is a sample product description.",
                pictures: [
                    Picture(
                        type: "image",
                        imageUrl: "https://via.placeholder.com/150",
                        videoUrl: nil,
                        fullSizeImageUrl: "https://via.placeholder.com/500"
                    )
                ],
                specificationAttributeModels: [
                    SpecificationAttributeModel(
                        specificationAttributeName: "Color",
                        colorSquaresRgb: nil,
                        valueRaw: "Red"
                    ),
                    SpecificationAttributeModel(
                        specificationAttributeName: "Size",
                        colorSquaresRgb: nil,
                        valueRaw: "Medium"
                    )
                ]
            ),
            Product(
                id: "102",
                name: "Sample Product 2",
                seName: "sample-product-2",
                fullDescription: "This is another sample product description.",
                pictures: nil,
                specificationAttributeModels: [
                    SpecificationAttributeModel(
                        specificationAttributeName: "Material",
                        colorSquaresRgb: nil,
                        valueRaw: "Cotton"
                    )
                ]
            )
        ],
        fasedSeoList: [
            FasedSeo(
                id: "seo1",
                seName: "seo-name-1",
                aLink: true
            ),
            FasedSeo(
                id: "seo2",
                seName: "seo-name-2",
                aLink: false
            )
        ]
    )
    
    let sampleViewModel = CategoryDetailViewModel(categoryId: "1")
//    sampleViewModel.category = CategoryV2(isSuccess: true, data: sampleCategoryData)
    
    NavigationStack {
        CategoryDetailView(viewModel: sampleViewModel)
    }
}
