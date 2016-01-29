{**
 * submission.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Submission summary.
 *
 * $Id$
 *}
{strip}
{translate|assign:"pageTitleTranslated" key="submission.page.summary" id=$submission->getPaperId()}
{assign var="pageCrumbTitle" value="submission.summary"}
{include file="common/header.tpl"}
{/strip}

<ul class="nav nav-tabs">
	{if $submission->getReviewMode() == REVIEW_MODE_BOTH_SEQUENTIAL}
		<li><a href="{url op="submissionReview" path=$submission->getPaperId()|to_array:$smarty.const.REVIEW_STAGE_ABSTRACT}">
			{translate key="submission.abstractReview"}</a>
		</li>
		<li><a href="{url op="submissionReview" path=$submission->getPaperId()|to_array:$smarty.const.REVIEW_STAGE_PRESENTATION}">
			{translate key="submission.paperReview"}</a>
		</li>
	{else}
		<li><a href="{url op="submissionReview" path=$submission->getPaperId()}">{translate key="submission.review"}</a></li>
	{/if}
        
        {if $submission->getReviewMode() == REVIEW_MODE_BOTH_SEQUENTIAL}
		<li>
			<a href="{url op="submissionAssignReviewer" path=$submission->getPaperId()|to_array:$smarty.const.REVIEW_STAGE_ABSTRACT}">
                            {translate key="director.paper.selectReviewer"}
                        </a>
                </li>
		<li>
			<a href="{url op="submissionAssignReviewer" path=$submission->getPaperId()|to_array:$smarty.const.REVIEW_STAGE_PRESENTATION}">
				{translate key="director.paper.selectReviewer"}</a>
		</li>
	{else}
		<li>
                    <a href="{url op="submissionAssignReviewer" path=$submission->getPaperId()}">{translate key="director.paper.selectReviewer"}</a>
                </li>
	{/if}
        
        <li class="current active"><a href="{url op="submission" path=$submission->getPaperId()}">{translate key="submission.summary"}</a></li>
        
	<li><a href="{url op="submissionHistory" path=$submission->getPaperId()}">{translate key="submission.history"}</a></li>
</ul>

{include file="trackDirector/submission/management.tpl"}

{include file="submission/metadata/metadata.tpl"}

<!--
<div class="separator"></div>

{include file="trackDirector/submission/status.tpl"}
-->
{include file="common/footer.tpl"}
