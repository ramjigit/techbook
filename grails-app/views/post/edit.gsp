<%@ page import="achauhan.Post"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Edit | <g:if test="${postInstance?.title}">
		${postInstance.title}
	</g:if> <g:else>
		Post
	</g:else></title>
<script type="text/javascript"
	src="/techbook/tinymce/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript">
	tinymce
			.init({
				selector : "textarea#createpost",
				plugins : [
						"advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
						"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
						"table contextmenu directionality emoticons template textcolor paste textcolor" ],
				toolbar1 : "bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect",
				toolbar2 : "searchreplace | bullist numlist | blockquote | undo redo | link unlink anchor image media code | inserttime | forecolor backcolor",
				toolbar3 : "table | hr | subscript superscript | charmap emoticons | print | preview |",
				height : "300",
				width : 810,
				menubar : false,
				toolbar_items_size : 'small',
			});
</script>
<script type="text/javascript">
	function getTinymcePostAreaValue() {
		tinyMCE.triggerSave();
	}
</script>
</head>
<body>
	<div class="common_container" role="navigation">
		<div class="div70nav">
			<ul>
				<li><g:link class="list" action="list">
				view all tutorial
					</g:link></li>
				<li><g:link class="create" action="create">
				create a post
					</g:link></li>
			</ul>
		</div>
		<div class="div70">
			<g:if test="${flash.message}">
				<div class="alert alert-info" role="alert">
					${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${postInstance}">
				<ul class="errors" role="alert">
					<g:eachError bean="${postInstance}" var="error">
						<li
							<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
								error="${error}" /></li>
					</g:eachError>
				</ul>
			</g:hasErrors>
			<g:form method="post" enctype="multipart/form-data">
				<g:hiddenField name="id" value="${postInstance?.id}" />
				<g:hiddenField name="version" value="${postInstance?.version}" />
				<fieldset class="form">
					<g:render template="form" />
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="saveDiv70" action="update" value="Update"
						onclick="getTinymcePostAreaValue()" />
					<g:actionSubmit class="deleteDiv70" action="delete" value="Delete"
						formnovalidate=""
						onclick="return confirm('Are you sure, you want to delete this post ?');" />
				</fieldset>
			</g:form>
		</div>
	</div>
</body>
</html>
