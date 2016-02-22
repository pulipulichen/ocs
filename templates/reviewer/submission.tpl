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

function confirmIntegratedSubmissionCheck() {
	if ($('[name="recommendation"]').val()=='') {
		alert('{/literal}{translate|escape:"javascript" key="reviewer.paper.mustSelectDecision"}{literal}');
                $('[name="recommendation"]').focus();
		return false;
	}
	if (confirm('{/literal}{translate|escape:"javascript" key="reviewer.paper.confirmDecision"}{literal}')) {
            $('[name="draft"]').val(0);
            //alert($('[name="draft"]').val());
            //return true;
            return true;
        }
        return false;
}
// -->
{/literal}
</script>
<div id="submissionToBeReviewed">
<h3>{translate key="reviewer.paper.submissionToBeReviewed"}</h3>

<table width="100%" class="data">
    

{if $tracks|@count > 1}
<tr valign="top">
	<td class="label">{translate key="paper.conferenceTrack"}</td>
	<td class="value">{$submission->getTrackTitle()|escape}</td>
</tr>
{/if}
    
{assign var=sessionType value=$submission->getData('sessionType')}
{if isset($sessionTypes[$sessionType])}
	<tr valign="top">
		<td width="20%" class="label">{translate key="paper.sessionType"}</td>
		<td width="80%" colspan="2" class="data">{$sessionTypes[$sessionType]|escape}</td>
	</tr>
{/if}{* isset($sessionTypes[$submissionType]) *}

<tr valign="top">
	<td width="20%" class="label">{translate key="paper.title"}</td>
	<td width="80%" class="value">
            {$submission->getLocalizedTitle()|strip_unsafe_html}
        </td>
</tr>

{assign var="abstract" value=$submission->getLocalizedAbstract()|strip_unsafe_html|nl2br}
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
<form action="{url op="recordRecommendationIntegrated"}" method="post">
<h3>
    {translate key="reviewer.paper.reviewSteps"}
</h3>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

{if $draft === "1"}
    <div class="alert alert-info" role="alert">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
        {translate key="reviewer.paper.reviewMessage.draft"}
    </div>
{elseif $draft === "0"}
    <div class="alert alert-info" role="alert">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
        {translate key="reviewer.paper.reviewMessage.saved"}
    </div>
{/if}

{include file="common/formErrors.tpl"}

{assign var="currentStep" value=1}

{if !$submission->getCancelled()}
<table width="100%" class="data">
    
    {if $declined or not $confirmedStatus}
    <tr>
        <th class="label" style="white-space: normal" width="20%">
            {translate key="reviewer.paper.acceptConfirm"}
        </th>
        <td class="value" width="80%">
                
                
                
            <!--{translate key="submission.response"}&nbsp;&nbsp;&nbsp;&nbsp;-->
		{if not $confirmedStatus}
			{url|assign:"acceptUrl" op="confirmReview" reviewId=$reviewId}
			{url|assign:"declineUrl" op="confirmReview" reviewId=$reviewId declineReview=1}
                        
			{if !$submission->getCancelled()}
				
                                {if $schedConf->getLocalizedSetting('reviewGuidelines') != ''}
                                    <div class="instruct">{translate key="reviewer.paper.consultGuidelines"}</div>
                                {/if}
                            
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
                            {translate key="reviewer.paper.reviewCanceled"} 
			{/if}
		{else}
                    {if not $declined}
                        <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                        {translate key="submission.accepted"}
                    {else}
                        <span class="text-danger">
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                        {translate key="reviewer.paper.cannotDoReview"}
                        </span>
                    {/if}
		{/if}
                
                <!--
                {if not $confirmedStatus}
                    <div class="instruct">{translate key="reviewer.paper.notifyEditorA"}{if $editAssignment}, {$editAssignment->getDirectorFullName()|escape},{/if} {translate key="reviewer.paper.notifyEditorB"}</div>
                {/if}
                -->
        </td>
    </tr>
    {/if}
    {if $confirmedStatus AND !$declined}
    {if $schedConf->getSetting('reviewMode') != REVIEW_MODE_ABSTRACTS_ALONE}
    <tr>
        <th class="label">
            <span class="instruct">
                {if ($confirmedStatus and not $declined) or not $schedConf->getSetting('restrictReviewerFileAccess')}
				{if $reviewAssignment->getStage() == REVIEW_STAGE_ABSTRACT}
                                    {translate key="submission.abstract"}
                                {else}
                                    {translate key="$reviewerInstruction3"}
                                {/if}
                {else}
                    {translate key="$reviewerInstruction3"}
                {/if}
            </span>
        </th>
        
        <td class="value">
            
			{if ($confirmedStatus and not $declined) or not $schedConf->getSetting('restrictReviewerFileAccess')}
				{if $reviewAssignment->getStage() == REVIEW_STAGE_ABSTRACT}
					{$submission->getLocalizedAbstract()|strip_unsafe_html|nl2br}
				{else}
                                        {if $reviewFile}
                                            {if $submission->getDateConfirmed() or not $schedConf->getSetting('restrictReviewerAccessToFile')}
                                                <a href="{url op="downloadFile" path=$reviewId|to_array:$paperId:$reviewFile->getFileId():$reviewFile->getRevision()}" 
                                                   class="file btn btn-primary">
                                                    <span class="glyphicon glyphicon-save-file" aria-hidden="true"></span>
                                                    {$reviewFile->getFileName()|escape}
                                                </a>
                                        {else}
                                            <a class="btn btn-default disabled">
                                                {$reviewFile->getFileName()|escape}
                                            </a>
                                        {/if}
                                        &nbsp;&nbsp;
                                        ({$reviewFile->getDateModified()|date_format:$dateFormatShort})
                                    {else}
                                        {translate key="common.none"}
                                    {/if}
				{/if}
			{else}
                            {translate key="reviewer.paper.restrictedFileAccess"}
			{/if}
        </td>
    </tr>
        <!--
        {if $suppFiles}
            <tr valign="top">
                <td class="label">
                    {translate key="reviewer.paper.suppFiles"}
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
        {/if}
            -->
    {/if}
    {if $confirmedStatus and not $declined}
<tr valign="top">
	<td class="label">
            {if $isConferenceManager and !$reviewAssignment->getDateCompleted()}
                {if $reviewAssignment->getReviewFormId()}
                <a class="edit-link" href="{url page="manager"}/editReviewForm/{$reviewAssignment->getReviewFormId()}" target="_blank">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                </a>
                {else}
                    <a class="edit-link" href="{url page="director" op="selectReviewForm"}/{$paperId}/{$reviewId}" target="_blank">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    </a>
                {/if}
            {/if}
            <label for="commentAuthor">{translate key="submission.comments.forAuthorDirector"} *</label> 
        </td>
        <td class="value">
            {if !$reviewAssignment->getDateCompleted()}
                <textarea id="commentAuthor" name="commentAuthor" style="width:100%;" rows="10" cols="50" class="textArea">{$commentAuthor|escape}</textarea>
            {else}
                {$commentAuthor|nl2br|default:"&mdash;"}
            {/if}
        </td>
</tr>
<tr valign="top">
	<td class="label">
            {if $isConferenceManager and !$reviewAssignment->getDateCompleted()}
                {if $reviewAssignment->getReviewFormId()}
                <a class="edit-link" href="{url page="manager"}/editReviewForm/{$reviewAssignment->getReviewFormId()}" target="_blank">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                </a>
                {else}
                    <a class="edit-link" href="{url page="director" op="selectReviewForm"}/{$paperId}/{$reviewId}" target="_blank">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    </a>
                {/if}
            {/if}
            <label for="commentDirector">{translate key="submission.comments.forDirector"}</label>
        </td>
	<td class="value">
            {if !$reviewAssignment->getDateCompleted()}
                <textarea id="commentDirector" name="commentDirector" style="width:100%;" rows="10" cols="50" class="textArea">{$commentDirector|escape}</textarea>
            {else}
                {$commentDirector|nl2br|default:"&mdash;"}
            {/if}
        </td>
</tr>
{if $commentSurveyForm}
<tr valign="top">
	<td class="label">
            {if $isConferenceManager and !$reviewAssignment->getDateCompleted()}
                {if $reviewAssignment->getReviewFormId()}
                <a class="edit-link" href="{url page="manager"}/editReviewForm/{$reviewAssignment->getReviewFormId()}" target="_blank">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                </a>
                {else}
                    <a class="edit-link" href="{url page="director" op="selectReviewForm"}/{$paperId}/{$reviewId}" target="_blank">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    </a>
                {/if}
            {/if}
            <label>{translate key="submission.comments.survey"} *</label>
        </td>
	<td class="value">
            
            <script type="text/javascript" src="{$baseUrl}/lib/jquery-survey/handlebars.js"></script>
            <script type="text/javascript" src="{$baseUrl}/lib/jquery-survey/jQuery.Survey.js"></script>
            <script type="text/javascript" src="{$baseUrl}/lib/jquery-survey/jquery.validate.js"></script>
            <textarea id="commentSurveyForm" style="width:100%;" rows="10" cols="50" class="textArea jquery-survey-form {if $reviewAssignment->getDateCompleted()}report{/if}" jquery-survey-data="commentSurvey">{$commentSurveyForm|escape}</textarea>
            <textarea id="commentSurvey" name="commentSurvey" style="width:100%;" rows="10" cols="50" class="textArea">{$commentSurvey|escape}</textarea>
            
            {if $reviewAssignment->getDateCompleted() && !$commentSurvey}
                &mdash;
            {/if}
        </td>
</tr>
{/if}
    {else}
        <tr>
            <td class="label">
                {translate key="reviewer.paper.comment"}
            </td>
            <td class="value">
                {translate key="common.closed"}
            </td>
        </tr>
    {/if}
    <!--
    {if $reviewAssignment->getReviewFormId()}
    <tr>
        <td class="label">
            {translate key="reviewer.paper.comment"}
        </td>
        <td class="value">
            
            {if $confirmedStatus and not $declined}
                    <a href="javascript:openComments('{url op="viewPeerReviewComments" path=$paperId|to_array:$reviewId}');" 
                        class="btn btn-primary">
                         <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                         {*translate key="event.logType.review"*} 
                         {translate key="common.edit"}
                     </a>
            {else}
                <a class="btn btn-default disabled">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                    {*translate key="event.logType.review"*} 
                    {translate key="common.close"}
               </a>
                     {*icon name="comment" disabled="disabled"*}
            {/if}
            
        </td>
    </tr>
    {else}{* $reviewAssignment->getReviewFormId() *}
    <tr>
        <td class="label">
            {translate key="submission.comments.forAuthorDirector"}
        </td>
        <td class="value">
            
			{if $confirmedStatus and not $declined}
				<a href="javascript:openComments('{url op="viewPeerReviewComments" path=$paperId|to_array:$reviewId}');" 
                                   class="btn btn-primary">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    {*translate key="event.logType.review"*} 
                                    {translate key="common.edit"}
                                </a>
			{else}
                            <a class="btn btn-default disabled">
                                 <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                 {*translate key="event.logType.review"*} 
                                 {translate key="common.close"}
                            </a>
				 {*icon name="comment" disabled="disabled"*}
			{/if}
        </td>
    </tr>
    {/if}
    -->
    <tr>
        <td class="label">
            <span class="instruct">
                {translate key="reviewer.paper.uploadFile"}
            </span>
        </td>
        <td class="value">
			{foreach from=$submission->getReviewerFileRevisions() item=reviewerFile key=key}
                            <div>
				{assign var=uploadedFileExists value="1"}
					<a href="{url op="downloadFile" path=$reviewId|to_array:$paperId:$reviewerFile->getFileId():$reviewerFile->getRevision()}" 
                                           class="file btn btn-default btn-sm">
                                            <span class="glyphicon glyphicon-save-file" aria-hidden="true"></span>
                                            {$reviewerFile->getOriginalFileName()|escape}
                                        </a>
					({$reviewerFile->getDateModified()|date_format:$dateFormatShort})
					{if (!$submission->getDateCompleted() && !$submission->getCancelled())}
                                            <a class="action" href="{url op="deleteReviewerVersion" path=$reviewId|to_array:$reviewerFile->getFileId():$reviewerFile->getRevision()}">{translate key="common.delete"}</a>
					{/if}
                                </div>
			{foreachelse}
                            {*translate key="common.none"*}
                            <!--&mdash;-->
			{/foreach}
		{if !$reviewAssignment->getDateCompleted()}
			<!--<form method="post" action="{url op="uploadReviewerVersion"}" enctype="multipart/form-data">-->
                    <div>
				<input type="hidden" name="reviewId" value="{$reviewId|escape}" />
				<input type="file" name="upload" {if not $confirmedStatus or $declined or $submission->getCancelled()}disabled="disabled"{/if} class="uploadField" />
                                <input type="submit" name="submit" value="{translate key="common.upload"}" {if not $confirmedStatus or $declined or $submission->getCancelled()}disabled="disabled"{/if} class="button" 
                                       onclick="return PULI_HELPERS.setForm(this, '{url op="uploadReviewerVersion"}', 'multipart/form-data');" />
                                </div>
			<!--</form>-->
			<!-- <span class="instruct">
				<a class="action" href="javascript:openHelp('{get_help_id key="editorial.trackDirectorsRole.review.blindPeerReview" url="true"}')">{translate key="reviewer.paper.ensuringBlindReview"}</a>
			</span> -->
		{/if}
        </td>
    </tr>
    
    
    
    {if not $confirmedStatus or $declined or $submission->getCancelled() or (!$reviewFormResponseExists and !$reviewAssignment->getMostRecentPeerReviewComment() and !$uploadedFileExists)}
        {assign var="disableRecommend" value=true}
    {/if}
    <!--
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
                {if !$disableRecommend}
                <form name="recommendation" method="post" action="{url op="recordRecommendation"}">
                    <input type="hidden" name="reviewId" value="{$reviewId|escape}" />
                    <select name="recommendation" {if $disableRecommend}disabled="disabled"{/if} 
                            class="selectMenu btn btn-default" onchange="if (confirmSubmissionCheck()) $(this).parents('form:first').submit(); else this.value='';">
                            {html_options_translate options=$reviewerRecommendationOptions selected=''}
                    </select>&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="submit" name="submit" onclick="return confirmSubmissionCheck()" class="button hide" value="{translate key="reviewer.paper.submitReview"}" {if not $confirmedStatus or $declined or $submission->getCancelled() or (!$reviewFormResponseExists and !$reviewAssignment->getMostRecentPeerReviewComment() and !$uploadedFileExists)}disabled="disabled"{/if} />
                    
                {else}
                {translate key="reviewer.paper.requireRecommendation"}
                {/if}
                </form>					
            {/if}
        </td>
    </tr>
    -->
    <tr>
        <td class="label" width="20%">
            <span class="instruct">{translate key="reviewer.paper.selectRecommendation"}</span>
        </td>
        <td class="value" width="80%">
            <input type="hidden" name="reviewId" value="{$reviewId|escape}" />
            {if !$reviewAssignment->getDateCompleted()}
                <select name="recommendation" 
                        class="btn btn-default">
                        {html_options_translate options=$reviewerRecommendationOptions selected=$reviewAssignment->getRecommendation()}
                </select>
            {else}
                {assign var="recommendation" value=$reviewAssignment->getRecommendation()}
                {translate key=$reviewerRecommendationOptions.$recommendation}
            {/if}
        </td>
    </tr>
    {/if} {* {if $confirmedStatus} *}
</table>
    {if !$reviewAssignment->getDateCompleted()}
        <input type="hidden" name="draft" value="1" />
    {else} 
        <input type="hidden" name="draft" value="0" />
    {/if}
    {if !$declined and $confirmedStatus}
    <p class="text-center margintop20">
        {if !$reviewAssignment->getDateCompleted()}
            <input type="submit" value="{translate key="common.done"}" class="btn btn-primary" 
                   onclick="return confirmIntegratedSubmissionCheck()" />
            <input type="submit" value="{translate key="common.draft"}" class="btn btn-default" />
        {else}
            <input type="submit" value="{translate key="reviewer.paper.notifyTheDirector"}" class="btn btn-primary" /> 
        {/if}
    </p>
    {/if}
{else}
    <p>
        {translate key="reviewer.paper.reviewCanceled"}
    </p>
{/if}
</form>
</div>
{if $schedConf->getLocalizedSetting('reviewGuidelines') != ''}
<div class="separator"></div>
<div id="reviewerGuidelines">
{if $isConferenceManager}
<a class="edit-link" href="{url page="manager"}/schedConfSetup/3#peerReview" target="_blank">
    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
</a>
{/if}
<h3>{translate key="reviewer.paper.reviewerGuidelines"}</h3>
<p>{$schedConf->getLocalizedSetting('reviewGuidelines')|nl2br}</p>
</div>
{/if}

{include file="common/footer.tpl"}

