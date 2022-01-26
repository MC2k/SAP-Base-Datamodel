@EndUserText.label: 'CDS View projection view'
@AccessControl.authorizationCheck: #NOT_REQUIRED

-- new compraed to the BO view
@Search.searchable: true
@Metadata.allowExtensions: true



define root view entity Z_C_ZHEADER as projection on z_i_zheader {
    @Search.defaultSearchElement: true
    key header_uuid,
    @Search.defaultSearchElement: true
    customerid,
    @Search.defaultSearchElement: true
    header_text,
    last_changed_at,
    /* Associations */
          /* Associations */
       
    _item : redirected to composition child z_c_zitem
}
