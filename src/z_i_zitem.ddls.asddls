@AbapCatalog.sqlViewName: 'ZIZITEM'
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AbapCatalog.preserveKey: true
--@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS View BO View'
@Metadata.ignorePropagatedAnnotations: true

define view z_i_zitem as select from zitem
 association to parent z_i_zheader as _header  on  $projection.HeaderUuid = _header.HeaderUuid

 {
    key header_uuid as HeaderUuid,
        product as Product,
        item_text as ItemText,
        amount as Amount,
        meins as Meins,
        _header
}
