// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import CommerceLabAPI

public class FetchCategoryV2Query: GraphQLQuery {
  public static let operationName: String = "FetchCategoryV2"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query FetchCategoryV2($categoryId: String!, $pageSize: Int!, $pageNumber: Int!) { categoryV2( categoryId: $categoryId command: { pageNumber: $pageNumber pageSize: $pageSize pagePath: "https://hcapi.sch.awstest.hebiar.com/graphql/categoryv2?categoryId=$categoryId&includeDocuments=true&includeFacets=true" selectedSpecFilter: [] } ) { __typename isSuccess data { __typename id name metaKeywords metaDescription metaTitle seName flag icon subCategories { __typename id name icon pictureModel { __typename imageUrl } } products { __typename id name seName fullDescription pictures { __typename type imageUrl videoUrl fullSizeImageUrl } specificationAttributeModels { __typename specificationAttributeName colorSquaresRgb valueRaw } } fasedSeoList { __typename id seName aLink } } } }"#
    ))

  public var categoryId: String
  public var pageSize: Int
  public var pageNumber: Int

  public init(
    categoryId: String,
    pageSize: Int,
    pageNumber: Int
  ) {
    self.categoryId = categoryId
    self.pageSize = pageSize
    self.pageNumber = pageNumber
  }

  public var __variables: Variables? { [
    "categoryId": categoryId,
    "pageSize": pageSize,
    "pageNumber": pageNumber
  ] }

  public struct Data: CommerceLabAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("categoryV2", CategoryV2?.self, arguments: [
        "categoryId": .variable("categoryId"),
        "command": [
          "pageNumber": .variable("pageNumber"),
          "pageSize": .variable("pageSize"),
          "pagePath": "https://hcapi.sch.awstest.hebiar.com/graphql/categoryv2?categoryId=$categoryId&includeDocuments=true&includeFacets=true",
          "selectedSpecFilter": []
        ]
      ]),
    ] }

    public var categoryV2: CategoryV2? { __data["categoryV2"] }

    /// CategoryV2
    ///
    /// Parent Type: `ApiResponseOfCategoryProductModelType`
    public struct CategoryV2: CommerceLabAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.ApiResponseOfCategoryProductModelType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("isSuccess", Bool.self),
        .field("data", Data?.self),
      ] }

      public var isSuccess: Bool { __data["isSuccess"] }
      public var data: Data? { __data["data"] }

      /// CategoryV2.Data
      ///
      /// Parent Type: `CategoryProductModelType`
      public struct Data: CommerceLabAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.CategoryProductModelType }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", String?.self),
          .field("name", String?.self),
          .field("metaKeywords", String?.self),
          .field("metaDescription", String?.self),
          .field("metaTitle", String?.self),
          .field("seName", String?.self),
          .field("flag", String?.self),
          .field("icon", String?.self),
          .field("subCategories", [SubCategory?]?.self),
          .field("products", [Product?]?.self),
          .field("fasedSeoList", [FasedSeoList?]?.self),
        ] }

        public var id: String? { __data["id"] }
        public var name: String? { __data["name"] }
        public var metaKeywords: String? { __data["metaKeywords"] }
        public var metaDescription: String? { __data["metaDescription"] }
        public var metaTitle: String? { __data["metaTitle"] }
        public var seName: String? { __data["seName"] }
        public var flag: String? { __data["flag"] }
        public var icon: String? { __data["icon"] }
        public var subCategories: [SubCategory?]? { __data["subCategories"] }
        public var products: [Product?]? { __data["products"] }
        public var fasedSeoList: [FasedSeoList?]? { __data["fasedSeoList"] }

        /// CategoryV2.Data.SubCategory
        ///
        /// Parent Type: `SubCategoryModel`
        public struct SubCategory: CommerceLabAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.SubCategoryModel }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", String?.self),
            .field("name", String?.self),
            .field("icon", String?.self),
            .field("pictureModel", PictureModel?.self),
          ] }

          public var id: String? { __data["id"] }
          public var name: String? { __data["name"] }
          public var icon: String? { __data["icon"] }
          public var pictureModel: PictureModel? { __data["pictureModel"] }

          /// CategoryV2.Data.SubCategory.PictureModel
          ///
          /// Parent Type: `PictureModelType`
          public struct PictureModel: CommerceLabAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.PictureModelType }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("imageUrl", String?.self),
            ] }

            public var imageUrl: String? { __data["imageUrl"] }
          }
        }

        /// CategoryV2.Data.Product
        ///
        /// Parent Type: `ProductOverviewType`
        public struct Product: CommerceLabAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.ProductOverviewType }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", String?.self),
            .field("name", String?.self),
            .field("seName", String?.self),
            .field("fullDescription", String?.self),
            .field("pictures", [Picture?]?.self),
            .field("specificationAttributeModels", [SpecificationAttributeModel?]?.self),
          ] }

          public var id: String? { __data["id"] }
          public var name: String? { __data["name"] }
          public var seName: String? { __data["seName"] }
          public var fullDescription: String? { __data["fullDescription"] }
          public var pictures: [Picture?]? { __data["pictures"] }
          public var specificationAttributeModels: [SpecificationAttributeModel?]? { __data["specificationAttributeModels"] }

          /// CategoryV2.Data.Product.Picture
          ///
          /// Parent Type: `PictureModelType`
          public struct Picture: CommerceLabAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.PictureModelType }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("type", String?.self),
              .field("imageUrl", String?.self),
              .field("videoUrl", String?.self),
              .field("fullSizeImageUrl", String?.self),
            ] }

            public var type: String? { __data["type"] }
            public var imageUrl: String? { __data["imageUrl"] }
            public var videoUrl: String? { __data["videoUrl"] }
            public var fullSizeImageUrl: String? { __data["fullSizeImageUrl"] }
          }

          /// CategoryV2.Data.Product.SpecificationAttributeModel
          ///
          /// Parent Type: `ProductSpecificationModelType`
          public struct SpecificationAttributeModel: CommerceLabAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.ProductSpecificationModelType }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("specificationAttributeName", String?.self),
              .field("colorSquaresRgb", String?.self),
              .field("valueRaw", String?.self),
            ] }

            public var specificationAttributeName: String? { __data["specificationAttributeName"] }
            public var colorSquaresRgb: String? { __data["colorSquaresRgb"] }
            public var valueRaw: String? { __data["valueRaw"] }
          }
        }

        /// CategoryV2.Data.FasedSeoList
        ///
        /// Parent Type: `CategoryFasedSeoModelType`
        public struct FasedSeoList: CommerceLabAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.CategoryFasedSeoModelType }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", String?.self),
            .field("seName", String?.self),
            .field("aLink", Bool.self),
          ] }

          public var id: String? { __data["id"] }
          public var seName: String? { __data["seName"] }
          public var aLink: Bool { __data["aLink"] }
        }
      }
    }
  }
}
