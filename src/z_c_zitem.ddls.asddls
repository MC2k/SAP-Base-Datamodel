@EndUserText.label: 'CDS View projection view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Search.searchable: true
@Metadata.allowExtensions: true

define view entity z_c_zitem as projection on z_i_zitem {
    key header_uuid,
    key item_uuid,
    @Search.defaultSearchElement: true
    product,
    @Search.defaultSearchElement: true
    item_text,
    amount,
    meins,
    last_changed_at,
    /* Associations */
    _header : redirected to parent Z_C_ZHEADER
}
