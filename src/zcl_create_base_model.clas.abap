CLASS zcl_create_base_model DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CREATE_BASE_MODEL IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: it_header TYPE STANDARD TABLE OF zheader,
          wa_header TYPE zheader,
          it_item   TYPE STANDARD TABLE OF zitem,
          wa_item   TYPE zitem.

    DATA: l_uuid_x16    TYPE sysuuid_x16.
    DATA: oref          TYPE REF TO cx_uuid_error.
    DATA: s1            TYPE string.
    TRY.
        l_uuid_x16 = cl_system_uuid=>create_uuid_x16_static( ). " create uuid_x16
      CATCH cx_uuid_error INTO oref. " catch error
        s1 = oref->get_text( ).
    ENDTRY.

    out->write( 'Console out.' + l_uuid_x16 ).
  ENDMETHOD.
ENDCLASS.
