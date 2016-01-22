{**
 * directorDecision.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Subtemplate defining the director decision table.
 *
 * $Id$
 *}
 
{assign var=availableDirectorDecisionOptions value=$submission->getDirectorDecisionOptions($currentSchedConf,$stage)}
<div id="directorDecision">
<h3>{translate key="submission.directorDecision"}</h3>

<table width="100%" class="data">
    <!-- 稿件處理結果記錄 -->
    <tr valign="top">
        <td class="label" width="20%">{translate key="director.paper.decision"}</td>
        <td class="value director-decisions" width="80%">
            {foreach from=$directorDecisions item=directorDecision key=decisionKey}
                {assign var="decision" value=$directorDecision.decision}
                {if $decision === '2'}
                    <div>
                        <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                        {translate key=$directorDecisionOptions.$decision}&nbsp;&nbsp;
                        ({$directorDecision.dateDecided|date_format:$dateFormatShort})
                    </div>
                {elseif $decision === '3'}
                    <div>
                        <span class="glyphicon glyphicon-time" aria-hidden="true"></span>
                        {translate key=$directorDecisionOptions.$decision}&nbsp;&nbsp;
                        ({$directorDecision.dateDecided|date_format:$dateFormatShort})
                    </div>
                {elseif $decision === '4'}
                    <div>
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                        {translate key=$directorDecisionOptions.$decision}&nbsp;&nbsp;
                        ({$directorDecision.dateDecided|date_format:$dateFormatShort})
                    </div>
                {/if}
            {foreachelse}
                {translate key="common.none"}
            {/foreach}
        </td>
    </tr>
</table>
</div>
        

<form method="post" action="{url op="directorReview" path=$stage}" enctype="multipart/form-data">
<input type="hidden" name="paperId" value="{$submission->getPaperId()}" />
{assign var=authorFiles value=$submission->getAuthorFileRevisions($stage)}
{assign var=directorFiles value=$submission->getDirectorFileRevisions($stage)}
{assign var=reviewFile value=$submission->getReviewFile()}
{assign var="authorRevisionExists" value=false}
{assign var="directorRevisionExists" value=false}
{assign var="sendableVersionExists" value=false}

{if not $reviewingAbstractOnly}
    <table class="data" width="100%">
        {*if $reviewFile}
            <tr valign="top">
                <td width="20%" class="label">{translate key="submission.reviewVersion"}</td>
                <td width="50%" colspan="2" class="value">
                    {if $lastDecision == SUBMISSION_DIRECTOR_DECISION_ACCEPT}
                        <input type="radio" name="directorDecisionFile" value="{$reviewFile->getFileId()},{$reviewFile->getRevision()}" />
                        {assign var="sendableVersionExists" value=true}
                    {/if}
                    <a href="{url op="downloadFile" path=$submission->getPaperId()|to_array:$reviewFile->getFileId():$reviewFile->getRevision()}" class="file">{$reviewFile->getFileName()|escape}</a>&nbsp;&nbsp;
                    {$reviewFile->getDateModified()|date_format:$dateFormatShort}
                </td>
            </tr>
        {/if*}
        {foreach from=$authorFiles item=authorFile key=key}
            <tr valign="top">
                {if !$authorRevisionExists}
                    {assign var="authorRevisionExists" value=true}
                    <td width="20%" rowspan="{$authorFiles|@count}" class="label">{translate key="submission.authorVersion"}</td>
                {/if}
                <td width="80%" class="value" colspan="2">
                    {if $lastDecision == SUBMISSION_DIRECTOR_DECISION_ACCEPT}
                        <input type="radio" name="directorDecisionFile" value="{$authorFile->getFileId()},{$authorFile->getRevision()}" />
                        {assign var="sendableVersionExists" value=true}
                    {/if}
                    <a href="{url op="downloadFile" path=$submission->getPaperId()|to_array:$authorFile->getFileId():$authorFile->getRevision()}" class="file">{$authorFile->getFileName()|escape}</a>&nbsp;&nbsp;
                        {$authorFile->getDateModified()|date_format:$dateFormatShort}
                </td>
            </tr>
        {foreachelse}
            <tr valign="top">
                <td width="20%" class="label">{translate key="submission.authorVersion"}</td>
                <td width="80%" colspan="2" class="nodata">{translate key="common.none"}</td>
            </tr>
        {/foreach}
        {foreach from=$directorFiles item=directorFile key=key}
            <tr valign="top">
                {if !$directorRevisionExists}
                    {assign var="directorRevisionExists" value=true}
                    <td width="20%" rowspan="{$directorFiles|@count}" class="label">{translate key="submission.directorVersion"}</td>
                {/if}
                <td width="50%" class="value">
                    {if $lastDecision == SUBMISSION_DIRECTOR_DECISION_ACCEPT}
                        <input type="radio" name="directorDecisionFile" value="{$directorFile->getFileId()},{$directorFile->getRevision()}" />
                        {assign var="sendableVersionExists" value=true}
                    {/if}
                    <a href="{url op="downloadFile" path=$submission->getPaperId()|to_array:$directorFile->getFileId():$directorFile->getRevision()}" class="file">{$directorFile->getFileName()|escape}</a>&nbsp;&nbsp;
                    {$directorFile->getDateModified()|date_format:$dateFormatShort}
                </td>
                <td width="30%" class="value"><a href="{url op="deletePaperFile" path=$submission->getPaperId()|to_array:$directorFile->getFileId():$directorFile->getRevision()}" class="action">{translate key="common.delete"}</a></td>
            </tr>
        {foreachelse}
            <tr valign="top">
                <td width="20%" class="label">{translate key="submission.directorVersion"}</td>
                <td width="80%" colspan="3" class="nodata">{translate key="common.none"}</td>
            </tr>
        {/foreach}
                {if $isCurrent}
                    <tr valign="top">
                        <td class="label">
                            {*translate key="director.paper.uploadDirectorVersion"*}
                            &nbsp;
                        </td>
                        <td colspan="3">
                            <input type="file" name="upload" class="uploadField" />
                            <input type="submit" name="submit" value="{translate key="common.upload"}" class="button" />
                            <br />
                            {assign var="status" value=$submission->getSubmissionStatus()}
                            {if $status != STATUS_ARCHIVED}
                                    <a class="btn btn-danger" 
                                       href="{url op="unsuitableSubmission" paperId=$submission->getPaperId()}" class="action">
                                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                        {translate key="director.paper.archiveSubmission"}
                                    </a>
                            {else}
                                    <a class="btn btn-primary" 
                                       href="{url op="restoreToQueue" path=$submission->getPaperId()}" class="action">
                                        <span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>
                                        {translate key="director.paper.restoreToQueue"}
                                    </a>
                            {/if}
                        </td>
                </div>
                {/if}
    </table>

    {if $sendableVersionExists}
        <table class="data" width="100%">
            <tr valign="top">
                <td width="20%" class="label">{translate key="director.paper.moveToLayout"}</td>
                <td width="80%">
                    
                    {if $submission->getDateToPresentations()}{$submission->getDateToPresentations()|date_format:$dateFormatShort}{/if}
                    {if !$submission->getGalleys()}
                        <input type="checkbox" checked="checked" name="createGalley" value="1" />
                        {translate key="director.paper.createGalley"}
                    {/if}
                                        <div>
                                            <input type="submit" name="setEditingFile" onclick="return window.confirm('{translate|escape:"jsparam" key="director.submissionReview.confirmToLayout"}')" value="{translate key="form.send"}" 
                                                class="btn btn-primary" />
                                        </div>
                </td>
            </tr>
        </table>

    {/if}
{/if}
</form>

<table width="100%" class="data" style="margin-top: 1rem;">
{* 設定稿件處理結果 *******}
<tr valign="top">
    <td class="label" width="20%">{translate key="director.paper.selectDecision"}</td>
        <td colspan="2" class="value" width="80%">
            {literal}
            <script>
                var _submit_decision = function (_form, _msg, _last) {
                    _last = _last + "";
                    if (_form.decision.value === '' || _form.decision.value === _last) {
                        return false;
                    }
                    else {
                        if (confirm(_msg) === false) {
                            _form.decision.value = _last;
                            return false;
                        }
                        else {
                            return true;
                        }
                    }
                };
            </script>
            {/literal}
            <form method="post" action="{url op="recordDecision" path=$stage}" 
                  onsubmit="return _submit_decision(this, '{translate|escape:"jsparam" key="director.submissionReview.confirmDecision"}', {$lastDecision})">
            <input type="hidden" name="paperId" value="{$submission->getPaperId()}" />
            
            {if $allowRecommendation and $isCurrent}
                <select name="decision" class="btn btn-default"{if not $allowRecommendation} disabled="disabled"{/if} onchange="$(this).next().click();">
                                {html_options_translate options=$availableDirectorDecisionOptions selected=$lastDecision}
                            </select>
                            <input type="submit" name="submit" value="{translate key="director.paper.recordDecision"}" {if not $allowRecommendation}disabled="disabled"{/if} 
                                   class="btn btn-primary hidden" />
                        {else}
                            {translate key="director.paper.cannotRecord"}
                            <br />
                            <a href="{url op="submissionAssignReviewer" path=$submission->getPaperId()}#directors">
                                {translate key="submissions.assignDirector"}
                            </a>
                        {/if}
        </form>
    </td>
</tr>
{** 通知作者 *******************************}
{if $allowRecommendation and $isCurrent and $directorDecisions }
<tr valign="top">
    <td class="label">
            {*translate key="submission.notifyAuthor"*}
            &nbsp;
        </td>
    <td class="value" colspan="2" width="80%">
        {url|assign:"notifyAuthorUrl" op="emailDirectorDecisionComment" paperId=$submission->getPaperId()}
        
                <a class="btn btn-default" href="{$notifyAuthorUrl}">
                    <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                    {translate key="submission.notifyAuthor"}
                    {*icon name="mail"*}
                </a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        {if $submission->getMostRecentDirectorDecisionComment()}
            {assign var="comment" value=$submission->getMostRecentDirectorDecisionComment()}
            <a href="javascript:openComments('{url op="viewDirectorDecisionComments" path=$submission->getPaperId() anchor=$comment->getId()}');" class="icon">
                            {icon name="comment"}
                            {translate key="submission.directorAuthorRecord"}
                        </a>
                        &nbsp;&nbsp;({$comment->getDatePosted()|date_format:$dateFormatShort})
        {else}
            <a href="javascript:openComments('{url op="viewDirectorDecisionComments" path=$submission->getPaperId()}');" class="icon">
                            {icon name="comment"}
                            {translate key="submission.directorAuthorRecord"}
                        </a>
                        ({translate key="common.noComments"})
        {/if}
        {if $lastDecision == SUBMISSION_DIRECTOR_DECISION_DECLINE}
            <br />
            {if $submission->getStatus() == STATUS_ARCHIVED}{translate key="submissions.archived"}{else}<a href="{url op="archiveSubmission" path=$submission->getPaperId()}" onclick="return window.confirm('{translate|escape:"jsparam" key="director.submissionReview.confirmToArchive"}')" class="action">{translate key="director.paper.sendToArchive"}</a>{/if}
            {if $submission->getDateToArchive()}{$submission->getDateToArchive()|date_format:$dateFormatShort}{/if}
        {/if}
    </td>
</tr>
{/if}
{if $isFinalReview and $allowRecommendation and $isCurrent and $directorDecisions}
    <tr>
        <td class="label">
            &nbsp;
        </td>
        <td class="value" colspan="2">
            <form method="post" action="{url op="completePaper"}">
                <input type="hidden" name="paperId" value="{$submission->getPaperId()}" />
            {if $submission->getStatus() == STATUS_PUBLISHED}
                <input name="remove" {if $submission->getStatus() != STATUS_PUBLISHED}disabled="disabled" {/if}type="submit" value="{translate key="submission.button.remove"}" 
                   class="btn btn-default" />
            {else}
                <input name="complete" {if $submission->getStatus() == STATUS_PUBLISHED}disabled="disabled" {/if}type="submit" value="{translate key="submission.button.complete"}" 
                   class="btn btn-primary" />
            {/if}
            </form>
        </td>
    </tr>
{/if}
{***}
</table>

{if $isFinalReview}

    {*include file="trackDirector/submission/complete.tpl"*}

        <!--
    <div class="separator"></div>

    {include file="trackDirector/submission/layout.tpl"}
        -->
{/if}

