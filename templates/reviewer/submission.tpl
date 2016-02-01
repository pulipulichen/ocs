{**
 * submission.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Show the reviewer administration page.
 *
 * FIXME: At "Notify The Director", fix the date.
 *
 * $Id$
 *}
{strip}
{assign var="paperId" value=$submission->getPaperId()}
{assign var="reviewId" value=$reviewAssignment->getId()}
{if $reviewAssignment->getStage() == REVIEW_STAGE_ABSTRACT}
	{translate|assign:"pageTitleTranslated" key="submission.page.abstractReview" id=$paperId}
	{assign var="pageCrumbTitle" value="submission.abstractReview"}
{else}
	{translate|assign:"pageTitleTranslated" key="submission.page.paperReview" id=$paperId}
	{assign var="pageCrumbTitle" value="submission.paperReview"}
{/if}
{include file="common/header.tpl"}
{/strip}

<script type="text/javascript">
{literal}
<!--
function confirmSubmissionCheck() {
	if (document.recommendation.recommendation.value=='') {
		alert('{/literal}{translate|escape:"javascript" key="reviewer.paper.mustSelectDecision"}{literal}');
		return false;
	}
	return confirm('{/literal}{translate|escape:"javascript" key="reviewer.paper.confirmDecision"}{literal}');
}
// -->
{/literal}
</script>
<div id="submissionToBeReviewed">
<h3>{translate key="reviewer.paper.submissionToBeReviewed"}</h3>

<table width="100%" class="data">
<tr valign="top">
	<td width="20%" class="label">{translate key="paper.title"}</td>
	<td width="80%" class="value">{$submission->getLocalizedTitle()|strip_unsafe_html}</td>
</tr>

{assign var=sessionType value=$submission->getData('sessionType')}
{if isset($sessionTypes[$sessionType])}
	<tr valign="top">
		<td width="20%" class="label">{translate key="paper.sessionType"}</td>
		<td width="80%" colspan="2" class="data">{$sessionTypes[$sessionType]|escape}</td>
	</tr>
{/if}{* isset($sessionTypes[$submissionType]) *}

<tr valign="top">
	<td class="label">{translate key="paper.conferenceTrack"}</td>
	<td class="value">{$submission->getTrackTitle()|escape}</td>
</tr>
{assing var="abstract" value=$submission->getLocalizedAbstract()|strip_unsafe_html|nl2br}
{if $abstract and $abstract != ""}
<tr valign="top">
    
	<td class="label">{translate key="paper.abstract"}</td>
	<td class="value">{$submission->getLocalizedAbstract()|strip_unsafe_html|nl2br}</td>
</tr>
{/if}
{assign var=editAssignments value=$submission->getEditAssignments()}
{foreach from=$editAssignments item=editAssignment}
	{if !$notFirstEditAssignment}
		{assign var=notFirstEditAssignment value=1}
		<tr valign="top">
			<td class="label">{translate key="reviewer.paper.submissionDirector"}</td>
			<td class="value">
	{/if}
			{assign var=emailString value=$editAssignment->getDirectorFullName()|concat:" <":$editAssignment->getDirectorEmail():">"}
			{url|assign:"url" page="user" op="email" to=$emailString|to_array redirectUrl=$currentUrl subject=$submission->getLocalizedTitle()|strip_tags paperId=$paperId}
                        {url|assign:"emailDirectorUrl" op="emailDirector" paperId=$paperId reviewId=$reviewId}
                        <a hre
			
                        <a class="btn btn-default" href="{$emailDirectorUrl}">
                            <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                            {$editAssignment->getDirectorFullName()|escape} 
                            {*icon name="mail" url=$url*}
                        </a>
			({if $editAssignment->getIsDirector()}{translate key="user.role.director"}{else}{translate key="user.role.trackDirector"}{/if})
			<br/>
{/foreach}
{if $notFirstEditAssignment}
		</td>
	</tr>
{/if}
<!--
<tr valign="top">
	<td class="label">{translate key="submission.metadata"}</td>
	<td class="value">
		<a href="{url op="viewMetadata" path=$reviewId|to_array:$paperId}" class="action" target="_new">{translate key="submission.viewMetadata"}</a>
	</td>
</tr>
-->
</table>
</div>
<div class="separator"></div>
<div id="reviewSchedule">
<h3>{translate key="reviewer.paper.reviewSchedule"}</h3>
<table width="100%" class="data">
<tr valign="top">
	<td class="label" width="20%">{translate key="reviewer.paper.schedule.request"}</td>
	<td class="value" width="80%">{if $submission->getDateNotified()}{$submission->getDateNotified()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
</tr>
<tr valign="top">
	<td class="label">{translate key="reviewer.paper.schedule.response"}</td>
	<td class="value">{if $submission->getDateConfirmed()}{$submission->getDateConfirmed()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
</tr>
<tr valign="top">
	<td class="label">{translate key="reviewer.paper.schedule.submitted"}</td>
	<td class="value">{if $submission->getDateCompleted()}{$submission->getDateCompleted()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
</tr>
<tr valign="top">
	<td class="label">
            {translate key="reviewer.paper.schedule.due"}
        </td>
	<td class="value">{if $submission->getDateDue()}{$submission->getDateDue()|date_format:$dateFormatShort}{else}&mdash;{/if}</td>
</tr>
</table>
</div>
<div class="separator"></div>
<div id="reviewSteps">
<h3>
    {*translate key="reviewer.paper.reviewSteps"*}
    審查作業
    {* @TODO 語系 *}
</h3>

{include file="common/formErrors.tpl"}

{assign var="currentStep" value=1}

<table width="100%" class="data">
    <tr>
        <th class="label" style="white-space: normal" width="30%">
            確認審查
            {* @TODO 語系 *}
        </th>
        <td class="value" width="80%">
            <!--{translate key="submission.response"}&nbsp;&nbsp;&nbsp;&nbsp;-->
		{if not $confirmedStatus}
			{url|assign:"acceptUrl" op="confirmReview" reviewId=$reviewId}
			{url|assign:"declineUrl" op="confirmReview" reviewId=$reviewId declineReview=1}

			{if !$submission->getCancelled()}
				
                                {*icon name="mail" url=$acceptUrl*}
                                <a href="{$acceptUrl}" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                                    {translate key="reviewer.paper.canDoReview"} 
                                </a>
				&nbsp;&nbsp;&nbsp;&nbsp;
				
                                {*icon name="mail" url=$declineUrl*}
                                <a href="{$declineUrl}" class="btn btn-default">
                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                    {translate key="reviewer.paper.cannotDoReview"} 
                                </a>
			{else}
				{*url|assign:"url" op="confirmReview" reviewId=$reviewId*}
                                
                                <a class="btn btn-primary disabled">
                                    <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                                    {translate key="reviewer.paper.canDoReview"} 
                                </a>
				{*translate key="reviewer.paper.canDoReview"} 
                                {icon name="mail" disabled="disabled" url=$acceptUrl*}
                                
				&nbsp;&nbsp;&nbsp;&nbsp;
				{*url|assign:"url" op="confirmReview" reviewId=$reviewId declineReview=1}
				{translate key="reviewer.paper.cannotDoReview"} 
                                {icon name="mail" disabled="disabled" url=$declineUrl*}
                                
                                <a class="btn btn-primary disabled">
                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                    {translate key="reviewer.paper.cannotDoReview"} 
                                </a>
			{/if}
		{else}
                    {if not $declined}
                        <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                        {translate key="submission.accepted"}
                    {else}
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                        {translate key="submission.rejected"}
                    {/if}
		{/if}
                
                {if $schedConf->getLocalizedSetting('reviewGuidelines') != ''}
                    <div class="instruct">{translate key="reviewer.paper.consultGuidelines"}</div>
                {/if}
                
                {if not $confirmedStatus}
                    <div class="instruct">{translate key="reviewer.paper.notifyEditorA"}{if $editAssignment}, {$editAssignment->getDirectorFullName()|escape},{/if} {translate key="reviewer.paper.notifyEditorB"}</div>
                {/if}
            
        </td>
    </tr>
    <tr>
        <th class="label">
            <span class="instruct">{translate key="$reviewerInstruction3"}</span>
        </th>
        <td class="value">
            {if $schedConf->getSetting('reviewMode') != REVIEW_MODE_ABSTRACTS_ALONE}
            <table width="100%" class="data">
			{if ($confirmedStatus and not $declined) or not $schedConf->getSetting('restrictReviewerFileAccess')}
				{if $reviewAssignment->getStage() == REVIEW_STAGE_ABSTRACT}
					<tr valign="top">
						<td class="label">
							{translate key="submission.abstract"}
						</td>
						<td class="value">
							{$submission->getLocalizedAbstract()|strip_unsafe_html|nl2br}
						</td>
					</tr>
				{else}
					<tr valign="top">
						<td class="label">
							{translate key="submission.submissionManuscript"}
						</td>
						<td class="value">
							{if $reviewFile}
							{if $submission->getDateConfirmed() or not $schedConf->getSetting('restrictReviewerAccessToFile')}
                                                            <a href="{url op="downloadFile" path=$reviewId|to_array:$paperId:$reviewFile->getFileId():$reviewFile->getRevision()}" 
                                                               class="file btn btn-primary">
                                                                <span class="glyphicon glyphicon-save-file" aria-hidden="true"></span>
                                                                {$reviewFile->getFileName()|escape}
                                                            </a>
							{else}{$reviewFile->getFileName()|escape}{/if}
							&nbsp;&nbsp;{$reviewFile->getDateModified()|date_format:$dateFormatShort}
							{else}
							{translate key="common.none"}
							{/if}
						</td>
					</tr>
				{/if}
				<tr valign="top">
					<td class="label">
						{translate key="paper.suppFiles"}
					</td>
					<td class="value">
						{assign var=sawSuppFile value=0}
						{foreach from=$suppFiles item=suppFile}
							{if $suppFile->getShowReviewers() }
                                                            {assign var=sawSuppFile value=1}
                                                            <a href="{url op="downloadFile" path=$reviewId|to_array:$paperId:$suppFile->getFileId()}" 
                                                               class="file btn btn-default">
                                                                <span class="glyphicon glyphicon-save-file" aria-hidden="true"></span>
                                                                {$suppFile->getOriginalFileName()|escape}
                                                            </a>
                                                            <br />
							{/if}
						{/foreach}

						{if !$sawSuppFile}
							{translate key="common.none"}
						{/if}
					</td>
				</tr>
			{else}
			<tr><td class="nodata">{translate key="reviewer.paper.restrictedFileAccess"}</td></tr>
			{/if}
		</table>
                {/if}
        </td>
    </tr>
    {if $reviewAssignment->getReviewFormId()}
    <tr>
        <td class="label">
            審查意見
        </td>
        <td class="value">
            
            {if $confirmedStatus and not $declined}
                    <!--
                    <a href="{url op="editReviewFormResponse" path=$reviewId|to_array:$reviewAssignment->getReviewFormId()}" class="btn btn-default">
                        {icon name="comment"}
                        {translate key="submission.reviewForm"} 
                    </a>
                    -->
                    <a href="javascript:openComments('{url op="viewPeerReviewComments" path=$paperId|to_array:$reviewId}');" 
                        class="btn btn-primary">
                         <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                         {*translate key="event.logType.review"*} 
                         編輯
                     </a>
            {else}
                <a class="btn btn-default disabled">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    {*translate key="event.logType.review"*} 
                    關閉
               </a>
                     {*icon name="comment" disabled="disabled"*}
            {/if}
            <!-- <span class="instruct">{translate key="reviewer.paper.enterReviewForm"}</span> -->
        </td>
    </tr>
    {else}{* $reviewAssignment->getReviewFormId() *}
    <tr>
        <td class="label">
            審查意見
        </td>
        <td class="value">
            
			{if $confirmedStatus and not $declined}
				<a href="javascript:openComments('{url op="viewPeerReviewComments" path=$paperId|to_array:$reviewId}');" 
                                   class="btn btn-primary">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    {*translate key="event.logType.review"*} 
                                    編輯
                                </a>
			{else}
                            <a class="btn btn-default disabled">
                                 <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                 {*translate key="event.logType.review"*} 
                                 關閉
                            </a>
				 {*icon name="comment" disabled="disabled"*}
			{/if}
        </td>
    </tr>
    {/if}
    
    <tr>
        <td class="label">
            <span class="instruct">
                {*translate key="reviewer.paper.uploadFile"*}
                審查委員檔案
            </span>
        </td>
        <td class="value">
            <table class="data" width="100%">
			{foreach from=$submission->getReviewerFileRevisions() item=reviewerFile key=key}
				{assign var=uploadedFileExists value="1"}
				<tr valign="top">
                                <!--
				<td class="label" width="20%">
					{if $key eq "0"}
						{translate key="reviewer.paper.uploadedFile"}
					{/if}
				</td>
                                -->
				<td class="value" width="">
					<a href="{url op="downloadFile" path=$reviewId|to_array:$paperId:$reviewerFile->getFileId():$reviewerFile->getRevision()}" 
                                           class="file btn btn-default btn-sm">
                                            <span class="glyphicon glyphicon-save-file" aria-hidden="true"></span>
                                            {$reviewerFile->getOriginalFileName()|escape}
                                        </a>
					({$reviewerFile->getDateModified()|date_format:$dateFormatShort})
					{if ($submission->getRecommendation() === null || $submission->getRecommendation() === '') && (!$submission->getCancelled())}
						<a class="action" href="{url op="deleteReviewerVersion" path=$reviewId|to_array:$reviewerFile->getFileId():$reviewerFile->getRevision()}">{translate key="common.delete"}</a>
					{/if}
				</td>
				</tr>
			{foreachelse}
				<tr valign="top">
                                <!--
				<td class="label" width="30%">
					{translate key="reviewer.paper.uploadedFile"}
				</td>
                                -->
				<td class="nodata">
					{translate key="common.none"}
				</td>
				</tr>
			{/foreach}
		</table>
		{if $submission->getRecommendation() === null || $submission->getRecommendation() === ''}
			<form method="post" action="{url op="uploadReviewerVersion"}" enctype="multipart/form-data">
				<input type="hidden" name="reviewId" value="{$reviewId|escape}" />
				<input type="file" name="upload" {if not $confirmedStatus or $declined or $submission->getCancelled()}disabled="disabled"{/if} class="uploadField" />
				<input type="submit" name="submit" value="{translate key="common.upload"}" {if not $confirmedStatus or $declined or $submission->getCancelled()}disabled="disabled"{/if} class="button" />
			</form>
			<!-- <span class="instruct">
				<a class="action" href="javascript:openHelp('{get_help_id key="editorial.trackDirectorsRole.review.blindPeerReview" url="true"}')">{translate key="reviewer.paper.ensuringBlindReview"}</a>
			</span> -->
		{/if}
        </td>
    </tr>
    
    
    
    {if not $confirmedStatus or $declined or $submission->getCancelled() or (!$reviewFormResponseExists and !$reviewAssignment->getMostRecentPeerReviewComment() and !$uploadedFileExists)}
        {assign var="disableRecommend" value=true}
    {/if}
    <tr>
        <td class="label">
            <span class="instruct">{translate key="reviewer.paper.selectRecommendation"}</span>
        </td>
        <td class="value">
            {if $submission->getRecommendation() !== null && $submission->getRecommendation() !== ''}
                    {assign var="recommendation" value=$submission->getRecommendation()}
                    <strong>{translate key=$reviewerRecommendationOptions.$recommendation}</strong>&nbsp;&nbsp;
                    {$submission->getDateCompleted()|date_format:$dateFormatShort}
            {else}
                <form name="recommendation" method="post" action="{url op="recordRecommendation"}" onsubmit="return confirmSubmissionCheck()">
                    <input type="hidden" name="reviewId" value="{$reviewId|escape}" />
                    <select name="recommendation" {if $disableRecommend}disabled="disabled"{/if} 
                            class="selectMenu btn btn-default" onchange="this.form.submit()">
                            {html_options_translate options=$reviewerRecommendationOptions selected=''}
                    </select>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="submit" name="submit" onclick="return confirmSubmissionCheck()" class="button hide" value="{translate key="reviewer.paper.submitReview"}" {if not $confirmedStatus or $declined or $submission->getCancelled() or (!$reviewFormResponseExists and !$reviewAssignment->getMostRecentPeerReviewComment() and !$uploadedFileExists)}disabled="disabled"{/if} />
                    
                {if $disableRecommend}
                請先輸入審查意見
                {/if}
                </form>					
            {/if}
        </td>
    </tr>
</table>
</div>
{if $schedConf->getLocalizedSetting('reviewGuidelines') != ''}
<div class="separator"></div>
<div id="reviewerGuidelines">
<h3>{translate key="reviewer.paper.reviewerGuidelines"}</h3>
<p>{$schedConf->getLocalizedSetting('reviewGuidelines')|nl2br}</p>
</div>
{/if}

{include file="common/footer.tpl"}

