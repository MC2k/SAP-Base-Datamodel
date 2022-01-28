@AbapCatalog.sqlViewName: 'ZIZITEM'
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View BO View'

--BOPF Model

@ObjectModel: { representativeKey: 'header_uuid' ,  --Key des BOPF Root
                semanticKey: ['item_uuid'],
            --    modelCategory: #BUSINESS_OBJECT,  -- wird in den child nodes nicht empfholen
            --    transactionalProcessingEnabled: true, -- wird in den child nodes nicht empfholen
                writeActivePersistence: 'zitem',
                createEnabled: true,
                deleteEnabled: true,
                updateEnabled: true
}

define view z_i_zitem as select from zitem
association to parent z_i_zheader as _header  on  $projection.header_uuid = _header.header_uuid

 {

 
   @UI.facet: [ { id:            'Header',
                 purpose:       #STANDARD,
                 type:          #IDENTIFICATION_REFERENCE,
                 label:         'Beader',
                 position:      10 }  ]



    @UI.identification: [{ position: 20, label: 'Item UUID' }] 
    @UI.lineItem: [{position: 20 ,label: 'Item UUID' }]
    @ObjectModel.readOnly:true --setzt im UI das Feld auf readOnly
    key item_uuid ,

    @UI.identification: [{ position: 10, label: 'Header UUID' }] 
    @UI.lineItem: [{position: 10 ,label: 'Header UUID' }] 
    @ObjectModel.readOnly:true --setzt im UI das Feld auf readOnly
    header_uuid ,
   

    @UI.identification: [{ position: 30, label: 'Product' }] 
    @UI.lineItem: [{position: 30 ,label: 'Product' }]    
        cast( product as abap.char(40)) as product, --is identical type but witout conv.exit
                                                    --sonst gibt es einen fehler/negativ prüfung im Frontend
                                                    --aufgrund des konvertrierungsexit des types MATNR
                                                    --ab und an klapp das so nicht und das BOPF macht weiter 
                                                    --probleme, dann muss die Data Structure des BOPF noch mal
                                                    --von hand angepasst werden ZSTEST_ITEM_D
                                                    --im ABAP Restful Model besteht das problem der BOPF Structur nicht
--        product,

    @UI.identification: [{ position: 40, label: 'Text' }] 
    @UI.lineItem: [{position: 40 ,label: 'Text' }]

        item_text ,

    @UI.identification: [{ position: 50, label: 'Amount' }] 
    @UI.lineItem: [{position: 50 ,label: 'Amount' }]
        @Semantics.quantity.unitOfMeasure: 'meins'
        amount ,

    @UI.identification: [{ position: 60, label: 'Mengeneinheit' }] 
    @UI.lineItem: [{position: 60 ,label: 'Mengeneinheit' }]
        meins ,
--        @Semantics.systemDateTime.localInstanceLastChangedAt: true

    @UI.identification: [{ position: 70, label: 'last change at' }] 
    @UI.lineItem: [{position: 70 ,label: 'last change at' }]
        last_changed_at,
        @ObjectModel.association.type: [#TO_COMPOSITION_ROOT, #TO_COMPOSITION_PARENT]
        _header
}
