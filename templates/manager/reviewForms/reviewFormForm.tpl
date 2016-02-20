{**
 * reviewFormForm.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Form to create/modify a review form.
 *
 *}
{include file="common/header.tpl"}

<!--
{if $reviewFormId}
	<ul class="nav nav-tabs">
		<li class="current active"><a href="{url op="editReviewForm" path=$reviewFormId}">{translate key="manager.reviewForms.edit"}</a></li>
		<li><a href="{url op="reviewFormElements" path=$reviewFormId}">{translate key="manager.reviewFormElements"}</a></li>
		<li><a href="{url op="previewReviewForm" path=$reviewFormId}">{translate key="manager.reviewForms.preview"}</a></li>
	</ul>
{/if}
-->

<br/>

<form name="reviewFormForm" method="post" action="{url op="updateReviewForm"}">
{if $reviewFormId}
	<input type="hidden" name="reviewFormId" value="{$reviewFormId}"/>
{/if}

{include file="common/formErrors.tpl"}

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

<table class="data" width="100%">
{if $supportedLocales|@count > 1}
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="formLocale" key="form.formLanguage"}</td>
		<td width="80%" class="value">
			{if $reviewFormId}{url|assign:"reviewFormFormUrl" op="editReviewForm" path=$reviewFormId escape=false}
			{else}{url|assign:"reviewFormFormUrl" op="createReviewForm"}
			{/if}
			{form_language_chooser form="reviewFormForm" url=$reviewFormFormUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>
		</td>
	</tr>
{/if}
<tr valign="top">
	<td width="20%" class="label">{fieldLabel name="title" required="true" key="manager.reviewForms.title"}</td>
	<td width="80%" class="value"><input type="text" name="title[{$formLocale|escape}]" value="{$title[$formLocale]|escape}" id="title" size="40" maxlength="120" class="textField" /></td>
</tr>
<tr valign="top">
	<td class="label">
            {*fieldLabel name="description" key="manager.reviewForms.description"*}
            {fieldLabel name="description" key="submission.comments.forAuthorDirector"}
            
        </td>
	<td class="value"><textarea name="description[{$formLocale|escape}]" rows="4" cols="40" id="description" class="textArea">{$description[$formLocale]|escape}</textarea></td>
</tr>
<tr valign="top">
	<td class="label">
            {*fieldLabel name="description" key="manager.reviewForms.description"*}
            {fieldLabel name="templateForDirector" key="submission.comments.forDirector"}
        </td>
	<td class="value">
            <textarea name="templateForDirector[{$formLocale|escape}]" rows="4" cols="40" id="templateForDirector" class="textArea">{$templateForDirector[$formLocale]|escape}</textarea>
        </td>
</tr>
<tr valign="top">
	<td class="label">
            {*fieldLabel name="description" key="manager.reviewForms.description"*}
            {fieldLabel name="templateSurvey" key="submission.comments.survey"}
            <br />
            <a href="https://github.com/pulipulichen/ocs/blob/master/lib/jquery-survey/survey-example_20160219.json" target="_blank">{translate key="manager.reviewForms.description"}</a>
        </td>
	<td class="value">
            <textarea name="templateSurvey[{$formLocale|escape}]" rows="4" cols="40" id="templateSurvey" class="textArea">{$templateSurvey[$formLocale]|escape}</textarea>
        </td>
</tr>
</table>

<p class="text-center" style="margin-top: 15px;">
    <input type="submit" value="{translate key="common.save"}" class="btn btn-primary" /> 
    <!--input type="button" value="{translate key="common.cancel"}" class="btn btn-default" onclick="document.location.href='{url op="reviewForms"}'" /-->
    <input type="button" value="{translate key="common.cancel"}" class="btn btn-default" onclick="history.go(-1)" />
</p>
{if $source}
    <input type="hidden" name="source" value="{$source}" />
{/if}
</form>

{include file="common/footer.tpl"}
