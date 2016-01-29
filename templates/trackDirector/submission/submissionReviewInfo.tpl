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
<div id="submission">
<h3>{translate key="paper.submission"}</h3>

<table width="100%" class="data">
	<tr>
		<td width="20%" class="label">{translate key="paper.authors"}</td>
		<td width="80%">
			{url|assign:"url" page="user" op="email" redirectUrl=$currentUrl to=$submission->getAuthorEmails() subject=$submission->getLocalizedTitle() paperId=$submission->getPaperId()}
			{*icon name="mail" url=$url*}
                        <a href="{$url}" class="btn btn-default">
                            <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                            {$submission->getAuthorString()|escape} 
                            {*icon name="mail"*}
                        </a>
		</td>
	</tr>
	<tr>
		<td class="label">{translate key="paper.title"}</td>
		<td>{$submission->getLocalizedTitle()|strip_unsafe_html|default:"&mdash;"}</td>
	</tr>
        {if $tracks|@count > 1}
	<tr>
		<td class="label">{translate key="track.track"}</td>
		<td>
                    {$submission->getTrackTitle()|escape}
                </td>
	</tr>
        {/if}
        <tr>
		<td class="label">{translate key="paper.sessionType"}</td>
		<td>{$sessionType|escape}</td>
	</tr>
        <!--
	<tr>
		<td class="label">{translate key="user.role.director"}</td>
		<td>
			{assign var=editAssignments value=$submission->getEditAssignments()}
			{foreach from=$editAssignments item=editAssignment}
				{assign var=emailString value=$editAssignment->getDirectorFullName()|concat:" <":$editAssignment->getDirectorEmail():">"}
				{url|assign:"url" page="user" op="email" redirectUrl=$currentUrl to=$emailString|to_array subject=$submission->getLocalizedTitle()|strip_tags paperId=$submission->getPaperId()}
				{$editAssignment->getDirectorFullName()|escape} {icon name="mail" url=$url}
				<br/>
			{foreachelse}
				{translate key="common.noneAssigned"}
			{/foreach}
		</td>
	</tr>
        -->
	{if $reviewingAbstractOnly}
		{* If this review level is for the abstract only, show the abstract. *}
		<tr valign="top">
			<td class="label" width="20%">{translate key="submission.abstract"}</td>
			<td width="80%" class="value">
				{$submission->getLocalizedAbstract()|strip_unsafe_html}
			</td>
		</tr>
	{elseif $lastFile}
		{**
		 * This is an abstract-and-paper or paper-only review. Don't
		 * show the abstract, and show any review files or
		 * supplementary files.
		 *}
		<tr valign="top">
                    <td class="label" width="20%">{translate key="submission.reviewVersion"}</td>
                    <td>
                        <a class="btn btn-primary" href="{url op="downloadFile" path=$submission->getPaperId()|to_array:$lastFile->getFileId():$lastFile->getRevision()}" 
                                   class="file">
                                    <span class="glyphicon glyphicon-save-file" aria-hidden="true"></span>
                                    {*$reviewFile->getFileName()|escape*}
                                    {$lastFile->getOriginalFileName()|escape}
                                    &nbsp;&nbsp;
                                    
                                    {* @TODO 語系 *}
                                            {if $lastFileType == 0}
                                                [作者]
                                            {elseif $lastFileType == 1}
                                                [負責人修改]
                                            {/if}
                                    ({$lastFile->getDateModified()|date_format:$dateFormatShort})
                                    {*} &nbsp;&nbsp;&nbsp;&nbsp;<a class="action" href="javascript:openHelp('{get_help_id key="editorial.trackDirectorsRole.review.blindPeerReview" url="true"}')">{translate key="reviewer.paper.ensuringBlindReview"}</a> {*}
                        </a>
                    </td>
                </tr>
		{if not $isStageDisabled}
                <!--
		<tr valign="top">
			<td colspan="2">
				<form method="post" action="{url op="uploadReviewVersion"}" enctype="multipart/form-data">
					{translate key="director.paper.uploadReviewVersion"}
                                        <div>
                                            <input type="hidden" name="paperId" value="{$submission->getPaperId()}" />
                                            <input type="file" name="upload" class="uploadField" />
                                            <input type="submit" name="submit" value="{translate key="common.upload"}" class="button" />
                                        </div>
				</form>
			</td>
		</tr>
                -->
		{/if}
		{foreach from=$suppFiles item=suppFile}
                    <tr valign="top"><td colspan="2">&nbsp;</td></tr>
                    	<tr valign="top">
				{if !$notFirstSuppFile}
					<td class="label" rowspan="{$suppFiles|@count}">{translate key="paper.suppFilesAbbrev"}</td>
						{assign var=notFirstSuppFile value=1}
				{/if}
				<td width="80%" class="value nowrap">
					<form method="post" action="{url op="setSuppFileVisibility"}">
						<input type="hidden" name="paperId" value="{$submission->getPaperId()}" />
						<input type="hidden" name="fileId" value="{$suppFile->getId()}" />
						<a href="{url op="downloadFile" path=$submission->getPaperId()|to_array:$suppFile->getFileId():$suppFile->getRevision()}" class="file">{$suppFile->getFileName()|escape}</a>&nbsp;&nbsp;
						{$suppFile->getDateModified()|date_format:$dateFormatShort}
						<label for="show">{translate key="director.paper.showSuppFile"}</label>
						<input type="checkbox" {if !$mayEditPaper}disabled="disabled" {/if}name="show" id="show" value="1"{if $suppFile->getShowReviewers()==1} checked="checked"{/if}/>
						<input type="submit" {if !$mayEditPaper}disabled="disabled" {/if}name="submit" value="{translate key="common.record"}" class="button" />
					</form>
				</td>
			</tr>
		{foreachelse}
			<tr valign="top">
				<td class="label">{translate key="paper.suppFilesAbbrev"}</td>
				<td class="nodata">{translate key="common.none"}</td>
			</tr>
		{/foreach}
	{/if}

                
{if $mayEditPaper}
    <tr>
        <td class="label">
            {translate key="submission.summaryEdit"}
        </td>
        <td class="value">
            <a href="{url op="viewMetadata" path=$submission->getPaperId()}" class="action btn btn-default">
                <span class="glyphicon glyphicon-pencil"></span>
                {translate key="submission.editMetadata"}
            </a>
        </td>
    </tr>
	
{/if}

        <tr>
		<td class="label">{translate key="submissions.status"}</td>
		<td class="value">
                    {assign var="status" value=$submission->getSubmissionStatus()}
                    {if $status == STATUS_ARCHIVED}
                        <span style="color:gray">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            {translate key="submissions.archived"}
                        </span>
                    {elseif $status == STATUS_QUEUED_UNASSIGNED}
                        <span class="text-warning">
                            3
                            <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                            {translate key="submissions.queuedUnassigned"}
                        </span>
                    {elseif $status == STATUS_QUEUED_EDITING}
                        <span class="text-primary">
                            2
                            <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                            {translate key="submissions.queuedEditing"}
                        </span>
                    {elseif $status == STATUS_QUEUED_REVIEW}
                        <span class="text-warning">
                            <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                            {if $submission->getCurrentStage()==REVIEW_STAGE_PRESENTATION}
                                    {translate key="submissions.queuedPaperReview"}
                            {else}
                                    {translate key="submissions.queuedAbstractReview"}
                            {/if}
                        </span>
                    {elseif $status == STATUS_PUBLISHED}
                        <span class="text-success">
                            <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                            {translate key="submissions.published"}
                        </span>
                    {elseif $status == STATUS_DECLINED}
                        <span style="color:gray">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            {translate key="submissions.declined"}
                        </span>
                    {/if}
                    ({$submission->getLastModified()|date_format:$dateFormatShort})
                </td>
	</tr>

</table>
</div>