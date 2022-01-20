@AbapCatalog.sqlViewName: 'ZIZHEADER'
@AbapCatalog.viewEnhancementCategory: [#NONE]
--@AccessControl.authorizationCheck: #CHECK
@AbapCatalog.preserveKey: true
@EndUserText.label: 'CDS View BO View'
@Metadata.ignorePropagatedAnnotations: true

define view z_i_zheader
  as select from zheader
  composition [0..*] of z_i_zitem as _item
{
  key header_uuid as HeaderUuid,
      customerid  as Customerid,
      header_text as HeaderText,
      _item
}
