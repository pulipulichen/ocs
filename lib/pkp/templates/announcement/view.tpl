{**
 * view.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * View full announcement text.
 *
 *}
{strip}
{assign var="pageTitleTranslated" value=$announcementTitle}
{assign var="pageId" value="announcement.view"}
{include file="common/header.tpl"}
{/strip}

{if $isConferenceManager}
    <a class="edit-link" href="{url page="manager" }/editAnnouncement/{$announcement->getId()}" target="_blank">
        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
    </a>
{/if}
<table class="announcements" id="announcementDescription" width="100%">
	<tr>
		<td>{$announcement->getLocalizedDescription()|nl2br}</td>
	</tr>
        <tr class="details">
            <td class="more">
                <a href="javascript:history.back()">
                    {translate key="common.back"}
                </a>
            </td>
	</tr>
</table>

        
        

{include file="common/footer.tpl"}
