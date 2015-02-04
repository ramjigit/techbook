<%@ page import="org.springframework.util.ClassUtils"%>
<%@ page import="grails.plugin.searchable.internal.lucene.LuceneUtils"%>
<%@ page
	import="grails.plugin.searchable.internal.util.StringQueryUtils"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="layout" content="main">
<title>Search | <g:if
		test="${params.q && params.q?.trim() != ''}">
		${params.q}
	</g:if></title>
<script type="text/javascript">
	var focusQueryInput = function() {
		document.getElementById("q").focus();
	}
</script>
</head>
<body onload="focusQueryInput();">
	<div class="common_container" role="navigation">
		<div class="quote_post_details">
			<g:if test="${quote?.content}">
				<span> ${quote.content}
				</span>
			</g:if>
			<br> -
			<g:if test="${quote?.author}">
				<strong><g:fieldValue bean="${quote}" field="author" /></strong>
			</g:if>
		</div>
		<div class="div70nav">
			<ul>
				<li><g:link controller="post" action="create">
				create a tutorial
					</g:link></li>
				<li><g:link controller="user" action="list">
						users
					</g:link></li>
			</ul>
		</div>
		<g:form url='[controller: "searchTechbook", action: "searchtb"]'
			id="searchableForm" name="searchableForm" method="get">
			<g:textField name="q" value="${params.q}" size="50" />
		</g:form>
		<div id="main">
			<g:set var="haveQuery" value="${params.q?.trim()}" />
			<div class="title">
				<span> <g:if test="${haveQuery}">
          				Showing results for <strong> ${params.q}</strong>
						<hr>
					</g:if> <g:else>
        				&nbsp;
        			</g:else>
				</span>
			</div>
			<g:if test="${parseException}">
				<p>
					Your query - <strong> ${params.q}
					</strong> - is not valid.
				</p>
				<p>Suggestions:</p>
				<ul>
					<li>Fix the query: see <a href="http://lucene.apache.org">Lucene
							query syntax</a> for examples
					</li>
					<g:if test="${LuceneUtils.queryHasSpecialCharacters(params.q)}">
						<li>Remove special characters like <strong>" - [ ]</strong>,
							before searching, eg, <em><strong> ${LuceneUtils.cleanQuery(params.q)}
							</strong></em><br /> <em>Use the Searchable Plugin's <strong>LuceneUtils#cleanQuery</strong>
								helper method for this: <g:link controller="public"
									action="open_search_techwalk"
									params="[q: LuceneUtils.cleanQuery(params.q)]">Search again with special characters removed</g:link></em>
						</li>
						<li>Escape special characters like <strong>" - [ ]</strong>
							with <strong>\</strong>, eg, <em><strong> ${LuceneUtils.escapeQuery(params.q)}
							</strong></em><br /> <em>Use the Searchable Plugin's <strong>LuceneUtils#escapeQuery</strong>
								helper method for this: <g:link controller="public"
									action="open_search_techwalk"
									params="[q: LuceneUtils.escapeQuery(params.q)]">Search again with special characters escaped</g:link></em><br />
							<em>Or use the Searchable Plugin's <strong>escape</strong>
								option: <g:link controller="public"
									action="open_search_techwalk"
									params="[q: params.q, escape: true]">Search again with the <strong>escape</strong> option enabled</g:link></em>
						</li>
					</g:if>
				</ul>
			</g:if>
			<g:if test="${!parseException}">
				<div class="results">
					<div class="result_left">
						<div id="divider"></div>
						<g:each var="result" in="${userSearch.results}">
							<g:set var="className"
								value="${ClassUtils.getShortName(result.getClass())}" />
							<g:set var="link"
								value="${createLink(controller: className[0].toLowerCase() + className[1..-1], action: 'show', id: result.id)}" />
							${result }
						</g:each>
					</div>
				</div>
				<div class="results">
					<div class="result_left">
						<div id="divider"></div>
						<g:each var="result" in="${postSearch.results}">
							<g:set var="className"
								value="${ClassUtils.getShortName(result.getClass())}" />
							<g:set var="link"
								value="${createLink(controller: className[0].toLowerCase() + className[1..-1], action: 'show', id: result.id)}" />
							${result }
						</g:each>
					</div>
				</div>
			</g:if>
		</div>
	</div>
</body>
</html>