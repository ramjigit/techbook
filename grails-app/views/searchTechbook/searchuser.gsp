<%@ page import="org.springframework.util.ClassUtils"%>
<%@ page import="grails.plugin.searchable.internal.lucene.LuceneUtils"%>
<%@ page
	import="grails.plugin.searchable.internal.util.StringQueryUtils"%>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="layout" content="main">
<title><g:if test="${params.q && params.q?.trim() != ''}">
		${params.q} - </g:if>techbook</title>
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

		<div id="header">
			<h1>Search User</h1>
			<g:form url='[controller: "searchTechbook", action: "searchuser"]'
				id="searchableForm" name="searchableForm" method="get">
				<g:textField name="q" value="${params.q}" size="50" />
			</g:form>
		</div>
		<div class="div70">
			<div id="main">
				<g:set var="haveQuery" value="${params.q?.trim()}" />
				<g:set var="haveResults" value="${searchResult?.results}" />
				<hr>
				<div class="title">
					<span> <g:if test="${haveQuery && haveResults}">
          Showing <strong> ${searchResult.offset + 1}
							</strong> - <strong> ${searchResult.results.size() + searchResult.offset}
							</strong> of <strong> ${searchResult.total}
							</strong>
          results for <strong> ${params.q}
							</strong>
						</g:if> <g:else>
        &nbsp;
        </g:else>
					</span>
				</div>
				<hr>
				<g:if test="${haveQuery && !haveResults && !parseException}">
					<p>
						Nothing matched your query - <strong> ${params.q}
						</strong>
					</p>
					<g:if test="${!searchResult?.suggestedQuery}">
						<p>Suggestions:</p>
						<ul>
							<li>Try a suggested query: <g:link
									controller="searchTechbook" action="searchuser"
									params="[q: params.q, suggestQuery: true]">
								Search again with the <strong>suggestQuery</strong> option</g:link><br />
							</li>
						</ul>
					</g:if>
				</g:if>

				<g:if test="${searchResult?.suggestedQuery}">
					<p>
						Did you mean
						<g:link controller="searchTechbook" action="searchuser"
							params="[q: searchResult.suggestedQuery]">
							${StringQueryUtils.highlightTermDiffs(params.q.trim(), searchResult.suggestedQuery)}
						</g:link>
						?
					</p>
				</g:if>

				<g:if test="${parseException}">
					<p>
						Your query - <strong> ${params.q}
						</strong> - is not valid.
					</p>
					<p>Suggestions:</p>
					<ul>
						<li>Fix the query: see <a
							href="http://lucene.apache.org/java/docs/queryparsersyntax.html">Lucene
								query syntax</a> for examples
						</li>
						<g:if test="${LuceneUtils.queryHasSpecialCharacters(params.q)}">
							<li>Remove special characters like <strong>" - [ ]</strong>,
								before searching, eg, <em><strong> ${LuceneUtils.cleanQuery(params.q)}
								</strong></em><br /> <em>Use the Searchable Plugin's <strong>LuceneUtils#cleanQuery</strong>
									helper method for this: <g:link controller="searchTechbook"
										action="searchuser"
										params="[q: LuceneUtils.cleanQuery(params.q)]">Search again with special characters removed</g:link></em>
							</li>
							<li>Escape special characters like <strong>" - [ ]</strong>
								with <strong>\</strong>, eg, <em><strong> ${LuceneUtils.escapeQuery(params.q)}
								</strong></em><br /> <em>Use the Searchable Plugin's <strong>LuceneUtils#escapeQuery</strong>
									helper method for this: <g:link controller="searchTechbook"
										action="searchuser"
										params="[q: LuceneUtils.escapeQuery(params.q)]">Search again with special characters escaped</g:link></em><br />
								<em>Or use the Searchable Plugin's <strong>escape</strong>
									option: <g:link controller="searchTechbook" action="searchuser"
										params="[q: params.q, escape: true]">Search again with the <strong>escape</strong> option enabled</g:link></em>
							</li>
						</g:if>
					</ul>
				</g:if>

				<g:if test="${haveResults}">
					<div class="tiles">
						<g:each var="result" in="${searchResult.results}" status="index">
							<div class="tile">
								<g:if test="${result?.photo}">
									<g:link controller="user" action="show" id="${result.id}">
										<img
											src="<g:createLink controller='user' action='renderImage' id='${result.id}'/>"
											class="userpic" />
									</g:link>
								</g:if>
								<g:link controller="user" action="show" id="${result.id}">
									<g:fieldValue bean="${result}" field="username" />
								</g:link>
								<span> ${fieldValue(bean: result, field: "firstName")} ${fieldValue(bean: result, field: "lastName")}
								</span><span> ${fieldValue(bean: result, field: "email")}
								</span>
							</div>
						</g:each>
					</div>

					<div>
						<div class="paging">
							<g:if test="${haveResults}">
              Page:
              <g:set var="totalPages"
									value="${Math.ceil(searchResult.total / searchResult.max)}" />
								<g:if test="${totalPages == 1}">
									<span class="currentStep">1</span>
								</g:if>
								<g:else>
									<g:paginate controller="searchTechbook" action="searchuser"
										params="[q: params.q]" total="${searchResult.total}"
										prev="&lt; previous" next="next &gt;" />
								</g:else>
							</g:if>
						</div>
					</div>
				</g:if>
			</div>
		</div>
	</div>
</body>
</html>