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
				<li><g:link controller="quote" action="create">
				post a quote
					</g:link></li>
				<li><g:link controller="user" action="list">
						users
					</g:link></li>
			</ul>
		</div>

		<div id="header">
			<h1>Search Quote</h1>
			<g:form url='[controller: "searchTechbook", action: "searchquote"]'
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
									controller="searchTechbook" action="searchquote"
									params="[q: params.q, suggestQuery: true]">
								Search again with the <strong>suggestQuery</strong> option</g:link><br />
							</li>
						</ul>
					</g:if>
				</g:if>

				<g:if test="${searchResult?.suggestedQuery}">
					<p>
						Did you mean
						<g:link controller="searchTechbook" action="searchquote"
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
										action="searchquote"
										params="[q: LuceneUtils.cleanQuery(params.q)]">Search again with special characters removed</g:link></em>
							</li>
							<li>Escape special characters like <strong>" - [ ]</strong>
								with <strong>\</strong>, eg, <em><strong> ${LuceneUtils.escapeQuery(params.q)}
								</strong></em><br /> <em>Use the Searchable Plugin's <strong>LuceneUtils#escapeQuery</strong>
									helper method for this: <g:link controller="searchTechbook"
										action="searchquote"
										params="[q: LuceneUtils.escapeQuery(params.q)]">Search again with special characters escaped</g:link></em><br />
								<em>Or use the Searchable Plugin's <strong>escape</strong>
									option: <g:link controller="searchTechbook"
										action="searchquote" params="[q: params.q, escape: true]">Search again with the <strong>escape</strong> option enabled</g:link></em>
							</li>
						</g:if>
					</ul>
				</g:if>

				<g:if test="${haveResults}">
					<div class="quote_tiles_left">
						<g:each in="${searchResult.results}" status="i"
							var="quoteInstance">
							<div class="quote_tile_left">
								<div class="quote_tile-inner_left">
									<postDate:dateFromNow date="${quoteInstance.dateCreated}" />
									<span>by -</span>
									<g:link controller="user" action="show"
										id="${quoteInstance.user.id}">
										${ quoteInstance.user.firstName}
										${ quoteInstance.user.lastName}
										<g:if test="${ quoteInstance?.user?.photo}">
											<img
												src="<g:createLink controller='user' action='renderImage' id='${quoteInstance.user.id}'/>"
												class="profile_pic" />
										</g:if>
									</g:link>
									<br>
									<hr>
									<g:link controller="quote" action="show" id="${quoteInstance.id}">
										<span> ${quoteInstance.content}
										</span> -</g:link>
									<strong> ${fieldValue(bean: quoteInstance, field: "author")}
									</strong>
									<hr>
									<span class="category"> ${fieldValue(bean: quoteInstance, field: "category")}
									</span>
								</div>
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
									<g:paginate controller="searchTechbook" action="searchquote"
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