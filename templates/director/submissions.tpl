{**
 * submissions.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Director submissions page(s).
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="common.queue.long.$pageToDisplay"}
{url|assign:"currentUrl" page="director"}{include file="common/header.tpl"}
{/strip}

<script type="text/javascript">
{literal}
<!--
function sortSearch(heading, direction) {
  document.submit.sort.value = heading;
  document.submit.sortDirection.value = direction;
  document.submit.submit() ;
}
// -->
{/literal}
</script> 

{assign var="directorSubmissionsCount" value=$submissionsCount.Director.$conferenceId.$schedConfId}
<ul class="nav nav-tabs">
        <li{if $pageToDisplay == "submissionsAll"} class="current active"{/if}>
            <a href="{url op="submissions" path="submissionsAll"}">
                {translate key="common.queue.short.submissionsAll"}
                {if $directorSubmissionsCount[0]}
                    ({$directorSubmissionsCount[0]})
                {else}
                    (0)
                {/if}
            </a>
        </li>
	<li{if $pageToDisplay == "submissionsUnassigned"} class="current active"{/if}>
            <a href="{url op="submissions" path="submissionsUnassigned"}">
                {translate key="common.queue.short.submissionsUnassigned"}
                {if $directorSubmissionsCount[1]}
                    ({$directorSubmissionsCount[1]})
                {else}
                    (0)
                {/if}
            </a>
        </li>
	<li{if $pageToDisplay == "submissionsInReview"} class="current active"{/if}>
            <a href="{url op="submissions" path="submissionsInReview"}">
                {translate key="common.queue.short.submissionsInReview"}
                {if $directorSubmissionsCount[2]}
                    ({$directorSubmissionsCount[2]})
                {else}
                    (0)
                {/if}
            </a>
        </li>
	<li{if $pageToDisplay == "submissionsAccepted"} class="current active"{/if}>
            <a href="{url op="submissions" path="submissionsAccepted"}">
                {translate key="common.queue.short.submissionsAccepted"}
                {if $directorSubmissionsCount[3]}
                    ({$directorSubmissionsCount[3]})
                {else}
                    (0)
                {/if}
            </a>
        </li>
	<li{if $pageToDisplay == "submissionsArchives"} class="current active"{/if}>
            <a href="{url op="submissions" path="submissionsArchives"}">
                {translate key="common.queue.short.submissionsArchives"}
                {if $directorSubmissionsCount[4]}
                    ({$directorSubmissionsCount[4]})
                {else}
                    (0)
                {/if}
            </a>
        </li>
</ul>

<form action="#">
<ul class="filter">
	<li>{translate key="director.submissions.assignedTo"}: 
            <select name="filterDirector" onchange="location.href='{url|escape:"javascript" path=$pageToDisplay searchField=$searchField searchMatch=$searchMatch search=$search dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateFromMonth=$dateFromMonth dateToDay=$dateToDay dateToYear=$dateToYear dateToMonth=$dateToMonth filterDirector="DIRECTOR"}'.replace('DIRECTOR', this.options[this.selectedIndex].value)" size="1" class="selectMenu">
                {html_options options=$directorOptions selected=$filterDirector}
            </select>
        </li>
	<li>{translate key="director.submissions.inTrack"}: <select name="filterTrack" onchange="location.href='{url|escape:"javascript" path=$pageToDisplay searchField=$searchField searchMatch=$searchMatch search=$search dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateFromMonth=$dateFromMonth dateToDay=$dateToDay dateToYear=$dateToYear dateToMonth=$dateToMonth filterTrack="TRACK_ID"}'.replace('TRACK_ID', this.options[this.selectedIndex].value)" size="1" class="selectMenu">{html_options options=$trackOptions selected=$filterTrack}</select></li>
        <!--
        <li>
            {translate key="director.paper.filterReviewer"}: 
            <select name="filterReviewer" onchange="location.href='{url|escape:"javascript" path=$pageToDisplay searchField=$searchField searchMatch=$searchMatch search=$search dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateFromMonth=$dateFromMonth dateToDay=$dateToDay dateToYear=$dateToYear dateToMonth=$dateToMonth filterReviewer="REVIEWER"}'.replace('REVIEWER', this.options[this.selectedIndex].value)" size="1" class="selectMenu">
                {html_options options=$reviewerOptions selected=$filterReviewer}
            </select>
        </li>
        -->
</ul>
</form>

<form method="post" name="submit" action="{url op="submissions" path=$pageToDisplay}">
	<input type="hidden" name="sort" value="id"/>
	<input type="hidden" name="sortDirection" value="ASC"/>
	<select name="searchField" size="1" class="selectMenu">
		{html_options_translate options=$fieldOptions selected=$searchField}
	</select>
	<select name="searchMatch" size="1" class="selectMenu">
		<option value="contains"{if $searchMatch == 'contains'} selected="selected"{/if}>{translate key="form.contains"}</option>
		<option value="is"{if $searchMatch == 'is'} selected="selected"{/if}>{translate key="form.is"}</option>
		<option value="startsWith"{if $searchMatch == 'startsWith'} selected="selected"{/if}>{translate key="form.startsWith"}</option>
	</select>
	<input type="text" size="15" name="search" class="textField" value="{$search|escape}" />
	
	<input type="submit" value="{translate key="common.search"}" class="button" />
</form>
&nbsp;

{include file="director/$pageToDisplay.tpl"}

{if ($pageToDisplay == "submissionsInReview")}
<br />
<h4>{translate key="common.notes"}</h4>
<p>{translate key="director.submissionReview.notes"}</p>
{/if}

{include file="common/footer.tpl"}
