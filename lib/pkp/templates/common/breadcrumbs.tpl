{**
 * breadcrumbs.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Breadcrumbs
 *
 *}
<ol id="breadcrumb" class="breadcrumb">
    {if $pageHierarchyRoot}
        {assign var="first" value=true}
            {$name}
        {foreach from=$pageHierarchy item=hierarchyLink}
            {if $first==false}
                <!-- &gt;-->
            {/if}
                <li>
                    <a href="{$hierarchyLink[0]|escape}" class="hierarchyLink">{if not $hierarchyLink[2]}{translate key=$hierarchyLink[1]}{else}{$hierarchyLink[1]|escape}{/if}</a>
                </li>
                {assign var="first" value=false}
	{/foreach}
    {else}
        <!--
        <li><a href="{url context=$homeContext page="index"}">{translate key="navigation.home"}</a></li>
        -->
	{foreach from=$pageHierarchy item=hierarchyLink}
            <li>
                <a href="{$hierarchyLink[0]|escape}" class="hierarchyLink">
                    {if not $hierarchyLink[2]}
                        {translate key=$hierarchyLink[1]}
                    {else}
                        {$hierarchyLink[1]|escape}
                    {/if}
                </a>
            </li>
	{/foreach}
	{* Disable linking to the current page if the request is a post (form) request. Otherwise following the link will lead to a form submission error. *}
        <li class="active">
	{if $requiresFormRequest}
            <sapn class="current">
        {else}
            <a href="{$currentUrl|escape}" class="current">{/if}
                {$pageCrumbTitleTranslated}
        {if $requiresFormRequest}
            </span>
        {else}
            </a>
        {/if}
        </li>
    {/if}
</ol>
