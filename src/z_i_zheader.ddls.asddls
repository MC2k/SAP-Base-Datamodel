@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View BO View'

-- define root is the same in odl 754NW @Objectmode...
define root view entity z_i_zheader
  as select from zheader
 composition [0..*] of z_i_zitem as _item
{
  key header_uuid ,
      customerid  ,
      header_text,   --  mit "as HeaderText" anweisungen vorsichtig sein,
                     --Field "HEADERTEXT" is part of entity "Z_I_ZHEADER", but not of table "ZHEADER". 
                     --A "mapping" definition should be added, or the field be marked as "readonly".
      last_changed_at,
      _item
}
