{**
 * program.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Scheduled conference program page.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitleTranslated" value=$title}
{include file="common/header.tpl"}
{/strip}


{if $isConferenceManager}
    <a class="edit-link" href="{url page="manager"}/setup/3#navigationBar" target="_blank">
        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
    </a>
{/if}
{$navPage}

{include file="common/footer.tpl"}
