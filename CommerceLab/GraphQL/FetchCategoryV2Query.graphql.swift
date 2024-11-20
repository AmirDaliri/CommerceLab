// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import CommerceLabAPI

public class FetchCategoryV2Query: GraphQLQuery {
  public static let operationName: String = "FetchCategoryV2"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query FetchCategoryV2 { categoryV2 { __typename data { __typename name totalItems products { __typename id name categories { __typename name } price { __typename priceValue } pictures { __typename imageUrl } } } } }"#
    ))

  public init() {}

  public struct Data: CommerceLabAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("categoryV2", CategoryV2?.self),
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
        .field("data", Data?.self),
      ] }

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
          .field("name", String?.self),
          .field("totalItems", Int.self),
          .field("products", [Product?]?.self),
        ] }

        public var name: String? { __data["name"] }
        public var totalItems: Int { __data["totalItems"] }
        public var products: [Product?]? { __data["products"] }

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
            .field("categories", [Category?]?.self),
            .field("price", Price?.self),
            .field("pictures", [Picture?]?.self),
          ] }

          public var id: String? { __data["id"] }
          public var name: String? { __data["name"] }
          public var categories: [Category?]? { __data["categories"] }
          public var price: Price? { __data["price"] }
          public var pictures: [Picture?]? { __data["pictures"] }

          /// CategoryV2.Data.Product.Category
          ///
          /// Parent Type: `CategorySimpleModel`
          public struct Category: CommerceLabAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.CategorySimpleModel }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String?.self),
            ] }

            public var name: String? { __data["name"] }
          }

          /// CategoryV2.Data.Product.Price
          ///
          /// Parent Type: `ProductPriceModel`
          public struct Price: CommerceLabAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.ProductPriceModel }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("priceValue", CommerceLabAPI.Decimal.self),
            ] }

            public var priceValue: CommerceLabAPI.Decimal { __data["priceValue"] }
          }

          /// CategoryV2.Data.Product.Picture
          ///
          /// Parent Type: `PictureModelType`
          public struct Picture: CommerceLabAPI.SelectionSet {
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
      }
    }
  }
}
