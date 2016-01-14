{**
 * view.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display a help topic.
 *
 *}
{strip}
{include file="help/header.tpl"}
{/strip}

<div id="sidebar">
	{include file="help/toc.tpl"}
</div>

<div id="main">

	<h4>{$applicationHelpTranslated}</h4>

	<div class="thickSeparator"></div>

	<ol id="breadcrumb" class="breadcrumb">
		{if $topic->getId() == "index/topic/000000"}
                    <li class="active"><a href="{get_help_id key="index.index" url="true"}" class="current">{translate key="navigation.home"}</a></li>
		{else}
                    </li>
			<a href="{get_help_id key="index.index" url="true"}">{translate key="navigation.home"}</a>
                    </li>
			{foreach name=breadcrumbs from=$breadcrumbs item=breadcrumb key=key}
				{if $breadcrumb != $topic->getId()}
                                    <li>
                                        <a href="{url op="view" path=$breadcrumb|explode:"/"}">{$key|escape}</a>
                                    </li>
				{/if}
			{/foreach}
                        <li class="active"><a href="{url op="view" path=$topic->getId()|explode:"/"}" class="current">{$topic->getTitle()}</a></li>
		{/if}
	</div>

	<h2>{$topic->getTitle()}</h2>

	<div id="content">
		<div id="helpTopic">{include file="help/topic.tpl"}</div>
	</div>

</div>

{include file="help/footer.tpl"}
