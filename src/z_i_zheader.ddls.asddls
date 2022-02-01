@AbapCatalog.sqlViewName: 'ZIZHEADER'
@AbapCatalog.compiler.compareFilter: true
-- 750SP17 not supported
-- @AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@AbapCatalog.preserveKey: true
@EndUserText.label: 'CDS View BO View'

@OData.publish: true

--BOPF Model

@ObjectModel: { representativeKey: 'header_uuid' ,  --Key des BOPF Root
                semanticKey: ['header_uuid'],
                modelCategory: #BUSINESS_OBJECT,
                compositionRoot: true, --wehn true, wird BOPF Model generiert       
                transactionalProcessingEnabled: true,
                writeActivePersistence: 'zheader',
                createEnabled: true,
                deleteEnabled: true,
                updateEnabled: true
}


  @UI.headerInfo: { typeName: 'Header',
                typeNamePlural: 'Headers',
                title: { type: #STANDARD, label: 'Header UUID', value: 'header_uuid' } }

-- mit define root view gibt es hier im Release Probleme mit
-- @ObjectModel.compositionRoot: true und @ObjectModel.transactionalProcessingEnabled: true
define view z_i_zheader
  as select from zheader
  association [0..*] to z_i_zitem as _item
  on $projection.header_uuid = _item.header_uuid
{
/*
-- must have um aus der ersten List page in die nächste Page zu navigieren 
  @UI.facet: [ { id:              'Header',
                 purpose:         #STANDARD,
                 type:            #IDENTIFICATION_REFERENCE,
                 label:           'Header',
                 position:        10 },
               { id:              'Item',
                 purpose:         #STANDARD,
                 type:            #LINEITEM_REFERENCE,
                 label:           'Item',
                 position:        20,
                 targetElement:   '_item'} ]
*/


    @UI.identification: [{ position: 10, label: 'Header UUID' }] 
    @UI.lineItem: [{position: 10 ,label: 'Header UUID' }]
    @ObjectModel.readOnly:true --setzt im UI das Feld auf readOnly

  key header_uuid ,
      customerid  ,

      @UI.identification: [{ position: 20, label: 'Header Text' }] 
      @UI.lineItem: [{position: 20 ,label: 'Header Text' }]
      header_text,   --  mit "as HeaderText" anweisungen vorsichtig sein,
                     --Field "HEADERTEXT" is part of entity "Z_I_ZHEADER", but not of table "ZHEADER". 
                     --A "mapping" definition should be added, or the field be marked as "readonly".
      last_changed_at,
     @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _item
}
