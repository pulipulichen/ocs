{**
 * active.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Show reviewer's active submissions.
 *
 * $Id$
 *}

{assign var="colspan" value=8}
{if $tracks|@count < 2}
    {assign var="colspan" value=$colspan-1}
{/if}
<div id="submissions">
<table class="listing" width="100%">
	<tr><td colspan="{$colspan}" class="headseparator">&nbsp;</td></tr>
	<tr class="heading" valign="bottom">
		<td>{translate key="common.id"}</td>
		<td><!--<span class="disabled">MM-DD</span><br />-->
                    {*translate key="common.assigned"*}
                    指派日期
                </td>
                {if $tracks|@count > 1}
		<td>{translate key="submissions.track"}</td>
                {/if}
                <td>{translate key="paper.sessionType"}</td>
		<td>{translate key="paper.title"}</td>
		<td>{translate key="submission.due"}</td>
		<td>{translate key="submissions.reviewType"}</td>
                <td align="right">{translate key="submissions.manage"}</td>
	</tr>
	<tr><td colspan="{$colspan}" class="headseparator">&nbsp;</td></tr>

{iterate from=submissions item=submission}
	{assign var="paperId" value=$submission->getPaperId()}
	{assign var="reviewId" value=$submission->getReviewId()}

        <tr valign="top" class="listing-tr">
		<td>{$paperId|escape}</td>
		<td>{$submission->getDateNotified()|date_format:$dateFormatTrunc}</td>
                {if $tracks|@count > 1}
		<td>{$submission->getTrackAbbrev()|escape}</td>
                {/if}
                <td>
                    {assign var="sessionTypeId" value=$submission->getData('sessionType')}
                    {if $sessionTypeId}
                            {assign var="sessionType" value=$sessionTypes.$sessionTypeId}
                            {if $sessionType|is_object}
                                {assign var="sessionName" value=$sessionType->getLocalizedName()}
                                {if $sessionName|strlen < 12}
                                    {$sessionName|escape}
                                    {else}
                                    {$sessionName|escape|substr:0:12}...
                                {/if}
                            {else}
                                &mdash;
                            {/if}
                    {/if}
                </td>
		<td><a href="{url op="submission" path=$reviewId}" class="action">{$submission->getLocalizedTitle()|strip_tags|truncate:60:"..."}</a></td>
		<td class="nowrap">{$submission->getDateDue()|date_format:$dateFormatTrunc}</td>
		{if $submission->getReviewMode() == REVIEW_MODE_BOTH_SEQUENTIAL}
			<td>
				{if $submission->getCurrentStage()==REVIEW_STAGE_ABSTRACT}{* Reviewing abstract *}
					{translate key="submission.abstract"}
				{else}
					{translate key="submission.paper"}
				{/if}
			</td>
                {else}
                    <td>
                        &mdash;
                    </td>
		{/if}
                <td align="right">
                    <a href="{url op="submission" path=$reviewId}" class="action">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    </a>
                </td>
	</tr>
	<tr>
		<td colspan="{$colspan}" class="{if $submissions->eof()}end{/if}separator">&nbsp;</td>
	</tr>
{/iterate}
{if $submissions->wasEmpty()}
<tr>
		<td colspan="{$colspan}" class="nodata">{translate key="submissions.noSubmissions"}</td>
	</tr>
	<tr>
		<td colspan="{$colspan}" class="endseparator">&nbsp;</td>
	</tr>
{else}
	<tr>
		<td colspan="3" align="left">{page_info iterator=$submissions}</td>
		<td colspan="{$colspan-3}" align="right">{page_links anchor="submissions" name="submissions" iterator=$submissions}</td>
	</tr>
{/if}
</table>
</div>

<div class="separator"></div>