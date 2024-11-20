// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import CommerceLabAPI

public class FetchCategoriesQuery: GraphQLQuery {
  public static let operationName: String = "FetchCategories"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query FetchCategories { categories { __typename id parentCategoryId name description icon flag flagStyle picture genericAttributes { __typename key value storeId } showOnHomePage showOnSearchBox includeInTopMenu hideOnCatalog } }"#
    ))

  public init() {}

  public struct Data: CommerceLabAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("categories", [Category?]?.self),
    ] }

    public var categories: [Category?]? { __data["categories"] }

    /// Category
    ///
    /// Parent Type: `CategoryItemType`
    public struct Category: CommerceLabAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.CategoryItemType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", String?.self),
        .field("parentCategoryId", String?.self),
        .field("name", String?.self),
        .field("description", String?.self),
        .field("icon", String?.self),
        .field("flag", String?.self),
        .field("flagStyle", String?.self),
        .field("picture", String?.self),
        .field("genericAttributes", [GenericAttribute?]?.self),
        .field("showOnHomePage", Bool.self),
        .field("showOnSearchBox", Bool.self),
        .field("includeInTopMenu", Bool.self),
        .field("hideOnCatalog", Bool.self),
      ] }

      public var id: String? { __data["id"] }
      public var parentCategoryId: String? { __data["parentCategoryId"] }
      public var name: String? { __data["name"] }
      public var description: String? { __data["description"] }
      public var icon: String? { __data["icon"] }
      public var flag: String? { __data["flag"] }
      public var flagStyle: String? { __data["flagStyle"] }
      public var picture: String? { __data["picture"] }
      public var genericAttributes: [GenericAttribute?]? { __data["genericAttributes"] }
      public var showOnHomePage: Bool { __data["showOnHomePage"] }
      public var showOnSearchBox: Bool { __data["showOnSearchBox"] }
      public var includeInTopMenu: Bool { __data["includeInTopMenu"] }
      public var hideOnCatalog: Bool { __data["hideOnCatalog"] }

      /// Category.GenericAttribute
      ///
      /// Parent Type: `GenericAttribute`
      public struct GenericAttribute: CommerceLabAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.GenericAttribute }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("key", String?.self),
          .field("value", String?.self),
          .field("storeId", String?.self),
        ] }

        public var key: String? { __data["key"] }
        public var value: String? { __data["value"] }
        public var storeId: String? { __data["storeId"] }
      }
    }
  }
}
