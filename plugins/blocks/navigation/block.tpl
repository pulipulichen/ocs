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
		<table width="100%">
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
			|| $schedConfPostPayment  || $schedConfPostAccommodation || $schedConfPostSupporters  || $schedConfPostTimeline
                        || $schedConfContactEmail)}
		<!-- <span class="blockSubtitle">{translate key="schedConf.contents"}</span> -->
                
                <ul class="nav nav-stacked affix" style="clear: both;">
                    
                    {if $isConferenceManager}
                        <li class="panel panel-primary">
                                <a href="{url page="manager"}/timeline#websitePosting" target="_blank">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    {translate key="manager.timeline.websitePosting"}
                                </a>
                        </li>
                    {/if}
			{if $schedConfPostOverview}
                            <li {if $requestedOp=="overview"}class="active"{/if}>
                                {if $isConferenceManager}
                                <a class="edit-link" href="{url page="manager"}/schedConfSetup/1#description" target="_blank">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                </a>
                                {/if}
                                <a href="{url page="schedConf" op="overview"}">{translate key="schedConf.overview"}</a>
                            </li>
                        {/if}
                            <li {if $requestedPage=="announcement"}class="active"{/if}>
                                {if $isConferenceManager}
                                <a class="edit-link" href="{url page="manager"}/announcements?clearPageContext=1" target="_blank">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                </a>
                                {/if}
                                <a href="{url page="announcement"}">{translate key="plugins.block.navigation.announcement"}</a>
                            </li>
                        {if $schedConfShowCFP}
                            <li {if $requestedOp=="cfp"}class="active"{/if}>
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
			{if $schedConfPostTrackPolicies}
                            <li {if $requestedOp=="trackPolicies"}class="active"{/if}><a href="{url page="schedConf" op="trackPolicies"}">{translate key="schedConf.trackPolicies"}</a></li>
                        {/if}
			{if $schedConfShowProgram}
                            <li {if $requestedOp=="program"}class="active"{/if}>
                                {if $isConferenceManager}
                                    <a class="edit-link" href="{url page="manager"}/program" target="_blank">
                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    </a>
                                {/if}
                                <a href="{url page="schedConf" op="program"}">{translate key="schedConf.program"}</a>
                            </li>
                        {/if}
			{if $schedConfPostPresentations}<li {if $requestedOp=="presentations"}class="active"{/if}><a href="{url page="schedConf" op="presentations"}">{translate key="schedConf.presentations.short"}</a></li>{/if}
			{if $schedConfPostSchedule}<li {if $requestedOp=="schedule"}class="active"{/if}><a href="{url page="schedConf" op="schedule"}">{translate key="schedConf.schedule"}</a></li>{/if}
			{if $schedConfPostPayment}
                            <li {if $requestedOp=="registration" or $requestedOp=="register"}class="active"{/if}>
                                {if $isConferenceManager}
                                    <a class="edit-link" href="{url page="manager"}/registration?clearPageContext=1" target="_blank">
                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    </a>
                                {/if}
                                <a href="{url page="schedConf" op="registration"}">{translate key="schedConf.registration"}</a>
                            </li>
                        {/if}
                        {if $schedConfPostLocation}
                            <li {if $requestedOp=="location"}class="active"{/if}>
                                {if $isConferenceManager}
                                    <a class="edit-link" href="{url page="manager"}/location" target="_blank">
                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    </a>
                                {/if}
                                <a href="{url page="schedConf" op="location"}">{translate key="schedConf.location"}</a>
                            </li>
                        {/if}
			{if $schedConfPostAccommodation}
                            <li {if $requestedOp=="accommodation"}class="active"{/if}>
                                {if $isConferenceManager}
                                    <a class="edit-link" href="{url page="manager"}/accommodation" target="_blank">
                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    </a>
                                {/if}
                                <a href="{url page="schedConf" op="accommodation"}">{translate key="schedConf.accommodation"}</a>
                            </li>
                        {/if}
			{if $schedConfPostSupporters}<li {if $requestedOp=="organizingTeam"}class="active"{/if}><a href="{url page="about" op="organizingTeam"}">{translate key="schedConf.supporters"}</a></li>{/if}
			{if $schedConfPostTimeline}
                            <li {if $requestedOp=="timeline"}class="active"{/if}>
                                {if $isConferenceManager}
                                    <a class="edit-link" href="{url page="manager"}/timeline" target="_blank">
                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    </a>
                                {/if}
                                <a href="{url page="schedConf" op="timeline"}">{translate key="schedConf.timeline"}</a>
                            </li>
                        {/if}
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
                
                <div>
                <ul class="nav nav-stacked">
                    {if $isConferenceManager}
                        <li class="panel panel-primary">
                                <a href="{url page="manager"}/setup/3#navigationBar" target="_blank">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    {translate key="manager.setup.layout.navigationBar"}
                                </a>
                        </li>
                    {/if}
                {foreach from=$navMenuItems key=navItemId item=navItem}
			{if $navItem.name != '' 
                            && $navItem.visibility !== '0' && ($navItem.visibility === '1' 
                                || ($navItem.visibility === '2' && $isUserLoggedIn)
                                || ($navItem.visibility === '3' && $isRegistrationUser)
                                || ($navItem.visibility === '4' && $isConferenceManager)) }
				<li  {if $requestedOp=="page"}class="active"{/if}>
                                    <a {if $navItem.urlType=='3'}
                                            href="{url page="schedConf"}/page?title={if $navItem.isLiteral}{$navItem.name|escape}{else}{translate key=$navItem.name}{/if}&url={$navItem.url|escape}"
                                        {elseif $navItem.urlType=='4'}
                                            href="{url page="schedConf"}/survey?id={$navItemId}"
                                        {elseif $navItem.urlType=='5'}
                                            href="{url page="schedConf"}/navPage?id={$navItemId}"
                                        {else}
                                            href="{$navItem.url|escape}"
                                        {/if}
                                       {if $navItem.urlType=='2'} target="_blank"{/if}>
                                        {if $navItem.isLiteral}
                                            {$navItem.name|escape}
                                        {else}
                                            {translate key=$navItem.name}
                                        {/if}
                                    </a>
                                </li>
			{/if}
		{/foreach}
                </ul>
                </div>
                
                {if $schedConfContactEmail and $schedConfShowContact}
                <ul class="nav nav-stacked">
                    <li>
                        {if $isConferenceManager}
                            <a class="edit-link" href="{url page="manager"}/schedConfSetup/1#principalContact" target="_blank">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            </a>
                        {/if}
                        <a href="mailto:{$schedConfContactEmail}">
                            <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                            {translate key="schedConf.emailToDirector"}
                        </a>
                    </li>
                </ul>
                {/if}
	</div>

