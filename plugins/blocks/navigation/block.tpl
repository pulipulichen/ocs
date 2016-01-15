{**
 * block.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site sidebar menu -- navigation links.
 *
 * $Id$
 *}
	<div class="block" id="sidebarNavigation">
		<!-- <span class="blockTitle">{translate key="plugins.block.navigation.conferenceContent"}</span> -->
		
		<!-- <span class="blockSubtitle">{translate key="navigation.search"}</span> -->
		<form method="post" action="{url page="search" op="results"}">
		<table>
		<tr>
			<td><input type="text" id="query" name="query" size="15" maxlength="255" value="" class="form-control" /></td>
		</tr>
		<tr>
                    <td>
                                <select name="searchField" size="1" class="form-control" style="width:calc(100% - 3.5em);display:inline">
				{html_options_translate options=$paperSearchByOptions}
			</select>
                            <button type="submit" value="{translate key="common.search"}" class="btn btn-default input-sm">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>
                        </div>
                        
                        
                    </td>
		</tr>
		</table>
		</form>
		
		<br />
	
		{if $currentSchedConf && ($schedConfPostOverview || $schedConfShowCFP
			|| $schedConfPostPolicies || $schedConfShowProgram ||  $schedConfPostPresentations || $schedConfPostSchedule 
			|| $schedConfPostPayment  || $schedConfPostAccommodation || $schedConfPostSupporters  || $schedConfPostTimeline)}
		<!-- <span class="blockSubtitle">{translate key="schedConf.contents"}</span> -->

		<ul class="nav nav-stacked">
			{if $schedConfPostOverview}<li><a href="{url page="schedConf" op="overview"}">{translate key="schedConf.overview"}</a></li>{/if}
			<li><a href="{url page="announcement"}">{translate key="plugins.block.navigation.announcement"}</a></li>
                        {if $schedConfShowCFP}
                        <li>
                            {if $isConferenceManager}
                                    <a class="edit-link" href="{url page="manager"}/timeline#submissionsTimeline" target="_blank">
                                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                        </a>
                                    {/if}
                            <a href="{url page="schedConf" op="cfp"}">
                                
                                    {translate key="schedConf.cfp"}
                                
                                <br />
                                {if $submissionsOpenDate}    
                                    ({$submissionsOpenDate|date_format:$dateFormatShort} ~ {$submissionsCloseDate|date_format:$dateFormatShort})
                                {/if}
                            </a>
                        </li>
			{/if}
			{if $schedConfPostTrackPolicies}<li><a href="{url page="schedConf" op="trackPolicies"}">{translate key="schedConf.trackPolicies"}</a></li>{/if}
			{if $schedConfShowProgram}<li><a href="{url page="schedConf" op="program"}">{translate key="schedConf.program"}</a></li>{/if}
			{if $schedConfPostPresentations}<li><a href="{url page="schedConf" op="presentations"}">{translate key="schedConf.presentations.short"}</a></li>{/if}
			{if $schedConfPostSchedule}<li><a href="{url page="schedConf" op="schedule"}">{translate key="schedConf.schedule"}</a></li>{/if}
			{if $schedConfPostPayment}<li><a href="{url page="schedConf" op="registration"}">{translate key="schedConf.registration"}</a></li>{/if}
			{if $schedConfPostAccommodation}<li><a href="{url page="schedConf" op="accommodation"}">{translate key="schedConf.accommodation"}</a></li>{/if}
			{if $schedConfPostSupporters}<li><a href="{url page="about" op="organizingTeam"}">{translate key="schedConf.supporters"}</a></li>{/if}
			{if $schedConfPostTimeline}<li><a href="{url page="schedConf" op="timeline"}">{translate key="schedConf.timeline"}</a></li>{/if}
		</ul>
		{/if}

		{if $currentConference}
                    <!--
		<span class="blockSubtitle">{translate key="navigation.browse"}</span>
		<ul class="nav nav-stacked">
			<li><a href="{url page="search" op="schedConfs"}">{translate key="navigation.browseByConference"}</a></li>
			<li><a href="{url page="search" op="authors"}">{translate key="navigation.browseByAuthor"}</a></li>
			<li><a href="{url page="search" op="titles"}">{translate key="navigation.browseByTitle"}</a></li>
			{if $hasOtherConferences}
			<li><a href="{url conference="index"}">{translate key="navigation.otherConferences"}</a></li>
			{/if}
		</ul>
                    -->
		{/if}
	</div>

