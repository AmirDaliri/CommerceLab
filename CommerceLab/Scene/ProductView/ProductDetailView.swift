//
//  ProductDetailView.swift
//  CommerceLab
//
//  Created by Amir Daliri on 22.11.2024.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    if let pictures = product.pictures,
                       let firstPicture = pictures.first,
                       let url = URL(string: firstPicture.fullSizeImageUrl ?? firstPicture.imageUrl ?? "") {
                        HStack {
                            Spacer()
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 300, height: 300)
                                        .padding()
                                case .failure:
                                    Image("category_placeholder")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 300, height: 300)
                                        .foregroundColor(.gray)
                                        .padding()
                                case .empty:
                                    ProgressView()
                                        .frame(width: 300, height: 300)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            Spacer()
                        }
                    }

                    Text(product.name ?? "Unknown Product")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    if let description = product.fullDescription {
                        Text(description)
                            .font(.body)
                            .padding(.horizontal)
                    }

                    if let specifications = product.specificationAttributeModels {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Specifications")
                                .font(.headline)
                                .padding(.horizontal)

                            ForEach(specifications, id: \.specificationAttributeName) { spec in
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(spec.specificationAttributeName ?? "Unknown Attribute")
                                        .font(.subheadline)
                                        .fontWeight(.bold)

                                    if let value = spec.valueRaw {
                                        Text(value)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Product Details")
        }
    }
}

#Preview {
    let sampleProduct = Product(
        id: "1",
        name: "Sample Product", seName: "This is a detailed description of the sample product, This is a detailed description of the sample product.",
        fullDescription: "This is a detailed description of the sample product.",
        pictures: [
            Picture(type: "image", imageUrl: "https://via.placeholder.com/150", videoUrl: nil, fullSizeImageUrl: "https://f-sch-t.mncdn.com/livephotos/5074940144/5074940144-1.jpg")
        ],
        specificationAttributeModels: [
            SpecificationAttributeModel(specificationAttributeName: "Color", colorSquaresRgb: nil, valueRaw: "Red"),
            SpecificationAttributeModel(specificationAttributeName: "Size", colorSquaresRgb: nil, valueRaw: "Medium")
        ]
    )
    ProductDetailView(product: sampleProduct)
}
