// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
import CommerceLabAPI

public class FetchCategoriesQuery: GraphQLQuery {
  public static let operationName: String = "FetchCategories"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query FetchCategories { menuByType(type: "Main Menu") { __typename id name icon menuId parentMenuId type } }"#
    ))

  public init() {}

  public struct Data: CommerceLabAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("menuByType", [MenuByType?]?.self, arguments: ["type": "Main Menu"]),
    ] }

    public var menuByType: [MenuByType?]? { __data["menuByType"] }

    /// MenuByType
    ///
    /// Parent Type: `MenuItemModel`
    public struct MenuByType: CommerceLabAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { CommerceLabAPI.Objects.MenuItemModel }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", Int.self),
        .field("name", String?.self),
        .field("icon", String?.self),
        .field("menuId", Int.self),
        .field("parentMenuId", Int?.self),
        .field("type", String?.self),
      ] }

      public var id: Int { __data["id"] }
      public var name: String? { __data["name"] }
      public var icon: String? { __data["icon"] }
      public var menuId: Int { __data["menuId"] }
      public var parentMenuId: Int? { __data["parentMenuId"] }
      public var type: String? { __data["type"] }
    }
  }
}
