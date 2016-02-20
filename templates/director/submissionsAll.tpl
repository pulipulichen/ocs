{**
 * submissionsInReview.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Show director's submissions in review.
 *
 * $Id$
 *}
{if $tracks|@count > 1}
    {assign var="colspan" value=9}
{else}
    {assign var="colspan" value=8}
{/if}
<div id="submissions">

<table width="100%" class="listing">
	<tr>
		<td colspan="{$colspan}" class="headseparator">&nbsp;</td>
	</tr>
	<tr class="heading" valign="bottom">
		<td>{sort_search key="common.id" sort="id"}</td>
		{*}<td><!--<span class="disabled">MM-DD</span><br />-->{sort_search key="submissions.submit" sort="submitDate"}</td>{*}
                {if $tracks|@count > 1}
		<td>{sort_search key="submissions.track" sort="track"}</td>
                {/if}
		<td>{sort_search key="paper.sessionType" sort="sessionType"}</td>
		<td>{sort_search key="paper.authors" sort="authors"}</td>
		<td>{sort_search key="paper.title" sort="title"}</td>
                <!--
		<td>
			<center>{translate key="submission.peerReview"}</center>
			<table width="100%" class="nested">
				<tr valign="top">
					<td width="25%" style="padding: 0 4px 0 0; font-size: 1.0em">{translate key="submissions.reviewType"}</td>
					<td width="25%" style="padding: 0 4px 0 0; font-size: 1.0em">{translate key="submission.ask"}</td>
					<td width="25%" style="padding: 0 4px 0 0; font-size: 1.0em">{translate key="submission.due"}</td>
					<td width="25%" style="padding: 0 4px 0 0; font-size: 1.0em">{translate key="submission.done"}</td>
				</tr>
			</table>
		</td>
		<td>{translate key="submissions.ruling"}</td>
                -->
                <td>{translate key="director.paper.selectReviewer"}</td>
                <td>{translate key="director.paper.reviewStatus"}</td>
                
		<td>{translate key="paper.trackDirector"}</td>
                <td>{translate key="submissions.manage"}</td>
	</tr>
	<tr>
		<td colspan="{$colspan}" class="headseparator">&nbsp;</td>
	</tr>
	
	{iterate from=submissions item=submission}
        
        {assign var="latestStatus" value=$submission->getLatestStatus()}
        
	<tr valign="top"  class="listing-tr">
		<td>{$submission->getPaperId()}</td>
		{*}<td>{$submission->getDateSubmitted()|date_format:$dateFormatTrunc}</td>{*}
                {if $tracks|@count > 1}
		<td>{$submission->getTrackAbbrev()|escape}</td>
                {/if}
		<td>
			{assign var="sessionTypeId" value=$submission->getData('sessionType')}
			{if $sessionTypeId}
				{assign var="sessionType" value=$sessionTypes.$sessionTypeId}
                                {assign var="sessionName" value=$sessionType->getLocalizedName()}
                                {if $sessionName|strlen < 12}
                                    {$sessionName|escape}
                                    {else}
                                    {$sessionName|escape|substr:0:12}...
                                {/if}
			{/if}
		</td>
		<td>{$submission->getAuthorString(true)|truncate:40:"..."|escape}</td>
		<td><a href="{url op="submissionReview" path=$submission->getPaperId()|to_array:$submission->getCurrentStage()}" class="action">{$submission->getLocalizedTitle()|strip_tags|truncate:40:"..."|default:"&mdash;"}</a></td>
                <!--
		<td>
		<table width="100%">
			{foreach from=$submission->getReviewAssignments() item=reviewAssignments}
				{foreach from=$reviewAssignments item=assignment name=assignmentList}
					{if not $assignment->getCancelled() and not $assignment->getDeclined()}
					<tr valign="top">
						<td width="25%" style="padding: 0 4px 0 0; font-size: 1.0em">{if $assignment->getStage() == REVIEW_STAGE_ABSTRACT}{translate key="submission.abstract"}{else}{translate key="submission.paper"}{/if}</td>
						<td width="25%" style="padding: 0 4px 0 0; font-size: 1.0em">{if $assignment->getDateNotified()}{$assignment->getDateNotified()|date_format:$dateFormatTrunc}{else}&mdash;{/if}</td>
						<td width="25%" style="padding: 0 4px 0 0; font-size: 1.0em">{if $assignment->getDateCompleted() || !$assignment->getDateConfirmed()}&mdash;{else}{$assignment->getWeeksDue()|default:"&mdash;"}{/if}</td>
						<td width="25%" style="padding: 0 4px 0 0; font-size: 1.0em">{if $assignment->getDateCompleted()}{$assignment->getDateCompleted()|date_format:$dateFormatTrunc}{else}&mdash;{/if}</td>
					</tr>
					{/if}
				{foreachelse}
					<tr valign="top">
						<td width="25%" style="padding: 0 4px 0 0; font-size: 1.0em">&mdash;</td>
						<td width="25%" style="padding: 0 4px 0 0; font-size: 1.0em">&mdash;</td>
						<td width="25%" style="padding: 0 4px 0 0; font-size: 1.0em">&mdash;</td>
						<td width="25%" style="padding: 0 0 0 0; font-size: 1.0em">&mdash;</td>
					</tr>
				{/foreach}
			{foreachelse}
				<tr valign="top">
					<td width="25%" style="padding: 0 4px 0 0; font-size: 1.0em">&mdash;</td>
					<td width="25%" style="padding: 0 4px 0 0; font-size: 1.0em">&mdash;</td>
					<td width="25%" style="padding: 0 4px 0 0; font-size: 1.0em">&mdash;</td>
					<td width="25%" style="padding: 0 4px 0 0; font-size: 1.0em">&mdash;</td>
				</tr>
			{/foreach}
			</table>
		</td>
		<td> 
                        {assign var="decisionsArray" value=$submission->getDecisions() }
			{foreach from=$decisionsArray item=decisions}
                            {if $smarty.foreach.decisionsArray.last}
				{foreach from=$decisions item=decision name=decisionList}
					{if $smarty.foreach.decisionList.last}
                                            {$decision.dateDecided|date_format:$dateFormatTrunc}
					{/if}
				{foreachelse}
                                    &mdash;
				{/foreach}
                            {/if}
			{foreachelse}
				&mdash;
			{/foreach}
		</td>
                -->
                
                {* 審查委員 *}
                <td >
                    {assign var="stage" value=2}
                    {assign var=reviewAssignments value=$submission->getReviewAssignments($stage)}
                    {if $reviewAssignments|@count === 0} 
                        &mdash;
                    {else}
                        {assign var="hasReview" value=0}
                        {foreach from=$reviewAssignments item=reviewAssignment key=reviewKey}
                            {assign var=reviewerRecommendationOptions value=$reviewAssignment->getReviewerRecommendationOptions()}
                            {if not $reviewAssignment->getCancelled()}
                            {assign var="hasReview" value=1}
                            <a href="{url op="submissionAssignReviewer" path=$submission->getPaperId()|to_array:$submission->getCurrentStage()}#peerReview{$reviewAssignment->getId()}" 
                               class="btn btn-default btn-sm"
                               target="_blank"
                               title="{$reviewAssignment->getReviewerFullName()|escape}">
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
                            {else}
                                &mdash;
                            {/if}
                            </a>
                            {/if}
                        {/foreach}
                        {if $hasReview===0}
                            &mdash;
                        {/if}
                    {/if}
                </td>
                
                {* 審查結果 *}
                <td>
                    {*$latestStatus*}
                    {if $latestStatus === '2'}
                        <span class="text-success">
                            {translate key=director.paper.decision.accept}
                        </span>
                    {elseif $latestStatus === '3'}
                        <span class="text-warning">
                            {translate key=director.paper.decision.pendingRevisions}
                        </span>
                    {elseif $latestStatus === '4'}
                        <span class="text-warning">
                            {translate key=director.paper.decision.decline}
                        </span>
                    {elseif $latestStatus === '5'}
                        <span class="text-warning">
                            {translate key=common.queue.short.submissionsArchives}
                        </span>
                    {elseif $latestStatus === '9'}
                        <span class="text-info">
                            {translate key=director.paper.decision.authorRevised}
                        </span>
                    {else}
                        <span style="color:#CCC">
                            {translate key=director.paper.decision.wait}
                        </span>
                    {/if}
                </td>
		<td>
			{assign var="editAssignments" value=$submission->getEditAssignments()}
			{foreach from=$editAssignments item=editAssignment}
                            {*$editAssignment->getDirectorInitials()|escape*} 
                            {$editAssignment->getDirectorFirstName()|escape} 
                        {/foreach}
		</td>
                <td>
                    <a href="{url op="submissionReview" path=$submission->getPaperId()|to_array:$submission->getCurrentStage()}" class="action">
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
		<td colspan="{$colspan-3}" align="left">{page_info iterator=$submissions}</td>
		<td colspan="4" align="right">{page_links anchor="submissions" name="submissions" iterator=$submissions searchField=$searchField searchMatch=$searchMatch search=$search track=$track sort=$sort sortDirection=$sortDirection}</td>
	</tr>
{/if}
</table>
</div>
