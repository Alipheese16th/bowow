/**
 * 
 */

 $(document).ready(function() {
	 $('#summernote').summernote({
	        height: 300,
	        minHeight: null,
	        maxHeight: null,
	        lang : 'ko-KR',
	        onImageUpload: function(files, editor, welEditable) {
	                sendFile(files[0], editor, welEditable);
	            }

	    });
 });