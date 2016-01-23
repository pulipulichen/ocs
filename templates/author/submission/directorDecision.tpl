{**
 * peerReview.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Subtemplate defining the author's director decision table.
 *
 * $Id$
 *}
<div id="directorDecision">
<h3>{translate key="submission.directorDecision"}</h3>

{assign var=authorFiles value=$submission->getAuthorFileRevisions($submission->getCurrentStage())}
{assign var=directorFiles value=$submission->getDirectorFileRevisions($submission->getCurrentStage())}

<table width="100%" class="data">
	<tr valign="top">
		<td class="label">{translate key="director.paper.decision"}</td>
		<td>
                   
			{if $lastDirectorDecision}
				{assign var="decision" value=$lastDirectorDecision.decision}
                            {if $decision === '2'}
                                <div class="text-success">
                                    <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                                    {translate key=$directorDecisionOptions.$decision}&nbsp;&nbsp;
                                    ({$lastDirectorDecision.dateDecided|date_format:$dateFormatShort})
                                </div>
                            {elseif $decision === '3'}
                                <div class="text-danger">
                                    <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                                    {translate key=$directorDecisionOptions.$decision}&nbsp;&nbsp;
                                    ({$lastDirectorDecision.dateDecided|date_format:$dateFormatShort})
                                </div>
                            {elseif $decision === '4'}
                                <div>
                                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                    {translate key=$directorDecisionOptions.$decision}&nbsp;&nbsp;
                                    ({$lastDirectorDecision.dateDecided|date_format:$dateFormatShort})
                                </div>
                            {/if}
			{else}
				&mdash;
			{/if}
		</td>
	</tr>
	<tr valign="top">
		<td class="label" width="20%">
			{translate key="submission.directorVersion"}
		</td>
		<td class="value highlight-last" width="80%">
			{foreach from=$directorFiles item=directorFile key=key}
                            <div>
				<a href="{url op="downloadFile" path=$submission->getPaperId()|to_array:$directorFile->getFileId():$directorFile->getRevision()}" class="file">
                                    <span class="glyphicon glyphicon-save-file" aria-hidden="true"></span>
                                    {$directorFile->getFileName()|escape}
                                </a>
                                &nbsp;&nbsp;
                                ({$directorFile->getDateModified()|date_format:$dateFormatShort})
                            </div>    
			{foreachelse}
				{translate key="common.none"}
			{/foreach}
		</td>
	</tr>
	<tr valign="top">
		<td class="label" width="20%">
			{translate key="submission.authorVersion"}
		</td>
		<td class="value highlight-last" width="80%">
			{foreach from=$authorFiles item=authorFile key=key}
                            <div>
				<a href="{url op="downloadFile" path=$submission->getPaperId()|to_array:$authorFile->getFileId():$authorFile->getRevision()}" class="file">
                                    <span class="glyphicon glyphicon-save-file" aria-hidden="true"></span>
                                    {*$authorFile->getFileName()|escape*}
                                    {$authorFile->getOriginalFileName()|escape}
                                </a>
                                &nbsp;&nbsp;
                                ({$authorFile->getDateModified()|date_format:$dateFormatShort})
				{if $mayEditPaper}
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="{url op="deletePaperFile" path=$submission->getPaperId()|to_array:$authorFile->getFileId():$authorFile->getRevision()}" class="action">
                                            {translate key="common.delete"}
                                        </a>
				{/if}
                            </div>
			{foreachelse}
				{translate key="common.none"}
			{/foreach}
		</td>
	</tr>
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
	<tr valign="top">
		<td class="label" width="20%">
			{translate key="author.paper.uploadAuthorVersion"}
		</td>
		<td class="value" width="80%">
                    {if $mayEditPaper}
			<form method="post" action="{url op="uploadRevisedVersion"}#directorDecision" enctype="multipart/form-data">
				<input type="hidden" name="paperId" value="{$submission->getPaperId()}" />
				<input type="file" {if !$mayEditPaper}disabled="disabled" {/if}name="upload" class="uploadField" />
				<input type="submit" {if !$mayEditPaper}disabled="disabled" {/if}name="submit" value="{translate key="common.upload"}" class="button" />
			</form>
                    {else}
                        稿件已經封存，無法更新
                    {/if}
		</td>
	</tr>
	<tr valign="top">
		<td class="label" width="20%">
			{*translate key="submission.notifyDirector"*}
		</td>
		<td class="value" width="80%">
			{url|assign:"notifyAuthorUrl" op="emailDirectorDecisionComment" paperId=$submission->getPaperId()}
                        {if $authorFiles and $mayEditPaper}
                        <a href="{$notifyAuthorUrl}" class="btn btn-primary">
                            <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                            {translate key="submission.notifyDirector"}
                        </a>
			{*icon name="mail" url=$notifyAuthorUrl*}
			&nbsp;&nbsp;&nbsp;&nbsp;
                        {/if}
			
			{if $submission->getMostRecentDirectorDecisionComment()}
				{assign var="comment" value=$submission->getMostRecentDirectorDecisionComment()}
				<a href="javascript:openComments('{url op="viewDirectorDecisionComments" path=$submission->getPaperId() anchor=$comment->getId()}');" class="icon">
                                    {icon name="comment"}
                                    {translate key="submission.directorAuthorRecord"}
                                </a> 
                                ({$comment->getDatePosted()|date_format:$dateFormatShort})
			{else}
				<a href="javascript:openComments('{url op="viewDirectorDecisionComments" path=$submission->getPaperId()}');" class="icon">
                                    {icon name="comment"}
                                    {translate key="submission.directorAuthorRecord"}
                                </a>
                                ({translate key="common.noComments"})
			{/if}
		</td>
	</tr>
</table>
</div>

<!--                        
<div class="separator"></div>

{include file="author/submission/layout.tpl"}
-->
