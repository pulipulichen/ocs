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
			{$submission->getAuthorString()|escape} {icon name="mail" url=$url}
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
	{else}
		{**
		 * This is an abstract-and-paper or paper-only review. Don't
		 * show the abstract, and show any review files or
		 * supplementary files.
		 *}
		<tr valign="top">
                    <td class="label" width="20%">{translate key="submission.reviewVersion"}</td>
                    <td>
                        <a href="{url op="downloadFile" path=$submission->getPaperId()|to_array:$reviewFile->getFileId():$reviewFile->getRevision()}" 
                                   class="file">
                                    <span class="glyphicon glyphicon-save-file" aria-hidden="true"></span>
                                    {$reviewFile->getFileName()|escape}&nbsp;&nbsp;
                                    ({$reviewFile->getDateModified()|date_format:$dateFormatShort})
                                    <!-- &nbsp;&nbsp;&nbsp;&nbsp;<a class="action" href="javascript:openHelp('{get_help_id key="editorial.trackDirectorsRole.review.blindPeerReview" url="true"}')">{translate key="reviewer.paper.ensuringBlindReview"}</a> -->
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
</table>
</div>