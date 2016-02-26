{**
 * locationSettings.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Form to edit scheduled conference location settings.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="schedConf.location"}
{include file="common/header.tpl"}
{/strip}

{include file="common/formErrors.tpl"}

<form name="locationForm" method="post" action="{url op="saveLocationSettings"}" enctype="multipart/form-data">

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

<p>{translate key="manager.location.form.description"}</p>
<div id="locationText">
<h4>{translate key="manager.location.form.locationText"}</h4>
<p>{translate key="manager.location.form.locationText.description"}</p>

<textarea name="locationDescription[{$formLocale|escape}]" id="locationDescription" rows="5" cols="60" class="textArea">{$locationDescription[$formLocale]|escape}</textarea>

<div class="separator"></div>

<p class="text-center"><input type="submit" value="{translate key="common.save"}" class="btn btn-primary" /> <input type="button" value="{translate key="common.cancel"}" class="btn btn-default" onclick="document.location.href='{url page="manager"}'" /></p>
</div>
</form>

{include file="common/footer.tpl"}
