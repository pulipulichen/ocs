{**
 * management.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Subtemplate defining the submission management table.
 *
 * $Id$
 *}
<div id="submission">
<h3>{translate key="paper.submission.management"}</h3>

{assign var="submissionFile" value=$submission->getSubmissionFile()}
{assign var="suppFiles" value=$submission->getSuppFiles()}

<table width="100%" class="data">
        {assign var="submitter" value=$submission->getUser()}
        <tr>
            <td class="label" width="20$">
                管理網址 {* @TODO 語系 *}
            </td>
            <td width="80%">
                {url|assign:"submitterUrl" page="author" op="submissionReview"}
                {assign var="submissionId" value=$submission->getId()}
                {assign var="submitterId" value=$submitter->getId()}
                {assign var="submitterUrl" value="$submitterUrl/$submissionId?u=$submitterId"}
                <a href="{$submitterUrl}" target="_blank">{$submitterUrl}</a>
            </td>
        </tr>
        <tr>
		<td class="label">{translate key="submission.submitter"}</td>
		<td colspan="2" class="value">
			
			{assign var=emailString value=$submitter->getFullName()|concat:" <":$submitter->getEmail():">"}
			{url|assign:"url" page="user" op="email" redirectUrl=$currentUrl to=$emailString|to_array subject=$submission->getLocalizedTitle|strip_tags paperId=$submission->getPaperId()}
			<a href="{$url}" class="btn btn-default">
                            <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                            {$submitter->getFullName()|escape} 
                            {*icon name="mail" url=$url*}
                        </a>
		</td>
	</tr>
        <tr>
		<td class="label">{translate key="common.dateSubmitted"}</td>
		<td>{$submission->getDateSubmitted()|date_format:$dateFormatShort}</td>
	</tr>
        {assign var=sessionType value=$submission->getData('sessionType')}
	{if is_array($sessionTypes) && !empty($sessionTypes) && !(count($sessionTypes) == 1 && !empty($sessionType) && isset($sessionTypes[$sessionType]))}
		<tr valign="top">
			<td width="20%" class="label">{translate key="paper.sessionType"}</td>
			<td class="data" colspan="2">
				<form action="{url op="changeSessionType" paperId=$submission->getPaperId()}#submission" method="post">
                                    <select name="sessionType" size="1" class="selectMenu btn" onchange="this.form.submit();">
						{if empty($sessionType) || !isset($sessionTypes[$sessionType])}<option value=""></option>{/if}
						{html_options options=$sessionTypes selected=$sessionType}
					</select>
					<!-- <input type="submit" value="{translate key="common.record"}" class="button" /> -->
				</form>
			</td>
		</tr>
	{/if}{* if we should display session type dropdown *}
        <!--
	<tr>
		<td width="20%" class="label">{translate key="paper.authors"}</td>
		<td width="80%" colspan="2" class="value">
			{url|assign:"url" page="user" op="email" redirectUrl=$currentUrl to=$submission->getAuthorEmails() subject=$submission->getLocalizedTitle() paperId=$submission->getPaperId()}
                        <a href="{$url}" class="btn btn-default">
                            <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                            {$submission->getAuthorString()|escape} 
                            {*icon name="mail" url=$url*}
                        </a>
		</td>
	</tr>
        -->
        <!--
	<tr>
		<td class="label">{translate key="paper.title"}</td>
		<td colspan="2" class="value">{$submission->getLocalizedTitle()|strip_unsafe_html|default:"&mdash;"}</td>
	</tr>
        -->
{*if $submissionFile || $submission->getReviewMode() != REVIEW_MODE_ABSTRACTS_ALONE*}
	<tr>
		<td class="label">{translate key="submission.originalFile"}</td>
		<td colspan="2" class="value">
			{*if $submissionFile}
				<a class="file btn btn-default" href="{url op="downloadFile" path=$submission->getPaperId()|to_array:$submissionFile->getFileId()}">
                                    <span class="glyphicon glyphicon-save-file" aria-hidden="true"></span>
                                    {$submissionFile->getFileName()|escape}&nbsp;&nbsp;({$submissionFile->getDateModified()|date_format:$dateFormatShort})
                                </a>
                                
			{else*}
                        {if $lastFile}
				<a class="file btn btn-default" href="{url op="downloadFile" path=$submission->getPaperId()|to_array:$lastFile->getFileId()}">
                                    <span class="glyphicon glyphicon-save-file" aria-hidden="true"></span>
                                    {$lastFile->getOriginalFileName()|escape}
                                    &nbsp;&nbsp;
                                    {* @TODO 語系 *}
                                    {if $lastFileType == 0}
                                        [{translate key="submission.event.author.authorRevision"}]
                                    {elseif $lastFileType == 1}
                                        [{translate key="submission.event.author.directorRevision"}]
                                    {/if}
                                    ({$lastFile->getDateModified()|date_format:$dateFormatShort})
                                </a>
                                
			{else}
				{translate key="common.none"}
			{/if}
                        <a
                            href="{url op="submissionReview" path=$submission->getPaperId()}#directorDecision" class="action supp-file-upload">
                             <span class="glyphicon glyphicon-upload"></span>
                             {translate key="submission.addSubmissionFile"}
                         </a>
		</td>
	</tr>
{*/if*}
	<tr valign="top">
		<td class="label">{translate key="paper.suppFilesAbbrev"}</td>
		<td colspan="2" class="value">
			{foreach name="suppFiles" from=$suppFiles item=suppFile}
                            {if $notFirst}
                                <br />
                            {/if}
				<a  class="action btn btn-default"
                                    href="{url op="downloadFile" path=$submission->getPaperId()|to_array:$suppFile->getFileId()}">
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
                                <a 
                                   href="{url op="addSuppFile" from="submission" path=$submission->getPaperId()}" class="action supp-file-upload">
                                    <span class="glyphicon glyphicon-upload"></span>
                                    {translate key="submission.addSuppFile"}
                                </a>
		</td>
	</tr>
	
	
        {if $tracks|@count > 1}
	<tr>
		<td class="label">{translate key="track.track"}</td>
		<td class="value">
			<form action="{url op="changeTrack" paperId=$submission->getPaperId()}#submission" method="post">
                            <select name="trackId" size="1" class="selectMenu btn" onchange="this.form.submit()">
                                    {html_options options=$tracks selected=$submission->getTrackId()}
                                </select>
				<!-- <input type="submit" value="{translate key="common.record"}" class="button" /> -->
			</form>
		</td>
	</tr>
        {/if}
	

	{if $submission->getCommentsToDirector()}
	<tr valign="top">
		<td width="20%" class="label">{translate key="paper.commentsToDirector"}</td>
		<td width="80%" colspan="2" class="data">{$submission->getCommentsToDirector()|strip_unsafe_html|nl2br}</td>
	</tr>
	{/if}
	{if $publishedPaper}
	<tr>
		<td class="label">{translate key="submission.abstractViews"}</td>
		<td>{$publishedPaper->getViews()}</td>
	</tr>
	{/if}
</table>
</div>
