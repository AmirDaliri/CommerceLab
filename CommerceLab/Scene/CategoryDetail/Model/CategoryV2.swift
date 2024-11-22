//
//  CategoryV2.swift
//  CommerceLab
//
//  Created by Amir Daliri on 22.11.2024.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let categoryV2 = try? JSONDecoder().decode(CategoryV2.self, from: jsonData)

import Foundation

// MARK: - CategoryV2Class
struct CategoryV2 {
    let isSuccess: Bool?
    let data: CategoryV2Data?
}

// MARK: - CategoryV2DataClass
struct CategoryV2Data {
    let id, name: String?
    let metaKeywords: String?
    let metaDescription, metaTitle, seName: String?
    let flag, icon: String?
    let subCategories: [SubCategory]?
    let products: [Product]?
    let fasedSeoList: [FasedSeo]?
}

struct FasedSeo {
    let id: String?
    let seName: String?
    let aLink: Bool?
}
extension FetchCategoryV2Query.Data.CategoryV2.Data.FasedSeoList {
    func toDomain() -> FasedSeo {
        return FasedSeo(
            id: id,
            seName: seName,
            aLink: aLink
        )
    }
}
// MARK: - Product
struct Product {
    let id, name, seName, fullDescription: String?
    let pictures: [Picture]?
    let specificationAttributeModels: [SpecificationAttributeModel]?
}

extension FetchCategoryV2Query.Data.CategoryV2.Data.Product.SpecificationAttributeModel {
    func toDomain() -> SpecificationAttributeModel {
        return SpecificationAttributeModel(
            specificationAttributeName: specificationAttributeName,
            colorSquaresRgb: colorSquaresRgb,
            valueRaw: valueRaw
        )
    }
}

struct SpecificationAttributeModel {
    let specificationAttributeName: String?
    let colorSquaresRgb: String?
    let valueRaw: String?
}


// MARK: - Picture
struct Picture {
    let type: String?
    let imageUrl: String?
    let videoUrl: String?
    var fullSizeImageUrl: String?
}

// MARK: - SubCategory
struct SubCategory {
    let id, name: String?
    let icon: String?
    let pictureModel: PictureModel?
}

// MARK: - PictureModel
struct PictureModel {
    let imageUrl: String?
}

extension FetchCategoryV2Query.Data.CategoryV2 {
    func toDomain() -> CategoryV2 {
        return CategoryV2(
            isSuccess: isSuccess,
            data: data?.toDomain()
        )
    }
}

extension FetchCategoryV2Query.Data.CategoryV2.Data {
    func toDomain() -> CategoryV2Data {
        return CategoryV2Data(
            id: id,
            name: name,
            metaKeywords: metaKeywords,
            metaDescription: metaDescription,
            metaTitle: metaTitle,
            seName: seName,
            flag: flag,
            icon: icon,
            subCategories: subCategories?.compactMap { $0?.toDomain() },
            products: products?.compactMap { $0?.toDomain() },
            fasedSeoList: fasedSeoList?.compactMap{ $0?.toDomain()}
        )
    }
}

extension FetchCategoryV2Query.Data.CategoryV2.Data.SubCategory {
    func toDomain() -> SubCategory {
        return SubCategory(
            id: id,
            name: name,
            icon: icon,
            pictureModel: pictureModel?.toDomain()
        )
    }
}

extension FetchCategoryV2Query.Data.CategoryV2.Data.SubCategory.PictureModel {
    func toDomain() -> PictureModel {
        return PictureModel(
            imageUrl: imageUrl
        )
    }
}

extension FetchCategoryV2Query.Data.CategoryV2.Data.Product {
    func toDomain() -> Product {
        return Product(
            id: id,
            name: name,
            seName: seName,
            fullDescription: fullDescription,
            pictures: pictures?.compactMap { $0?.toDomain() },
            specificationAttributeModels: specificationAttributeModels?.compactMap { $0?.toDomain() }
        )
    }
}

extension FetchCategoryV2Query.Data.CategoryV2.Data.Product.Picture {
    func toDomain() -> Picture {
        return Picture(
            type: type,
            imageUrl: imageUrl,
            videoUrl: videoUrl,
            fullSizeImageUrl: fullSizeImageUrl
        )
    }
}
