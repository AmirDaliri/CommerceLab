// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import CommerceLabAPI

public class FetchProductDetailQuery: GraphQLQuery {
  public static let operationName: String = "FetchProductDetail"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query FetchProductDetail { product { __typename id name seoDescription fullDescription shortDescription isFreeShipping productSlicers { __typename variants { __typename priceValue } } productSpecifications { __typename specificationAttributeName valueRaw } productReviewOverview { __typename allowCustomerReviews ratingSum totalReviews } pictureModels { __typename imageUrl } } }"#
    ))

  public init() {}

  public struct Data: CommerceLabAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("product", Product?.self),
    ] }

    public var product: Product? { __data["product"] }

    /// Product
    ///
    /// Parent Type: `ProductDetailType`
    public struct Product: CommerceLabAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.ProductDetailType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", String?.self),
        .field("name", String?.self),
        .field("seoDescription", String?.self),
        .field("fullDescription", String?.self),
        .field("shortDescription", String?.self),
        .field("isFreeShipping", Bool.self),
        .field("productSlicers", ProductSlicers?.self),
        .field("productSpecifications", [ProductSpecification?]?.self),
        .field("productReviewOverview", ProductReviewOverview?.self),
        .field("pictureModels", [PictureModel?]?.self),
      ] }

      public var id: String? { __data["id"] }
      public var name: String? { __data["name"] }
      public var seoDescription: String? { __data["seoDescription"] }
      public var fullDescription: String? { __data["fullDescription"] }
      public var shortDescription: String? { __data["shortDescription"] }
      public var isFreeShipping: Bool { __data["isFreeShipping"] }
      public var productSlicers: ProductSlicers? { __data["productSlicers"] }
      public var productSpecifications: [ProductSpecification?]? { __data["productSpecifications"] }
      public var productReviewOverview: ProductReviewOverview? { __data["productReviewOverview"] }
      public var pictureModels: [PictureModel?]? { __data["pictureModels"] }

      /// Product.ProductSlicers
      ///
      /// Parent Type: `ProductSlicerModelType`
      public struct ProductSlicers: CommerceLabAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.ProductSlicerModelType }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("variants", [Variant?]?.self),
        ] }

        public var variants: [Variant?]? { __data["variants"] }

        /// Product.ProductSlicers.Variant
        ///
        /// Parent Type: `ProductSlicerOptionDetailModelType`
        public struct Variant: CommerceLabAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.ProductSlicerOptionDetailModelType }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("priceValue", CommerceLabAPI.Decimal.self),
          ] }

          public var priceValue: CommerceLabAPI.Decimal { __data["priceValue"] }
        }
      }

      /// Product.ProductSpecification
      ///
      /// Parent Type: `ProductSpecificationModelType`
      public struct ProductSpecification: CommerceLabAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.ProductSpecificationModelType }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("specificationAttributeName", String?.self),
          .field("valueRaw", String?.self),
        ] }

        public var specificationAttributeName: String? { __data["specificationAttributeName"] }
        public var valueRaw: String? { __data["valueRaw"] }
      }

      /// Product.ProductReviewOverview
      ///
      /// Parent Type: `ProductReviewOverviewModelType`
      public struct ProductReviewOverview: CommerceLabAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.ProductReviewOverviewModelType }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("allowCustomerReviews", Bool.self),
          .field("ratingSum", Int.self),
          .field("totalReviews", Int.self),
        ] }

        public var allowCustomerReviews: Bool { __data["allowCustomerReviews"] }
        public var ratingSum: Int { __data["ratingSum"] }
        public var totalReviews: Int { __data["totalReviews"] }
      }

      /// Product.PictureModel
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
  }
}
