{**
 * submissionsUnassigned.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Show listing of unassigned submissions.
 *
 * $Id$
 *}
{if $tracks|@count > 1}
    {assign var="colspan" value=7}
{else}
    {assign var="colspan" value=6}
{/if}
<div id="submissions">
<table width="100%" class="listing">
	<tr>
		<td colspan="{$colspan}" class="headseparator">&nbsp;</td>
	</tr>
	<tr class="heading" valign="bottom">
		<td width="5%">{sort_search key="common.id" sort="id"}</td>
		<td width="5%"><!--<span class="disabled">MM-DD</span><br />-->{sort_search key="submissions.submit" sort="submitDate"}</td>
                {if $tracks|@count > 1}
		<td>{sort_search key="submissions.track" sort="track"}</td>
                {/if}
		<td>{sort_search key="paper.sessionType" sort="sessionType"}</td>
		<td>{sort_search key="paper.authors" sort="authors"}</td>
		<td>{sort_search key="paper.title" sort="title"}</td>
                <td>{translate key="submissions.manage"}</td>
	</tr>
	<tr>
		<td colspan="{$colspan}" class="headseparator">&nbsp;</td>
	</tr>
	
	{iterate from=submissions item=submission}
	<tr valign="top"  class="listing-tr">
		<td>{$submission->getPaperId()}</td>
		<td>{$submission->getDateSubmitted()|date_format:$dateFormatTrunc}</td>
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
		<td>{$submission->getAuthorString(true)|truncate:40:"..."|escape}</td>
		{translate|assign:"untitledPaper" key="common.untitled"}
		<td><a href="{url op="submissionReview" path=$submission->getPaperId()}" class="action">{$submission->getLocalizedTitle()|default:$untitledPaper|strip_tags|truncate:60:"..."|default:"&mdash;"}</a>
			{if $submissionProgress != 0 && ($currentStage == REVIEW_STAGE_ABSTRACT || ($currentStage == REVIEW_STAGE_PRESENTATION && $submissionProgress < 3))}
				(<a href="{url op="deleteSubmission" path=$paperId}" class="action" onclick="return confirm('{translate|escape:"jsparam" key="author.submissions.confirmDelete"}')">{translate key="common.delete"}</a>)
			{/if}
		</td>
                <td>
                    <a href="{url op="submissionReview" path=$submission->getPaperId()}" class="action">
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
		<td colspan="{$colspan-1}" align="left">{page_info iterator=$submissions}</td>
		<td align="right">{page_links anchor="submissions" name="submissions" iterator=$submissions searchField=$searchField searchMatch=$searchMatch search=$search track=$track sort=$sort sortDirection=$sortDirection}</td>
	</tr>
{/if}
</table>
</div>
