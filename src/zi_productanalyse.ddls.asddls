@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Analyse produit'

@Metadata.ignorePropagatedAnnotations: true

@VDM.viewType: #COMPOSITE

define view entity ZI_ProductAnalyse
  as select from I_Product as Product

{
      /* --- Clé métier (produit) --- */
  key Product.Product     as Product,

      /* --- Données produit utiles à l'analyse --- */
      Product.ProductType as ProductType,
      Product.BaseUnit    as BaseUnit,

      /* Texte produit (association standard) */
      @ObjectModel.text.association: '_Text'
      Product._Text       as _Text,

      /* Poids */
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      Product.GrossWeight as GrossWeight,

      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      Product.NetWeight   as NetWeight,


      Product.WeightUnit  as WeightUnit,

      /* --- Calculs métier (read-only) --- */

      @EndUserText.label: 'Is Heavy Product'
      case
        when Product.GrossWeight >= 50 then 'X'
        else ''
      end                 as IsHeavyProduct,

      @EndUserText.label: 'Logistic Category'
      case
        when Product.GrossWeight is null then 'UNKNOWN'
        when Product.GrossWeight < 10     then 'LIGHT'
        when Product.GrossWeight < 50     then 'MEDIUM'
        else                                   'HEAVY'
      end                 as LogisticCategory
}
