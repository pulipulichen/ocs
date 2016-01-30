{**
 * userRegistrationForm.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Attendee self-registration page.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="schedConf.registration"}
{include file="common/header.tpl"}
{/strip}

{if $isRegistered}
    {assign var="action" value="updateRegistration"}
{else} 
    {assign var="action" value="register"}
{/if}
<form action="{url op=$action}" name="registration" method="post">
<input type="hidden" name="registrationTypeId" value="{$registrationTypeId|escape}" />

{include file="common/formErrors.tpl"}

{if $supportedLocales|@count > 1 && !$existingUser}
<div id="locales">
<table class="data" width="100%">
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="formLocale" key="form.formLanguage"}</td>
		<td width="80%" class="value">
			{url|assign:"registerUrl" op="registration" escape=false}
			{form_language_chooser form="registration" url=$registerUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>
		</td>
	</tr>
</table>
</div>
{/if}

{if $isRegistered}
<div class="alert alert-info" role="alert">
  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
  {if $message}
      {translate key=$message}
  {/if}
</div>
{/if}

{assign var="registrationAdditionalInformation" value=$schedConf->getLocalizedSetting('registrationAdditionalInformation')}
{if $registrationAdditionalInformation}
<div id="registrationAdditionalInformation">
{if $isConferenceManager}
    <a class="edit-link" href="{url page="manager" }/registrationPolicies#registrationAdditionalInformationInfo" target="_blank">
        {*http://iccisc.dlll.nccu.edu.tw/ocs/index.php/iccisc/2016/manager/registrationTypes?clearPageContext=1*}
        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
    </a>
{/if}
	<h3>{translate key="manager.registrationPolicies.registrationAdditionalInformation"}</h3>

	<p>{$registrationAdditionalInformation|nl2br}</p>
</div>
	<div class="separator"></div>
{/if}

{if $registrationOptionCosts[$optionId] === 0}
<div id="conferenceFees">
<h3>{translate key="schedConf.registration.conferenceFees"}</h3>

{if !$registrationOptions->wasEmpty()}
<table class="listing" width="100%">
	<tr>
		<td colspan="2" class="headseparator">&nbsp;</td>
	</tr>
	<tr valign="top" class="heading">
		<td>{translate key="schedConf.registration.options"}</td>
		<td>{translate key="schedConf.registration.cost"}</td>
	</tr>
	<tr>
		<td colspan="2" class="headseparator">&nbsp;</td>
	</tr>
	{iterate from=registrationOptions item=registrationOption}
	{assign var=optionId value=$registrationOption->getOptionId()}
	{if $registrationOption->getPublic()}
		<tr valign="top">
			<td class="label">
				<strong>{$registrationOption->getRegistrationOptionName()|escape}</strong>
			</td>
			<td class="data">
				{if strtotime($registrationOption->getOpeningDate()) < time() && strtotime($registrationOption->getClosingDate()) > time()}
					<input id="registrationOption-{$optionId|escape}" type="checkbox" name="registrationOptionId[]" {if in_array($optionId, (array) $registrationOptionId)}checked="checked" {/if} value="{$optionId|escape}" />
					<label for="registrationOption-{$optionId|escape}">{$registrationOptionCosts[$optionId]|string_format:"%.2f"|escape} {$registrationType->getCurrencyCodeAlpha()|escape}</label>
					{translate key="schedConf.registration.optionCloses" closingDate=$registrationOption->getClosingDate()|date_format:$dateFormatShort}
				{elseif strtotime($registrationOption->getOpeningDate()) > time()}
					<input type="checkbox" name="registrationOptionId[]" value="{$optionId|escape}" disabled="disabled" />
					{$registrationOptionCosts[$optionId]|string_format:"%.2f"|escape} {$registrationType->getCurrencyCodeAlpha()|escape}
					{translate key="schedConf.registration.optionFuture" openingDate=$registrationOption->getOpeningDate()|date_format:$dateFormatShort}
				{else}
					<input type="checkbox" name="registrationOptionId[]" value="{$optionId|escape}" disabled="disabled" />
					{$registrationOptionCosts[$optionId]|string_format:"%.2f"|escape} {$registrationType->getCurrencyCodeAlpha()|escape}
					{translate key="schedConf.registration.optionClosed" closingDate=$registrationOption->getClosingDate()|date_format:$dateFormatShort}
				{/if}
			</td>
		</tr>
		{if $registrationOption->getRegistrationOptionDescription()}
			<tr valign="top">
				<td colspan="2">{$registrationOption->getRegistrationOptionDescription()|nl2br}</td>
			</tr>
		{/if}
		<tr valign="top">
			<td colspan="2">&nbsp;</td>
		</tr>
	{/if}
	{/iterate}
	{if $registrationOptions->wasEmpty()}
		<tr>
			<td colspan="2" class="nodata">{translate key="schedConf.registrationOptions.noneAvailable"}</td>
		</tr>
	{/if}
	<tr>
		<td colspan="2" class="endseparator">&nbsp;</td>
	</tr>
</table>
{/if}
<p>
	<label for="feeCode">{translate key="schedConf.registration.feeCode"}</label>&nbsp;&nbsp;<input id="feeCode" name="feeCode" type="text" value="{$feeCode|escape}" class="textField" /><br />
	{translate key="schedConf.registration.feeCode.description"}
</p>
</div>
<div class="separator"></div>
{/if}
<div id="account">
<h3>{translate key="schedConf.registration.account"}</h3>
{if $userLoggedIn}
	{url|assign:"logoutUrl" page="login" op="signOut" source=$requestUri}
	{url|assign:"profileUrl" page="user" op="profile"}
	<p>{translate key="schedConf.registration.loggedInAs" logoutUrl=$logoutUrl profileUrl=$profileUrl}</p>

	<table class="data" width="100%">
		<tr valign="top">
			<td width="20%" class="label">{translate key="user.name"}</td>
			<td width="80%" class="value">{$user->getFullName()|escape}</td>
		</tr>
		<tr valign="top">
			<td class="label">{translate key="user.email"}</td>
			<td class="value">{$user->getEmail()|escape}</td>
		</tr>
                <!--
		<tr valign="top">
			<td class="label">{translate key="user.phone"}</td>
			<td class="value">{$user->getPhone()|escape}</td>
		</tr>
		<tr valign="top">
			<td class="label">{translate key="user.fax"}</td>
			<td class="value">{$user->getFax()|escape}</td>
		</tr>
		<tr valign="top">
			<td class="label">{translate key="common.mailingAddress"}</td>
			<td class="value">{$user->getMailingAddress()|strip_unsafe_html|nl2br}</td>
		</tr>
                -->
	</table>
{else}
	{url|assign:"loginUrl" page="login" op="index" source=$requestUri}
	<p>{translate key="schedConf.registration.createAccount.description" loginUrl=$loginUrl}</p>

  
        
	<table class="data" width="100%">
            
      
<tr valign="top">
	<td class="label">{fieldLabel name="firstName" required="true" key="user.firstName"}</td>
	<td class="value"><input type="text" id="firstName" name="firstName" value="{$firstName|escape}" size="20" maxlength="40" class="textField" /></td>
</tr>

<tr valign="top">
	<td class="label">{fieldLabel name="email" required="true" key="user.email"}</td>
	<td class="value">
            <input type="text" id="email" name="email" value="{$email|escape}" size="30" maxlength="90" class="textField" 
                   onchange="PULI_HELPERS.emailConvertToField(this, ['username']);PULI_HELPERS.emailToField(this, ['password', 'password2']);" />
        </td>
</tr>
            
        <tr valign="top"  class="hide">	
			<td width="20%" class="label">{fieldLabel name="username" required="true" key="user.username"}</td>
			<td width="80%" class="value"><input type="text" name="username" value="{$username|escape}" id="username" size="20" maxlength="32" class="textField" /></td>
	</tr>

<tr valign="top">
	<td class="label">{fieldLabel name="affiliation" key="user.affiliation" required="true"}</td>
	<td class="value"><textarea id="affiliation" name="affiliation" rows="5" cols="40" class="textArea">{$affiliation|escape}</textarea></td>
</tr>

        <tr valign="top" class="hide">
		<td class="label">{fieldLabel name="password" required="true" key="user.password"}</td>
		<td class="value">
                    <input type="password" name="password" value="{$password|escape}" id="password" size="20" maxlength="32" class="textField" /> 
                    {translate key="user.account.passwordLengthRestriction" length=$minPasswordLength}
                </td>
	</tr>

        <tr valign="top" class="hide">
		<td class="label">{fieldLabel name="password2" required="true" key="user.account.repeatPassword"}</td>
		<td class="value"><input type="password" name="password2" id="password2" value="{$password2|escape}" size="20" maxlength="32" class="textField" /></td>
	</tr>

{if $captchaEnabled}
		<tr>
			<td class="label" valign="top">{fieldLabel name="captcha" required="true" key="common.captchaField"}</td>
			<td class="value">
			<img src="{url page="user" op="viewCaptcha" path=$captchaId}" alt="{translate key="common.captchaField.altText"}" /><br />
			<span class="instruct">{translate key="common.captchaField.description"}</span><br />
			<input name="captcha" id="captcha" value="" size="20" maxlength="32" class="textField" />
			<input type="hidden" name="captchaId" value="{$captchaId|escape:"quoted"}" />
		</td>
	</tr>
{/if}

<tr valign="top" class="hide">
	<td class="label">{fieldLabel name="salutation" key="user.salutation"}</td>
	<td class="value"><input type="text" name="salutation" id="salutation" value="{$salutation|escape}" size="20" maxlength="40" class="textField" /></td>
</tr>

	
<tr valign="top" class="hide">
	<td class="label">{fieldLabel name="middleName" key="user.middleName"}</td>
	<td class="value"><input type="text" id="middleName" name="middleName" value="{$middleName|escape}" size="20" maxlength="40" class="textField" /></td>
</tr>
	
<tr valign="top" class="hide">
	<td class="label">{fieldLabel name="lastName" required="true" key="user.lastName"}</td>
	<td class="value"><input type="text" id="lastName" name="lastName" value="{$lastName|escape}" size="20" maxlength="90" class="textField" /></td>
</tr>

<tr valign="top" class="hide">
	<td class="label">{fieldLabel name="initials" key="user.initials"}</td>
	<td class="value"><input type="text" id="initials" name="initials" value="{$initials|escape}" size="5" maxlength="5" class="textField" />&nbsp;&nbsp;{translate key="user.initialsExample"}</td>
</tr>
	

<tr valign="top" class="hide">
	<td class="label">{fieldLabel name="signature" key="user.signature"}</td>
	<td class="value"><textarea name="signature[{$formLocale|escape}]" id="signature" rows="5" cols="40" class="textArea">{$signature[$formLocale]|escape}</textarea></td>
</tr>

<tr valign="top" class="hide">
	<td class="label">{fieldLabel name="userUrl" key="user.url"}</td>
	<td class="value"><input type="text" id="userUrl" name="userUrl" value="{$userUrl|escape}" size="30" maxlength="90" class="textField" /></td>
</tr>
	
<tr valign="top" class="hide">
	<td class="label">{fieldLabel name="phone" key="user.phone"}</td>
	<td class="value"><input type="text" name="phone" id="phone" value="{$phone|escape}" size="15" maxlength="24" class="textField" /></td>
</tr>
	
<tr valign="top" class="hide">
	<td class="label">{fieldLabel name="fax" key="user.fax"}</td>
	<td class="value"><input type="text" name="fax" id="fax" value="{$fax|escape}" size="15" maxlength="24" class="textField" /></td>
</tr>
	
<tr valign="top" class="hide">
	<td class="label">{fieldLabel name="mailingAddress" required="true" key="common.mailingAddress"}</td>
	<td class="value"><textarea name="mailingAddress" id="mailingAddress" rows="3" cols="40" class="textArea">{$mailingAddress|escape}</textarea></td>
</tr>
	
<tr valign="top" class="hide">
	<td class="label">{fieldLabel name="country" required="true" key="common.country"}</td>
	<td class="value">
		<select name="country" id="country" class="selectMenu">
			<option value=""></option>
			{html_options options=$countries selected=$country}
		</select>
	</td>
</tr>

<tr valign="top" class="hide">
	<td class="label">{fieldLabel name="biography" key="user.biography"}<br />{translate key="user.biography.description"}</td>
	<td class="value"><textarea name="biography[{$formLocale|escape}]" id="biography" rows="5" cols="40" class="textArea">{$biography[$formLocale]|escape}</textarea></td>
</tr>

</table>

{/if}{* user is logged in *}
</div>

<!--------------------->

{if $applicationFormDefault}
<div class="separator"></div>
<div id="applicationFormDiv">
{if $isConferenceManager}
    <a class="edit-link" href="{url page="manager" }/editRegistrationType/{$registrationTypeId|escape}#applicationForm" target="_blank">
        {*http://iccisc.dlll.nccu.edu.tw/ocs/index.php/iccisc/2016/manager/registrationTypes?clearPageContext=1*}
        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
    </a>
{/if}
<h3>
    {* @TODO *}
    {*translate key="schedConf.registration.specialRequests"*}
    報名表
</h3>

<p><textarea name="applicationForm" id="applicationForm" cols="60" rows="10" class="textArea">{$applicationForm|escape}</textarea></p>
</div>
{/if}

<!--------------------->

{if $surveyConfig}

<script type="text/javascript" src="{$baseUrl}/lib/jquery-survey/handlebars.js"></script>
<script type="text/javascript" src="{$baseUrl}/lib/jquery-survey/jQuery.Survey.js"></script>
<script type="text/javascript" src="{$baseUrl}/lib/jquery-survey/jquery.validate.js"></script>
    
<div class="separator"></div>
<div id="surveyDiv">
{if $isConferenceManager}
    <a class="edit-link" href="{url page="manager" }/editRegistrationType/{$registrationTypeId|escape}#survey" target="_blank">
        {*http://iccisc.dlll.nccu.edu.tw/ocs/index.php/iccisc/2016/manager/registrationTypes?clearPageContext=1*}
        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
    </a>
{/if}
<h3>
    {* @TODO *}
    {*translate key="schedConf.registration.specialRequests"*}
    問卷調查
</h3>

<fieldset id="surveyDisplay"></fieldset>
    <!--span class="loading glyphicon glyphicon-refresh glyphicon-refresh-animate"></span-->

<p><textarea name="survey" id="survey" cols="60" rows="10" class="hide">{$survey}</textarea></p>

{if !$survey}
    {assign var="survey" value="null"}
{/if}

<script language="javascript" type="text/javascript">
var survey = {literal}{{/literal}
    pages: [{literal}{{/literal} 
        elements: {$surveyConfig}
    {literal}}]{/literal}
{literal}}{/literal};
var data = {$survey};

{literal}

    $('#surveyDisplay').survey({
        survey: survey,
        data: data,
        init: function(target){
            target.closest('form').validate({
              errorPlacement: function(error, element){
                var p = element;
                while(p && (!p.hasClass('input'))){
                  p = p.parent();
                }
                error.appendTo(p||element);
              },
              wrapper: 'div'
            });
          },
          afterChange: function () {
            var target = this;
            var _changeCallback = function () {
                
                var data = $('#surveyDisplay').serializeArray().reduce(function(obj, item) {
                    var _name = item.name;
                    //console.log(_name.substr(_name.length-2, 2));
                    if (_name.substr(_name.length-2, 2) === "[]") {
                        _name = _name.substr(0, _name.length-2);
                    } 
                    if (typeof(obj[_name]) !== "undefined") {
                        if (typeof(obj[_name]['push']) !== "function") {
                            obj[_name] = [obj[_name], item.value];
                        }
                        else {
                            //console.log(typeof(obj[_name]));
                            obj[_name].push(item.value);
                        }
                    }
                    else {
                        obj[_name] = item.value;
                    }
                    return obj;
                }, {});
                //var survey = $.survey($('#surveyDisplay').clone(true).wrap("<form></form>"));
                //var data = survey.pageData();
                //var surveyData = survey.data();
                //survey.updateData(data);
                $("#survey").val(JSON.stringify(data));
            };
            $('#surveyDisplay').find("input").change(_changeCallback);
            $('#surveyDisplay').find("textarea").change(_changeCallback);
          },
          beforeChange: function(from, to, next){
            var target = this;
            if(from === void 0){
              next();
            }else if(target.closest('form').valid()){
              var survey = $.survey(target);
              var data = survey.pageData();
              var surveyData = survey.data();
              survey.updateData(data);
              $("#survey_data").val(JSON.stringify(data));
              $("#survey_data").parents("form:first").submit();
            }
          }
    });
{/literal}
</script>

</div>
{/if}

<!--------------------->

<div class="separator"></div>
<div id="specialRequestsDiv">
<h3>{translate key="schedConf.registration.specialRequests"}</h3>

<p><label for="specialRequests">{translate key="schedConf.registration.specialRequests.description"}</label></p>

<p><textarea name="specialRequests" id="specialRequests" cols="60" rows="10" class="textArea">{$specialRequests|escape}</textarea></p>
</div>

<div class="separator"></div>

<p class="text-center" style="margin-top: 15px;">
    {if $isRegistered}
        {* @TODO 語系 *}
        <input type="hidden" name="update" value="1" />
        <input type="submit" 
               value="更新" 
               class="btn btn-primary"/>
        <a href="{url op="deleteRegistration"}" class="btn btn-default">
            取消報名
        </a>
    {else}
        <input type="checkbox" name="notifyEmail" id="notifyEmail" value="1" checked="checked" />
        <label for="notifyEmail">{translate key="manager.registration.form.notifyEmail"}</label> 
        
        <br />
        
        <input type="submit" 
               value="{translate key="schedConf.registration.register"}" 
               class="btn btn-primary"/>
    {/if}
</p>

{if $currentSchedConf->getSetting('registrationName')}
    
<div class="separator"></div>
    
<div id="registrationContact">
{if $isConferenceManager}
    <a class="edit-link" href="{url page="manager" }/registrationPolicies#registrationContact" target="_blank">
        {*http://iccisc.dlll.nccu.edu.tw/ocs/index.php/iccisc/2016/manager/registrationTypes?clearPageContext=1*}
        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
    </a>
{/if}

<h3>{translate key="manager.registrationPolicies.registrationContact"}</h3>

<table class="data" width="100%">
	<tr valign="top">
		<td width="20%" class="label">{translate key="user.name"}</td>
		<td width="80%" class="value">{$currentSchedConf->getSetting('registrationName')|escape}</td>
	</tr>
	{if $currentSchedConf->getSetting('registrationEmail')}<tr valign="top">
		<td class="label">{translate key="about.contact.email"}</td>
		<td class="value">{mailto address=$currentSchedConf->getSetting('registrationEmail')|escape encode="hex"}</td>
	</tr>{/if}
	{if $currentSchedConf->getSetting('registrationPhone')}<tr valign="top">
		<td class="label">{translate key="about.contact.phone"}</td>
		<td class="value">{$currentSchedConf->getSetting('registrationPhone')|escape}</td>
	</tr>{/if}
	{if $currentSchedConf->getSetting('registrationFax')}<tr valign="top">
		<td class="label">{translate key="about.contact.fax"}</td>
		<td class="value">{$currentSchedConf->getSetting('registrationFax')|escape}</td>
	</tr>{/if}
	{if $currentSchedConf->getSetting('registrationMailingAddress')}<tr valign="top">
		<td class="label">{translate key="common.mailingAddress"}</td>
		<td class="value">{$currentSchedConf->getSetting('registrationMailingAddress')|nl2br}</td>
	</tr>{/if}
</table>
</div>
<div class="separator"></div>
{/if}{* if displaying reg manager info *}


</form>

{include file="common/footer.tpl"}
