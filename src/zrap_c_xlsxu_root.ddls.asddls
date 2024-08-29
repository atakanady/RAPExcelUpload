@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZRAP_R_XLSXU_ROOT'

define root view entity ZRAP_C_XLSXU_Root
  provider contract transactional_query
  as projection on ZRAP_R_XLSXU_Root
{

  key     UUID,


 
          @EndUserText.label: 'Başlık'
          Title,

          @EndUserText.label: 'Dosya Adı'
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZRAP_CL_XLSXU_VDE'
  virtual StreamFilename : abap.char( 255 ),

          @EndUserText.label: 'Mime türü' //dosya türü anlamak için
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZRAP_CL_XLSXU_VDE'
  virtual StreamMimetype : abap.char( 128 ),

          @EndUserText.label: 'Dosya İçeriği'
          @Semantics.largeObject: {
              mimeType: 'StreamMimetype',
              fileName: 'StreamFilename',
              acceptableMimeTypes: [ 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' ],
              contentDispositionPreference: #INLINE
          }
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZRAP_CL_XLSXU_VDE'
  virtual StreamFile     : abap.rawstring( 0 ),

          CreatedBy,

          CreatedAt,

          LastChangedBy,

          LastChangedAt,

          EtagMaster,

          /* Associations */
          _Child : redirected to composition child ZRAP_C_XLSXU_Child

}
