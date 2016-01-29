{**
 * step4.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Step 4 of author paper submission.
 *
 * $Id$
 *}
{if $showAbstractSteps && $currentSchedConf->getSetting('acceptSupplementaryReviewMaterials') && !$showPaperSteps}
	{assign var="pageTitle" value="author.submit.step4AbstOnly"}
{elseif $showAbstractSteps && $currentSchedConf->getSetting('acceptSupplementaryReviewMaterials')}
	{assign var="pageTitle" value="author.submit.step4"}
{else}
	{assign var="pageTitle" value="author.submit.step4"}
{/if}
{include file="author/submit/submitHeader.tpl"}

<script type="text/javascript">
{literal}
<!--
function confirmForgottenUpload() {
	var fieldValue = document.submitForm.uploadSuppFile.value;
	if (fieldValue) {
		return confirm("{/literal}{translate key="author.submit.forgottenSubmitSuppFile"}{literal}");
	}
	return true;
}
// -->
{/literal}
</script>


<form name="submitForm" method="post" action="{url op="saveSubmit" path=$submitStep}" enctype="multipart/form-data">
<input type="hidden" name="paperId" value="{$paperId|escape}" />
{include file="common/formErrors.tpl"}


<div>
{if $isConferenceManager}
    <a class="edit-link" href="{url page="manager"}/schedConfSetup/2#addSuppFileMessageTr" target="_blank">
        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
    </a>
{/if}
{if $addSuppFileMessage}
    {$addSuppFileMessage}
{else}
    <p>{translate key="author.submit.supplementaryFilesInstructions"}</p>
{/if}
</div>

<table class="listing" width="100%">
<tr>
	<td colspan="5" class="headseparator">&nbsp;</td>
</tr>
<tr class="heading" valign="bottom">
	<td>{translate key="common.id"}</td>
	<td>{translate key="common.title"}</td>
	<td>{translate key="common.originalFileName"}</td>
	<td class="nowrap">{translate key="common.dateUploaded"}</td>
	<td align="right">{translate key="common.action"}</td>
</tr>
<tr>
	<td colspan="6" class="headseparator">&nbsp;</td>
</tr>
{foreach from=$suppFiles item=file}
<tr valign="top">
	<td>{$file->getSuppFileId()}</td>
	<td>{$file->getSuppFileTitle()|escape}</td>
	<td>{$file->getOriginalFileName()|escape}</td>
	<td>{$file->getDateSubmitted()|date_format:$dateFormatTrunc}</td>
	<td align="right">
            <!--
            <a href="{url op="submitSuppFile" path=$file->getSuppFileId() paperId=$paperId}" class="action">{translate key="common.edit"}</a>
            &nbsp;|&nbsp;
            -->
            <a href="{url op="deleteSubmitSuppFile" path=$file->getSuppFileId() paperId=$paperId}" onclick="return confirm('{translate|escape:"jsparam" key="author.submit.confirmDeleteSuppFile"}')" class="action">{translate key="common.delete"}</a>
        </td>
</tr>
{foreachelse}
<tr valign="top">
	<td colspan="6" class="nodata">{translate key="author.submit.noSupplementaryFiles"}</td>
</tr>
{/foreach}
</table>

<div class="separator"></div>

<table class="data" width="100%">
<tr>
	<td width="30%" class="label">{fieldLabel name="uploadSuppFile" key="author.submit.uploadSuppFile"}</td>
	<td width="70%" class="value">
            <input type="file" name="uploadSuppFile" id="uploadSuppFile"  class="uploadField" /> 
            <!--<input name="submitUploadSuppFile" type="submit" class="button" value="{translate key="common.upload"}" />-->
        </td>
</tr>
</table>

<div class="separator"></div>

<p class="text-center">
    
    {if $suppFiles}
        <input type="submit" onclick="return confirmForgottenUpload()" value="{translate key="common.saveAndContinue"}" class="btn btn-primary" /> 
        <input name="submitUploadSuppFile" type="submit"  
           class="btn btn-default" class="button" value="{translate key="common.uploadOtherFile"}" />
    {else}
        <input name="submitUploadSuppFile" type="submit"  
           class="btn btn-primary" class="button" value="{translate key="common.upload"}" />
    {/if}
        
    <input type="button" value="{translate key="common.cancel"}" class="btn btn-default" onclick="confirmAction('{url page="author"}', '{translate|escape:"jsparam" key="author.submit.cancelSubmission"}')" />
</p>

</form>

{include file="common/footer.tpl"}
