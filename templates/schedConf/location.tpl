{**
 * location.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Scheduled conference location page.
 *
 * $Id$
 *}
{strip}
{translate|assign:"pageTitleTranslated" key="schedConf.location.title"}
{include file="common/header.tpl"}
{/strip}

{if $isConferenceManager}
    <a class="edit-link" href="{url page="manager"}/location" target="_blank">
        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
    </a>
{/if}

<div id="accomodationDescription">{$locationDescription|nl2br}</div>

{include file="common/footer.tpl"}
