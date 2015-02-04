<div
	class="fieldcontain ${hasErrors(bean: postInstance, field: 'postPic', 'error')} ">
	<input type="file" id="postPic" name="postPic" />
</div>
<hr>
<div
	class="fieldcontain ${hasErrors(bean: postInstance, field: 'title', 'error')} required">
	<g:textField name="title" maxlength="255" required=""
		value="${postInstance?.title}" placeholder="tutorial title" />
</div>
<div
	class="fieldcontain ${hasErrors(bean: postInstance, field: 'subject', 'error')} required">
	<g:textField name="subject" maxlength="255" required=""
		value="${postInstance?.subject}" placeholder="tutorial subject" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: postInstance, field: 'topic', 'error')} required">
	<g:textField name="topic" maxlength="255" required=""
		value="${postInstance?.topic}" placeholder="subject topic" />
</div>
<hr>
<div
	class="fieldcontain ${hasErrors(bean: postInstance, field: 'message', 'error')} required">
	<label for="message"> Tutorial Content <span
		class="required-indicator">*</span>
	</label>
	<g:textArea name="message" cols="40" rows="5" maxlength="5000"
		required="" id="createpost" value="${postInstance?.message}" />
</div>
<hr>