/**
 * @license Copyright (c) 2003-2021, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
        config.width = 700;     // 500 pixels wide.
        config.uiColor = '#d9e8b0'
        config.defaultLanguage = 'zh';
        config.editorplaceholder ='我就是專案';
        config.image_previewText=' '; 
        config.filebrowserUploadUrl = '/petpet/images/ckeditorUpload';
        config.filebrowserImageUploadUrl= '/petpet/images/ckeditorUpload';
        config.image2_maxSize = {
         height: 200,
         width: 100
};
         config.startupFocus = true
       
};
