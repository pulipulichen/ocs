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

{literal}
<script language="javascript" type="text/javascript">
  function resizeIframe(obj) {
    obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
  }
</script>
{/literal}
{if $url|substr:0:4!="http"}
    <iframe style="width: 100%; height: 500px;" frameborder="0" src="{$url}"  scrolling="no" onload="resizeIframe(this)"></iframe>
{else}
    <iframe style="width: 100%; height: 500px;border:1px solid gray" frameborder="0" src="{$url}"  scrolling="yes"></iframe>
{/if}

{include file="common/footer.tpl"}
