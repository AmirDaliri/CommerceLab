// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == CommerceLabAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == CommerceLabAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == CommerceLabAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == CommerceLabAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "ApiResponseOfCategoryProductModelType": return CommerceLabAPI.Objects.ApiResponseOfCategoryProductModelType
    case "CategoryFasedSeoModelType": return CommerceLabAPI.Objects.CategoryFasedSeoModelType
    case "CategoryItemType": return CommerceLabAPI.Objects.CategoryItemType
    case "CategoryProductModelType": return CommerceLabAPI.Objects.CategoryProductModelType
    case "GenericAttribute": return CommerceLabAPI.Objects.GenericAttribute
    case "PictureModelType": return CommerceLabAPI.Objects.PictureModelType
    case "ProductDetailType": return CommerceLabAPI.Objects.ProductDetailType
    case "ProductOverviewType": return CommerceLabAPI.Objects.ProductOverviewType
    case "ProductPriceModelType": return CommerceLabAPI.Objects.ProductPriceModelType
    case "ProductSpecificationModelType": return CommerceLabAPI.Objects.ProductSpecificationModelType
    case "Query": return CommerceLabAPI.Objects.Query
    case "SubCategoryModel": return CommerceLabAPI.Objects.SubCategoryModel
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
