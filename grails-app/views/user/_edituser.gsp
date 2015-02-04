<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'photo', 'error')} ">
	<input type="file" id="photo" name="photo" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<g:textField name="username" maxlength="20" required=""
		value="${userInstance?.username}" placeholder="username" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
	<g:textField name="firstName" maxlength="20" required=""
		value="${userInstance?.firstName}" placeholder="first name" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
	<g:textField name="lastName" maxlength="10" required=""
		value="${userInstance?.lastName}" placeholder="last name" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'bio', 'error')} ">
	<g:textArea name="bio" cols="40" rows="12" maxlength="2000"
		value="${userInstance?.bio}" placeholder="about me" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
	<g:field type="email" name="email" value="${userInstance?.email}"
		required="" placeholder="email" />
</div>