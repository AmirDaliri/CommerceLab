// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import CommerceLabAPI

public class FetchProductDetailQuery: GraphQLQuery {
  public static let operationName: String = "FetchProductDetail"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query FetchProductDetail($productId: String) { product(id: $productId) { __typename pictureModels { __typename imageUrl thumbImageUrl fullSizeImageUrl } productType name shortDescription fullDescription productPrice { __typename price } id } }"#
    ))

  public var productId: GraphQLNullable<String>

  public init(productId: GraphQLNullable<String>) {
    self.productId = productId
  }

  public var __variables: Variables? { ["productId": productId] }

  public struct Data: CommerceLabAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("product", Product?.self, arguments: ["id": .variable("productId")]),
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
        .field("pictureModels", [PictureModel?]?.self),
        .field("productType", String?.self),
        .field("name", String?.self),
        .field("shortDescription", String?.self),
        .field("fullDescription", String?.self),
        .field("productPrice", ProductPrice?.self),
        .field("id", String?.self),
      ] }

      public var pictureModels: [PictureModel?]? { __data["pictureModels"] }
      public var productType: String? { __data["productType"] }
      public var name: String? { __data["name"] }
      public var shortDescription: String? { __data["shortDescription"] }
      public var fullDescription: String? { __data["fullDescription"] }
      public var productPrice: ProductPrice? { __data["productPrice"] }
      public var id: String? { __data["id"] }

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
          .field("thumbImageUrl", String?.self),
          .field("fullSizeImageUrl", String?.self),
        ] }

        public var imageUrl: String? { __data["imageUrl"] }
        public var thumbImageUrl: String? { __data["thumbImageUrl"] }
        public var fullSizeImageUrl: String? { __data["fullSizeImageUrl"] }
      }

      /// Product.ProductPrice
      ///
      /// Parent Type: `ProductPriceModelType`
      public struct ProductPrice: CommerceLabAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.ProductPriceModelType }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("price", String?.self),
        ] }

        public var price: String? { __data["price"] }
      }
    }
  }
}
