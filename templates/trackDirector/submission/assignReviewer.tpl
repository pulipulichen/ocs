{**
 * peerReview.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Subtemplate defining the peer review table.
 *
 * $Id$
 *}
<script type="text/javascript">
{literal}
<!--
function confirmSubmissionCheck() {
    return confirm('{/literal}{translate|escape:"javascript" key="reviewer.paper.confirmDecision"}{literal}');
}
function confirmCancelCompleted() {
    return confirm('退回後審查委員可修改審查成果，您確定要退回審查結果嗎？');
    // {* @TODO 語系 *}
}
// -->
{/literal}
</script>

<div id="peerReview">

{if ($stage == REVIEW_STAGE_PRESENTATION && $submission->getCurrentStage() != REVIEW_STAGE_PRESENTATION)}
	{assign var="isStageDisabled" value=true}
{/if}

{if $isStageDisabled}
	<table class="data" width="100%">
		<tr valign="middle">
			<td><h3>{translate key="submission.peerReview"}</h3></td>
		</tr>
		<tr>
			<td><span class="instruct">{translate key="director.paper.stageDisabled"}</span></td>
		</tr>
	</table>
{else}
	<table class="data" width="100%">
		<tr valign="middle">
			<td width="30%">
				{if $submission->getReviewMode() == $smarty.const.REVIEW_MODE_BOTH_SIMULTANEOUS}
					<h3>{translate key="submission.review"}</h3>
				{elseif $stage == REVIEW_STAGE_ABSTRACT}
					<h3>{translate key="submission.abstractReview"}</h3>
				{else}{* REVIEW_STAGE_PRESENTATION *}
					<h3>{translate key="submission.paperReview"}</h3>
				{/if}
			</td>
			<td width="70%" class="nowrap">
				
			</td>
		</tr>
	</table>

	{assign var="start" value="A"|ord}
	{foreach from=$reviewAssignments item=reviewAssignment key=reviewKey}
	{assign var="reviewId" value=$reviewAssignment->getId()}
        
        {assign var="reviewCompleted" value=null}
        {if $reviewAssignment->getRecommendation() !== null && $reviewAssignment->getRecommendation() !== '' and $reviewAssignment->getDateCompleted()}
            {assign var="reviewCompleted" value=true}
        {/if}
        
        
	{if not $reviewAssignment->getCancelled()}
            <div class="panel {if $reviewCompleted}panel-primary{elseif $reviewAssignment->getDeclined()}panel-danger{elseif !$reviewAssignment->getDateNotified()}panel-danger{else}panel-default{/if}" id="peerReview{$reviewId}">
		{assign var="reviewIndex" value=$reviewIndexes[$reviewId]}
		<!--div class="separator"></div-->
                <div class="panel-heading">
		<table class="data" width="100%">
		<tr>
			<td width="20%"><h4 style="margin:0;">{translate key="user.role.reviewer"} {$reviewIndex+$start|chr}</h4></td>
			<td width="34%">
                            {url|assign:"reviewUrl" op="remindReviewer" reviewId=$reviewAssignment->getId() paperId=$submission->getPaperId()}
                            <h4 style="margin:0;">
                                <a href="{$reviewUrl}" class="btn btn-default btn-large">
                                <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                                {$reviewAssignment->getReviewerFullName()|escape}
                                </a>
                            </h4>
                            
                        </td>
			<td width="46%">
					{if not $reviewAssignment->getDateNotified()}
						<a href="{url op="clearReview" path=$submission->getPaperId()|to_array:$reviewAssignment->getId()}" 
                                                   class="action btn btn-default">
                                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                                    {translate key="director.paper.clearReview"}
                                                </a>
					{elseif $reviewAssignment->getDeclined() or not $reviewAssignment->getDateCompleted()}
						<a href="{url op="cancelReview" paperId=$submission->getPaperId() reviewId=$reviewAssignment->getId()}" 
                                                   class="action btn btn-default">
                                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                                    {translate key="director.paper.cancelReview"}
                                                </a>
					{/if}
			</td>
		</tr>
		</table>
                </div>
                <div class="panel-body">
		<table width="100%" class="data">
                    <tr>
                    <td class="label" width="20$">
                        管理網址 {* @TODO 語系 *}
                    </td>
                    <td width="80%">
                        {url|assign:"reviewerUrl" page="reviewer" op="submission"}
                        {assign var="reivewerId" value=$reviewAssignment->getReviewerId()}
                        {assign var="reviewerUrl" value="$reviewerUrl/$reviewId?u=$reivewerId"}
                        <a href="{$reviewerUrl}" target="_blank">{$reviewerUrl}</a>
                    </td>
                    </tr>
		<tr valign="top">
                    <td class="label" width="20%">
                        {translate key="submissions.reviewAssignment.heading"}
                    </td>
			<td width="80%">
                            <table width="100%" class="info table" style="margin-bottom: 0;">
                                    <tr>
                                        <th class="" style="border-top-width:0">{translate key="submission.request"}</th>
                                        <td class="value" style="border-top-width:0">
                                            {url|assign:"reviewUrl" op="notifyReviewer" reviewId=$reviewAssignment->getId() paperId=$submission->getPaperId()}
                                            {if !$allowRecommendation}
                                                    {*icon name="mail" url=$reviewUrl disabled="true"*}
                                                    <a href="{$reviewUrl}" class="btn btn-primary btn-sm">
                                                        <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                                                        {translate key="common.invite"}
                                                    </a>
                                            {elseif $reviewAssignment->getDateNotified()}
                                                    {$reviewAssignment->getDateNotified()|date_format:$dateFormatShort}
                                            {elseif !$reviewAssignment->getDeclined() and !$reviewAssignment->getDateNotified()}
                                                    <a href="{$reviewUrl}" class="btn btn-primary btn-sm">
                                                        <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                                                        {translate key="common.invite"}
                                                    </a>
                                            {/if}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th class="">
                                            {translate key="submissions.reviewAssignment.inviteResponded"}
                                        </th>
                                        <td class="value">
                                            {$reviewAssignment->getDateConfirmed()|date_format:$dateFormatShort|default:"&mdash;"}
                                            {if $reviewAssignment->getDeclined()}
                                                <div class="text-danger">
                                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>    
                                                    {translate key="trackDirector.regrets"}
                                                </div>
                                            {/if}
                                        </td>
                                    </tr>
                                    
                                    {if $reviewAssignment->getDateCompleted()}
                                    <tr>
                                        <th class="">
                                            提交審查結果 {* @TODO 語系 *}
                                        </th>
                                        <td class="value">
                                            {url|assign:"cancelCompletedUrl" op="cancelCompleted" reviewId=$reviewAssignment->getId() paperId=$submission->getPaperId()}
                                            {$reviewAssignment->getDateCompleted()|date_format:$dateFormatShort}
                                            
                                            <a href="{$cancelCompletedUrl}" class="btn btn-danger btn-sm" onclick="return confirmCancelCompleted()">
                                                <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                                退回審查結果
                                            </a>
                                        </td>
                                    </tr>
                                    {/if}
                                    <tr>
                                        <th class="">
                                            {translate key="submission.assignReview.due"}
                                        </th>
                                        <td class="value">
                                                {if !$reviewAssignment->getDateCompleted()}
                                                    <a href="{url op="setDueDate" path=$reviewAssignment->getPaperId()|to_array:$reviewAssignment->getId()}" class="edit-link" style="float:none;margin-right: 15px;">
                                                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                                    </a>
                                                    <a href="{url op="setDueDate" path=$reviewAssignment->getPaperId()|to_array:$reviewAssignment->getId()}">
                                                    {if $reviewAssignment->getDateDue()}{$reviewAssignment->getDateDue()|date_format:$dateFormatShort}{else}&mdash;{/if}
                                                    </a>
                                                {else}
                                                    {if $reviewAssignment->getDateDue()}{$reviewAssignment->getDateDue()|date_format:$dateFormatShort}{else}&mdash;{/if}
                                                {/if}
                                                    {if !$reviewAssignment->getDeclined()}
                                                    &nbsp;&nbsp;&nbsp;
                                                    {if !$reviewAssignment->getDateCompleted()}
                                                    {url|assign:"remindUrl" op="remindReviewer" reviewId=$reviewAssignment->getId() paperId=$submission->getPaperId()}
                                                        <a href="{$remindUrl}" class="btn btn-default btn-sm">
                                                            <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                                                            {translate key="common.remind"}
                                                        </a>
                                                        {if $isConferenceManager}
                                                        <a href="{url page="manager"}/schedConfSetup/3#peerReview" target="_blank" class="active">
                                                            {translate key="submission.assignReview.setupAutoRemind"}
                                                        </a>
                                                        {/if}
                                                    {/if}
                                                {/if}
                                        </td>
                                    </tr>
                                    {if $reviewAssignment->getDateConfirmed()}
                                    <tr>
                                        <th class="">{translate key="submission.acknowledge"}</th>
                                        <td class="value">
                                            {url|assign:"thankUrl" op="thankReviewer" reviewId=$reviewAssignment->getId() paperId=$submission->getPaperId()}
							{if $reviewAssignment->getDateAcknowledged()}
								{$reviewAssignment->getDateAcknowledged()|date_format:$dateFormatShort}
							{elseif $reviewAssignment->getDateCompleted()}
                                                            <a href="{$thankUrl}" class="btn btn-primary btn-sm">
                                                                <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                                                                {translate key="submission.assignReview.writeEmail"}
                                                            </a>
							{else}
                                                            {translate key="submission.assignReview.waitComplete"}
							{/if}
                                        </td>
                                    </tr>
                                    {/if}
				</table>
			</td>
		</tr>
                
                {if !$reviewAssignment->getDeclined()}
		<tr valign="top">
                        <td class="label">{translate key="submission.reviewForm"}</td>
                        <td>
                        {if $reviewAssignment->getReviewFormId()}
                                {assign var="reviewFormId" value=$reviewAssignment->getReviewFormId()}
                                <a href="{url page="manager"}/editReviewForm/{$reviewAssignment->getReviewFormId()}" 
                                   target="_blank"
                                   class="btn btn-default">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    {$reviewFormTitles[$reviewFormId]}
                                </a>
                        {else}
                                {translate key="manager.reviewForms.noneChosen"}
                        {/if}
                        {if !$reviewAssignment->getDateCompleted()}
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                {if !$reviewAssignment->getReviewFormId()}
                                <a class="action btn btn-default" href="{url op="selectReviewForm" path=$submission->getPaperId()|to_array:$reviewAssignment->getId()}"{if $reviewFormResponses[$reviewId]} 
                                   onclick="return confirm('{translate|escape:"jsparam" key="editor.paper.confirmChangeReviewForm"}')"{/if}
                                   target="_blank">
                                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                                    {translate key="editor.paper.selectReviewForm"}
                                </a>
                                {/if}
                                {if $reviewAssignment->getReviewFormId()}&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a class="action" href="{url op="clearReviewForm" path=$submission->getPaperId()|to_array:$reviewAssignment->getId()}"{if $reviewFormResponses[$reviewId]} 
                                       onclick="return confirm('{translate|escape:"jsparam" key="editor.paper.confirmChangeReviewForm"}')"{/if}>
                                        {translate key="editor.paper.clearReviewForm"}
                                    </a>
                                {/if}
                                {if $isConferenceManager}
                                <a class="action" href="{url page="manager" op="editTrack" path=$conferenceId}#reviewFormId" target="_blank">
                                    設定預設審查表單 {* @TODO 語系 *}
                                </a>
                                {/if}
                        {/if}
                        </td>
                </tr>
                {/if}
                
		{if $reviewAssignment->getDateConfirmed() && !$reviewAssignment->getDeclined() and $reviewAssignment->getDateCompleted()}
                    {if $reviewAssignment->getCommentAuthor() and $reviewAssignment->getDateCompleted()}
<tr valign="top">
	<td class="label">
            {translate key="submission.comments.forAuthorDirector"}
        </td>
        <td class="value">{$reviewAssignment->getCommentAuthor()|nl2br}</textarea></td>
</tr>
                    {/if}
                    {if $reviewAssignment->getCommentDirector() and $reviewAssignment->getDateCompleted()}
<tr valign="top">
	<td class="label">
            {translate key="submission.comments.forDirector"}
        </td>
	<td class="value">{$reviewAssignment->getCommentDirector()|nl2br}</td>
</tr>
                    {/if}
                    {if $reviewAssignment->getCommentSurvey() and $reviewAssignment->getDateCompleted()}
<tr valign="top">
	<td class="label">
            {translate key="submission.comments.survey"}
        </td>
	<td class="value">
            {assign var="commentSurvey" value=$reviewAssignment->getCommentSurvey()}
            {assign var="commentSurveyForm" value=$reviewAssignment->getReviewSurveyForm()}
            {if $commentSurvey}
                <textarea id="commentSurveyForm{$reviewAssignment->getId()}" style="width:100%;" rows="10" cols="50" class="textArea jquery-survey-form report" 
                          jquery-survey-data="commentSurvey{$reviewAssignment->getId()}"
                           error-message="{translate key="common.formValidateError"}">{$commentSurveyForm}</textarea>
                <textarea id="commentSurvey{$reviewAssignment->getId()}" name="commentSurvey{$reviewAssignment->getId()}" style="width:100%;" rows="10" cols="50" class="textArea">{$commentSurvey}</textarea>
            {else}
                &mdash;
            {/if}
        </td>
</tr>
                    {/if}
                    {if !$reviewAssignment->getCommentAuthor() and !$reviewAssignment->getCommentDirector() and $reviewAssignment->getDateCompleted()}
                        <tr valign="top">
				<td class="label">
                                    {translate key="reviewer.paper.comment"}
                                </td>
				<td>
                                    {translate key="reviewer.paper.noComment"}
				</td>
			</tr>
                    {/if}
			<tr valign="top">
				<td class="label">
                                    {translate key="reviewer.paper.recommendation"}
                                </td>
				<td>
					{if $reviewAssignment->getRecommendation() !== null && $reviewAssignment->getRecommendation() !== '' and $reviewAssignment->getDateCompleted()}
						{assign var="recommendation" value=$reviewAssignment->getRecommendation()}
                                                <span 
                                                    {if $recommendation == 1}
                                                        class="text-success"
                                                    {elseif $recommendation == 5 or $recommendation == 6 or $recommendation == 4}
                                                        class="text-danger"
                                                    {else}
                                                        class="text-warning"
                                                    {/if}>
                                                    {translate key=$reviewerRecommendationOptions.$recommendation}
                                                </span>
                                                
						&nbsp;&nbsp;
                                                ({$reviewAssignment->getDateCompleted()|date_format:$dateFormatShort})
					{else}
						{translate key="common.none"}
                                                <!--
                                                &nbsp;&nbsp;&nbsp;&nbsp;
						<a href="{url op="remindReviewer" paperId=$submission->getPaperId() reviewId=$reviewAssignment->getId()}" class="action">{translate key="reviewer.paper.sendReminder"}</a>
						{if $reviewAssignment->getDateReminded()}
							&nbsp;&nbsp;{$reviewAssignment->getDateReminded()|date_format:$dateFormatShort}
							{if $reviewAssignment->getReminderWasAutomatic()}
								&nbsp;&nbsp;
                                                                {translate key="reviewer.paper.automatic"}
							{/if}
						{/if}
                                                -->
					{/if}
				</td>
			</tr>
			{if $reviewFormResponses[$reviewId]}
			<tr valign="top">
				<td class="label">
                                    {translate key="submission.reviewFormResponse"}
                                </td>
				<td>
					<a href="javascript:openComments('{url op="viewReviewFormResponse" path=$submission->getPaperId()|to_array:$reviewAssignment->getId()}');" class="icon">{icon name="letter"}</a>
				</td>
			</tr>
			{/if}
                        {assign var="reviewerFileRevisions" value=$reviewAssignment->getReviewerFileRevisions()}
                        {if $reviewerFileRevisions|@count > 0}
			<tr valign="top">
				<td class="label">
                                    {translate key="reviewer.paper.uploadedFile"}
                                </td>
				<td>
                                    {foreach from=$reviewAssignment->getReviewerFileRevisions() item=reviewerFile key=key}
								<form name="authorView{$reviewAssignment->getId()}" method="post" action="{url op="makeReviewerFileViewable"}">
									<a href="{url op="downloadFile" path=$submission->getPaperId()|to_array:$reviewerFile->getFileId():$reviewerFile->getRevision()}" 
                                                                           class="file btn btn-default btn-sm">
                                                                            <span class="glyphicon glyphicon-save-file" aria-hidden="true"></span>
                                                                            {$reviewerFile->getOriginalFileName()|escape}
                                                                        </a>
                                                                        &nbsp;&nbsp;
                                                                        ({$reviewerFile->getDateModified()|date_format:$dateFormatShort})
                                                                        <!--
									<input type="hidden" name="reviewId" value="{$reviewAssignment->getId()}" />
									<input type="hidden" name="paperId" value="{$submission->getPaperId()}" />
									<input type="hidden" name="fileId" value="{$reviewerFile->getFileId()}" />
									<input type="hidden" name="revision" value="{$reviewerFile->getRevision()}" />
									{translate key="director.paper.showAuthor"} <input type="checkbox" name="viewable" value="1"{if $reviewerFile->getViewable()} checked="checked"{/if} />
									<input type="submit" value="{translate key="common.record"}" class="button" />
                                                                        -->
								</form>
						{foreachelse}
                                                    <!--{translate key="common.none"}-->
						{/foreach}
                                        {if !$reviewCompleted}
                                            <form method="post" action="{url op="uploadReviewForReviewer"}" enctype="multipart/form-data" class="hide">
						<!--{translate key="director.paper.uploadReviewForReviewer"}-->
						<input type="hidden" name="paperId" value="{$submission->getPaperId()}" />
						<input type="hidden" name="reviewId" value="{$reviewAssignment->getId()}"/>
						<input type="file" name="upload" class="uploadField" />
						<input type="submit" name="submit" value="{translate key="common.upload"}" class="button" />
					</form>
                                        {/if}
				</td>
			</tr>
                        {/if}
		{/if}

		{if (($reviewAssignment->getRecommendation() === null || $reviewAssignment->getRecommendation() === '') || !$reviewAssignment->getDateConfirmed()) && $reviewAssignment->getDateNotified() && !$reviewAssignment->getDeclined()}
			<tr valign="top">
				<td class="label">
                                    {translate key="reviewer.paper.recommendation"}
                                </td>
				<td>
					{if !$reviewAssignment->getDateConfirmed()}
						<a href="{url op="confirmReviewForReviewer" path=$submission->getPaperId()|to_array:$reviewAssignment->getId() accept=1}" 
                                                   class="action btn btn-primary">
                                                    <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                                                    {translate key="reviewer.paper.canDoReview"}
                                                </a>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <a href="{url op="confirmReviewForReviewer" path=$submission->getPaperId()|to_array:$reviewAssignment->getId() accept=0}" 
                                                   class="action btn btn-default">
                                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                                    {translate key="reviewer.paper.cannotDoReview"}</a>
                                                <br />
					{/if}
					
					{if $reviewAssignment->getDateConfirmed() && !$reviewAssignment->getDeclined()}
<form method="post" action="{url op="enterReviewerRecommendation"}">
<input type="hidden" name="paperId" value="{$submission->getPaperId()|escape}" />
<input type="hidden" name="reviewId" value="{$reviewId|escape}" />
            <select name="recommendation" size="1" 
                    class="selectMenu btn btn-default" onchange="if (confirmSubmissionCheck()) $(this).parents('form:first').submit(); else this.value='';">
                        {html_options_translate options=$reviewerRecommendationOptions}
		</select>
</form>
                <!--<a class="action btn btn-default btn-sm" 
                                                   href="{url op="enterReviewerRecommendation" paperId=$submission->getPaperId() reviewId=$reviewAssignment->getId()}">
                                                    {translate key="director.paper.recommendation"}
                                                </a>
                -->
					{/if}
				</td>
			</tr>
		{/if}

		{if $reviewAssignment->getDateNotified() && !$reviewAssignment->getDeclined() && $rateReviewerOnQuality}
			<tr valign="top">
				<td class="label">{translate key="director.paper.rateReviewer"}</td>
				<td>
					<form method="post" action="{url op="rateReviewer"}">
					<input type="hidden" name="reviewId" value="{$reviewAssignment->getId()}" />
					<input type="hidden" name="paperId" value="{$submission->getPaperId()}" />
					<!-- {translate key="director.paper.quality"}&nbsp; -->
                                        <select name="quality" size="1" class="btn btn-default" onchange="this.form.submit()">
						{html_options_translate options=$reviewerRatingOptions selected=$reviewAssignment->getQuality()}
					</select>&nbsp;&nbsp;
					<input type="submit" value="{translate key="common.record"}" class="button hide" />
					{if $reviewAssignment->getDateRated()}
						&nbsp;&nbsp;
                                                ({$reviewAssignment->getDateRated()|date_format:$dateFormatShort})
					{/if}
				</form>
				</td>
			</tr>
		{/if}
	</table>
        </div>
        </div>
	{/if}
        {foreachelse}
            <p class="text-center">
                {translate key="submission.assignReview.empty"}
            </p>
	{/foreach}
{/if}

<div class="text-center" style="margin-top: 15px;">
            <a href="{url op="createReviewer" path=$submission->getPaperId()}" class="btn btn-primary">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                {translate key="submission.assignReview.createAccount"}
            </a>
            <a href="{url op="selectReviewer" path=$submission->getPaperId()}" class="btn btn-default">
                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                {translate key="submission.assignReview.selectReviewer"}
            </a>
            <a href="{url op="enrollSearch" path=$submission->getPaperId()}" class="btn btn-default">
                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                {translate key="submission.assignReview.selectUser"}
            </a>
            <!--
            <a href="{url op="submissionRegrets" path=$submission->getPaperId()}" class="btn btn-danger">
                <span class="glyphicon glyphicon-save-file" aria-hidden="true"></span>
                {translate|escape key="trackDirector.regrets.link"}
            </a>
            -->
        </div>
</div>
