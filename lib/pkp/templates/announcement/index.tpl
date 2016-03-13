{**
 * index.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display list of announcements.
 *
 *}
{strip}
{assign var="pageTitle" value="announcement.announcements"}
{assign var="pageId" value="announcement.announcements"}
{include file="common/header.tpl"}
{/strip}

<div id="announcementList">
{if $isConferenceManager}
    <a class="edit-link" href="{url page="manager" }/announcements?clearPageContext=1" target="_blank">
        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
    </a>
{/if}

<table class="announcements">
{if $announcementsIntroduction != null}
	<tr class="intro">
		<td colspan="2" class="intro">{$announcementsIntroduction|nl2br}</td>
	</tr>
{/if}
{iterate from=announcements item=announcement}
	<tr class="title">
            <td class="title">
                {if $isConferenceManager}
                    <a class="edit-link" href="{url page="manager" }/editAnnouncement/{$announcement->getId()}" target="_blank">
                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                    </a>
                {/if}
                <span class="glyphicon glyphicon-calendar"></span>
                {translate key="announcement.posted"}: {$announcement->getDatePosted()}
                <a href="{url op="view" path=$announcement->getAnnouncementId()}">
                    {if $announcement->getTypeId() != null}
                        <h4>{$announcement->getAnnouncementTypeName()|escape}: {$announcement->getLocalizedTitle()|escape}</h4>
                    {else}
                        <h4>{$announcement->getLocalizedTitle()|escape}</h4>
                    {/if}
                </a>
            </td>
	</tr>
	<tr class="description">
		<td class="description">{$announcement->getLocalizedDescriptionShort()|nl2br}</td>
	</tr>
        {if $announcement->getAnnouncementDescription() != null}
	<tr class="details">
		
            <td class="more"><a href="{url op="view" path=$announcement->getAnnouncementId()}">{translate key="announcement.viewLink"}</a></td>
		
	</tr>
        {/if}
	<tr>
		<td class="{if $announcements->eof()}end{/if}separator">&nbsp;</td>
	</tr>
{/iterate}
{if $announcements->wasEmpty()}
	<tr>
		<td class="nodata">{translate key="announcement.noneExist"}</td>
	</tr>
	<tr>
		<td colspan="2" class="endseparator">&nbsp;</td>
	</tr>
{else}
	<tr>
		<td align="left">{page_info iterator=$announcements}</td>
		<td align="right">{page_links anchor="announcements" name="announcements" iterator=$announcements}</td>
	</tr>
{/if}
</table>
</div>

{include file="common/footer.tpl"}
