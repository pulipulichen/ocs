{**
 * management.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Subtemplate defining the author's submission management table.
 *
 * $Id$
 *}
<div id="submission">
<h3>{translate key="paper.submission"}</h3>
<table width="100%" class="data">
	<tr>
		<td class="label">{translate key="submission.submitter"}</td>
		<td colspan="2" class="value">
			{assign var="submitter" value=$submission->getUser()}
			{assign var=emailString value=$submitter->getFullName()|concat:" <":$submitter->getEmail():">"}
			{url|assign:"url" page="user" op="email" to=$emailString|to_array redirectUrl=$currentUrl subject=$submission->getLocalizedTitle|strip_tags paperId=$submission->getPaperId()}

                            {$submitter->getFullName()|escape} 
                            {*icon name="mail" url=$url*}
		</td>
	</tr>
	<tr>
		<td class="label">{translate key="common.dateSubmitted"}</td>
		<td colspan="2">{$submission->getDateSubmitted()|date_format:$datetimeFormatLong}</td>
	</tr>
        <tr valign="top" class="hide">
		<td width="20%" class="label">{translate key="paper.authors"}</td>
		<td width="80%" colspan="2" class="data">{$submission->getAuthorString(false)|escape}</td>
	</tr>
        
	<tr valign="top" class="hide">
		<td width="20%" class="label">{translate key="paper.title"}</td>
		<td width="80%" colspan="2" class="data">{$submission->getLocalizedTitle()|strip_unsafe_html}</td>
	</tr>

	{assign var=sessionType value=$submission->getData('sessionType')}
	{if isset($sessionTypes[$sessionType])}
		<tr valign="top">
			<td width="20%" class="label">{translate key="paper.sessionType"}</td>
			<td width="80%" colspan="2" class="data">{$sessionTypes[$sessionType]|escape}</td>
		</tr>
	{/if}{* isset($submissionTypes[$submissionType]) *}

	<tr valign="top">
		<td width="20%" class="label">{translate key="submission.originalFile"}</td>
		<td width="80%" colspan="2" class="data">
			{*if $submissionFile}
				<a href="{url op="downloadFile" path=$submission->getPaperId()|to_array:$submissionFile->getFileId():$submissionFile->getRevision()}" 
                                   class="file btn btn-default">
                                    <span class="glyphicon glyphicon-save-file" aria-hidden="true"></span>
                                    {$submissionFile->getFileName()|escape}
                                    &nbsp;&nbsp;({$submissionFile->getDateModified()|date_format:$dateFormatShort})
                                </a>
			{else*}
                        {if $lastFile}
				<a href="{url op="downloadFile" path=$submission->getPaperId()|to_array:$lastFile->getFileId():$lastFile->getRevision()}" 
                                   class="file btn btn-default">
                                    <span class="glyphicon glyphicon-save-file" aria-hidden="true"></span>
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
                        &nbsp;&nbsp;
                        <a class="action"
                            href="{url op="submissionReview" path=$submission->getPaperId()}#directorDecision" class="action">
                             <span class="glyphicon glyphicon-upload"></span>
                             {translate key="submission.addSubmissionFile"}
                         </a>
		</td>
	</tr>
	<tr valign="top">
		<td class="label">{translate key="paper.suppFilesAbbrev"}</td>
                <td width="80%" colspan="2" class="value">
			{foreach name="suppFiles" from=$suppFiles item=suppFile}
                            {if $notFirst}
                                <br />
                            {/if}
				{if $mayEditPaper}
					{assign var="suppFileOp" value="editSuppFile"}
				{else}
					{assign var="suppFileOp" value="viewSuppFile"}
				{/if}
				<a href="{url op=$suppFileOp path=$submission->getPaperId()|to_array:$suppFile->getId()}" 
                                   class="btn btn-default">
                                    <span class="glyphicon glyphicon-save-file" aria-hidden="true"></span>
                                    {$suppFile->getOriginalFileName()|escape}
                                </a>
                                &nbsp;&nbsp;
                                {$suppFile->getDateModified()|date_format:$dateFormatShort}
                                &nbsp;&nbsp;
                                
                                <a href="{url op="deleteSuppFile" from="submission" path=$submission->getPaperId()|to_array:$suppFile->getId()}" 
                                   class="action">
                                    {translate key="common.delete"}
                                </a>
                                
                                {assign var=notFirst value=1}
			{foreachelse}
				{translate key="common.none"}
			{/foreach}
			{if $mayEditPaper}
                            &nbsp;&nbsp;
				<a href="{url op="addSuppFile" path=$submission->getPaperId()}" class="action">
                                    <span class="glyphicon glyphicon-upload"></span>
                                    {translate key="submission.addSuppFile"}
                                </a>
			{else}
				&nbsp;
			{/if}
		</td>
	</tr>
        {if $tracks|@count > 1}
	<tr valign="top">
		<td width="20%" class="label">{translate key="track.track"}</td>
		<td width="80%" colspan="2" class="data">{$submission->getTrackTitle()|escape}</td>
	</tr>
        {/if}
        <tr valign="top" class="hide">
		<td width="20%" class="label">
                    {translate key="user.role.director"}
                </td>
		{assign var="editAssignments" value=$submission->getEditAssignments()}
		<td width="80%" colspan="2" class="data">
			{foreach from=$editAssignments item=editAssignment}
				{assign var=emailString value=$editAssignment->getDirectorFullName()|concat:" <":$editAssignment->getDirectorEmail():">"}
				{url|assign:"url" page="user" op="email" to=$emailString|to_array redirectUrl=$currentUrl subject=$submission->getLocalizedTitle|strip_tags paperId=$submission->getPaperId()}
                                <a href="{$url}" class="btn btn-default">
                                    <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                                    {$editAssignment->getDirectorFullName()|escape} 
                                    {*icon name="mail" url=$url*}
                                </a>
				({if $editAssignment->getIsDirector()}{translate key="user.role.director"}{else}{translate key="user.role.trackDirector"}{/if})
				<br/>
			{foreachelse}
				{translate key="common.noneAssigned"}
			{/foreach}
		</td>
	</tr>
	{if $submission->getCommentsToDirector()}
	<tr valign="top">
		<td width="20%" class="label">{translate key="paper.commentsToDirector"}</td>
		<td width="80%" colspan="2" class="data">{$submission->getCommentsToDirector()|strip_unsafe_html|nl2br}</td>
	</tr>
	{/if}
	{if $publishedPaper}
	<tr>
		<td class="label">{translate key="submission.abstractViews"}</td>
		<td colspan="2">{$publishedPaper->getViews()}</td>
	</tr>
	{/if}
</table>
</div>
