@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View BO View'
define view entity z_i_zitem as select from zitem
association to parent z_i_zheader as _header  on  $projection.header_uuid = _header.header_uuid

 {
    key header_uuid ,
    key item_uuid ,
    
        cast( product as abap.char(40)) as product, --is identical type but witout conv.exit
                                                    --sonst gibt es einen fehler/negativ prüfung im Frontend
                                                    --aufgrund des konvertrierungsexit des types MATNR
        item_text ,
        @Semantics.quantity.unitOfMeasure: 'meins'
        amount ,
        meins ,
        @Semantics.systemDateTime.localInstanceLastChangedAt: true
        last_changed_at,
        _header
}
