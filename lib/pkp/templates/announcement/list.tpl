{**
 * list.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display list of announcements without site header or footer.
 *
 *}
<table class="announcements">
	<tr>
		<td colspan="2" class="headseparator">&nbsp;</td>
	</tr>
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
	<tr class="details">
		
		{if $announcement->getLocalizedDescription() != null}
			<td class="more"><a href="{url page="announcement" op="view" path=$announcement->getId()}">{translate key="announcement.viewLink"}</a></td>
		{/if}
	</tr>
	<tr>
		<td class="{if $announcements->eof()}end{/if}separator">&nbsp;</td>
	</tr>
{/iterate}
{if $announcements->wasEmpty()}
	<tr>
		<td class="nodata">{translate key="announcement.noneExist"}</td>
	</tr>
	<tr>
		<td class="endseparator">&nbsp;</td>
	</tr>
{/if}
</table>
