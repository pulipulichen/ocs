{**
 * summary.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Subtemplate defining the author's submission summary table.
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
                        <a href="{$url}" class="btn btn-default">
                            <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                            {$submission->getAuthorString()|escape} 
                            {*icon name="mail" url=$url*}
                        </a>
		</td>
	</tr>
	<tr>
		<td class="label">{translate key="paper.title"}</td>
		<td>{$submission->getLocalizedTitle()|strip_unsafe_html}</td>
	</tr>
	<tr>
		<td class="label">{translate key="track.track"}</td>
		<td>{$submission->getTrackTitle()|escape}</td>
	</tr>
        <tr>
		<td class="label">{translate key="paper.sessionType"}</td>
		<td>{$sessionType|escape}</td>
	</tr>
        {if $stage == REVIEW_STAGE_PRESENTATION}
            <!--
		<tr valign="top">
			<td class="label" width="20%">
				{translate key="submission.reviewVersion"}
			</td>
			<td class="value" width="80%">
				{*assign var="reviewFile" value=$reviewFilesByStage[$stage]*}
                                {assign var="reviewFile" value=$revisedFile}
                                
				{if $reviewFile}
					<a href="{url op="downloadFile" path=$submission->getPaperId()|to_array:$reviewFile->getFileId():$reviewFile->getRevision()}" 
                                           class="file btn btn-primary">
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
                                            
                                        </a>
				{else}
					{translate key="common.none"}
				{/if}
			</td>
		</tr>
            -->
	{/if}
	<tr>
		<td class="label">{translate key="user.role.director"}</td>
		<td>
			{assign var=editAssignments value=$submission->getEditAssignments()}
			{foreach from=$editAssignments item=editAssignment}
				{assign var=emailString value=$editAssignment->getDirectorFullName()|concat:" <":$editAssignment->getDirectorEmail():">"}
				{url|assign:"url" page="user" op="email" redirectUrl=$currentUrl to=$emailString|to_array subject=$submission->getLocalizedTitle()|strip_tags paperId=$submission->getPaperId()}
                                <a href="{$url}" class="btn btn-default">
                                    <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
				{$editAssignment->getDirectorFullName()|escape} 
                                {*icon name="mail" url=$url*}
                                </a>
				<br/>
			{foreachelse}
				{translate key="common.noneAssigned"}
			{/foreach}
		</td>
	</tr>

                
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

</table>
</div>
