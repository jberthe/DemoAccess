@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Root - Product Logistic Analysis'

@Metadata.ignorePropagatedAnnotations: false

@VDM.viewType: #TRANSACTIONAL

define root view entity ZR_ProductAnalyseTP
  as select from ZI_ProductAnalyse

{
  key Product,

      ProductType,
      BaseUnit,
      GrossWeight,
      NetWeight,
      WeightUnit,
      IsHeavyProduct,
      LogisticCategory,

      @EndUserText.label: 'Weight Criticality'
      case
        when IsHeavyProduct = 'X' then 2   // NEGATIVE
        else 3                                   // NEUTRAL
      end               as WeightCriticality,


      /* Associations */
      _Text
}
