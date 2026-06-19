@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Read only product analyse'

@Metadata.ignorePropagatedAnnotations: false

@VDM.viewType: #CONSUMPTION

@Metadata.allowExtensions: true
define root view entity ZC_ProductAnalyseROTP
  provider contract transactional_query
  as projection on ZR_ProductAnalyseTP

{
  key Product,

      ProductType,
      BaseUnit,
      GrossWeight,
      NetWeight,
      WeightUnit,
      IsHeavyProduct,
      LogisticCategory,
      WeightCriticality,

      /* Associations */
      _Text
}
