class ZCL_Z_I_ZHEADER definition
  public
  inheriting from CL_SADL_GTK_EXPOSURE_MPC
  final
  create public .

public section.
protected section.

  methods GET_PATHS
    redefinition .
  methods GET_TIMESTAMP
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_Z_I_ZHEADER IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( `CDS~Z_I_ZHEADER` )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20220128083754.
  endmethod.
ENDCLASS.
