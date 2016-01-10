{**
 * cfp.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Scheduled conference call-for-papers page.
 *
 * $Id$
 *}
{strip}
{translate|assign:"pageTitleTranslated" key="schedConf.cfp.title"}
{include file="common/header.tpl"}
{/strip}
<div id="cfp">
{if $isConferenceManager}
    <a class="edit-link" href="{$schedConfUrl}/manager/schedConfSetup/2#callForPapers">
        {translate key="manager.registrationOptions.editTitle"}
    </a>
{/if}
<p>{$cfpMessage|nl2br}</p>

{if $authorGuidelines != ''}
<div class="separator"></div>
    {if $isConferenceManager}
        <a class="edit-link" href="{$schedConfUrl}/manager/schedConfSetup/2#authorGuidelinesInfo">
            {translate key="manager.registrationOptions.editTitle"}
        </a>
    {/if}
	<h3>{translate key="about.authorGuidelines"}</h3>
	<p>{$authorGuidelines|nl2br}</p>
{/if}

<div class="separator"></div>

<div class="text-center">
{if $acceptingSubmissions}
	<p>
            <h3>{translate key="author.submit.startHere"}</h3>
		<a href="{url page="author" op="submit" requiresAuthor=1}" class="action btn btn-primary">{translate key="author.submit.startHereLink"}</a>
	</p>
{else}
	<p>
		{$notAcceptingSubmissionsMessage}
	</p>
{/if}
</div>

</div>
{include file="common/footer.tpl"}
