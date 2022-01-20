@AbapCatalog.sqlViewName: 'zizheader'
@AbapCatalog.viewEnhancementCategory: [#NONE]
--@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS View BO View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view z_i_zheader
  as select from zheader
  composition [0..*] of z_i_zitem as _item
{
  key header_uuid as HeaderUuid,
      customerid  as Customerid,
      header_text as HeaderText,
      _item
}
