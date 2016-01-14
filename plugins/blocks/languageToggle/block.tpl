{**
 * block.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site sidebar menu -- language toggle.
 *
 * $Id$
 *}
{if $enableLanguageToggle}
<div class="block" id="sidebarLanguageToggle">
	<!-- <span class="blockTitle">{translate key="common.language"}</span> -->    
	<form action="#">
		<select {if $isPostRequest}disabled="disabled" {/if}size="1" name="locale" onchange="location.href={if $languageToggleNoUser}'{$currentUrl|escape}{if strstr($currentUrl, '?')}&amp;{else}?{/if}setLocale='+this.options[this.selectedIndex].value{else}('{url|escape:"javascript" page="user" op="setLocale" path="NEW_LOCALE" source=$smarty.server.REQUEST_URI}'.replace('NEW_LOCALE', this.options[this.selectedIndex].value)){/if}" 
                                           class="btn btn-default"
                                           style="width:100%;">
                    {html_options options=$languageToggleLocales selected=$currentLocale}
                </select>
	</form>
                   
        {if $isConferenceManager}
            <a class="edit-link" href="{url page="manager"}/languages" target="_blank">
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
            </a>
        {/if}
</div>
{/if}
