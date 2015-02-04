<%@ page import="achauhan.Quote"%>

<div
	class="fieldcontain ${hasErrors(bean: quoteInstance, field: 'author', 'error')} required">

	<g:textField name="author" maxlength="30" required=""
		value="${quoteInstance?.author}" placeholder="Author" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: quoteInstance, field: 'category', 'error')} required">

	<g:textField name="category" maxlength="30" required=""
		value="${quoteInstance?.category}" placeholder="category -ex: love" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: quoteInstance, field: 'content', 'error')} required">
	<g:textArea name="content" cols="40" rows="5" maxlength="1000"
		required="" value="${quoteInstance?.content}" placeholder="quote" />
</div>