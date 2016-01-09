<?php /* Smarty version 2.6.26, created on 2016-01-06 08:14:55
         compiled from manager/schedConfSetup/step1.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'manager/schedConfSetup/step1.tpl', 14, false),array('function', 'fieldLabel', 'manager/schedConfSetup/step1.tpl', 21, false),array('function', 'form_language_chooser', 'manager/schedConfSetup/step1.tpl', 24, false),array('function', 'translate', 'manager/schedConfSetup/step1.tpl', 25, false),array('function', 'html_options', 'manager/schedConfSetup/step1.tpl', 64, false),array('modifier', 'assign', 'manager/schedConfSetup/step1.tpl', 23, false),array('modifier', 'escape', 'manager/schedConfSetup/step1.tpl', 36, false),)), $this); ?>
<?php $this->assign('pageTitle', "manager.schedConfSetup.details.title"); ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "manager/schedConfSetup/setupHeader.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<form name="setupForm" method="post" action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'saveSchedConfSetup','path' => '1'), $this);?>
">
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/formErrors.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<?php if (count ( $this->_tpl_vars['formLocales'] ) > 1): ?>
<div id="locales">
<table width="100%" class="data">
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'formLocale','key' => "form.formLanguage"), $this);?>
</td>
		<td width="80%" class="value">
			<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'schedConfSetup','path' => '1','escape' => false), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'setupFormUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'setupFormUrl'));?>

			<?php echo $this->_plugins['function']['form_language_chooser'][0][0]->smartyFormLanguageChooser(array('form' => 'setupForm','url' => $this->_tpl_vars['setupFormUrl']), $this);?>

			<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "form.formLanguage.description"), $this);?>
</span>
		</td>
	</tr>
</table>
</div>
<?php endif; ?>
<div id="description">
<h3>1.1 <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details.description"), $this);?>
</h3>

<p><label for="introduction"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details.introduction.description"), $this);?>
</label></p>

<p><textarea name="introduction[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="introduction" rows="10" cols="60" class="textArea"><?php echo ((is_array($_tmp=$this->_tpl_vars['introduction'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea></p>

<p><label for="overview"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details.overview.description"), $this);?>
</label></p>

<p><textarea name="overview[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="overview" rows="10" cols="60" class="textArea"><?php echo ((is_array($_tmp=$this->_tpl_vars['overview'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea></p>
</div>
<div class="separator"></div>
<div id="location">
<h3>1.2 <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details.location"), $this);?>
</h3>

<table width="100%" class="data">
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'locationName','key' => "manager.schedConfSetup.details.location.nameOf"), $this);?>
</td>
		<td width="80%" class="value"><input type="text" name="locationName" id="locationName" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['locationName'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="30" maxlength="60" class="textField" /></td>
	</tr>
	<tr valign="top">
		<td class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'locationAddress','key' => "common.mailingAddress"), $this);?>
</td>
		<td class="value"><textarea name="locationAddress" id="locationAddress" rows="3" cols="40" class="textArea"><?php echo ((is_array($_tmp=$this->_tpl_vars['locationAddress'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea></td>
	</tr>
	<tr valign="top">
		<td class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'locationCity','key' => "manager.schedConfSetup.details.location.city"), $this);?>
</td>
		<td width="80%" class="value"><input type="text" name="locationCity" id="locationCity" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['locationCity'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="30" maxlength="60" class="textField" /></td>
	</tr>
	<tr valign="top">
		<td class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'locationCountry','key' => "common.country"), $this);?>
</td>
		<td class="value">
			<select name="locationCountry" id="locationCountry" class="selectMenu">
				<option value=""></option>
				<?php echo smarty_function_html_options(array('options' => $this->_tpl_vars['countries'],'selected' => $this->_tpl_vars['locationCountry']), $this);?>

			</select>
		</td>
	</tr>
</table>
</div>
<div class="separator"></div>
<div id="principalContact">
<h3>1.3 <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details.principalContact"), $this);?>
</h3>

<table width="100%" class="data">
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'contactName','key' => "user.name",'required' => 'true'), $this);?>
</td>
		<td width="80%" class="value"><input type="text" name="contactName" id="contactName" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['contactName'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="30" maxlength="60" class="textField" /></td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'contactTitle','key' => "user.title"), $this);?>
</td>
		<td width="80%" class="value"><input type="text" name="contactTitle" id="contactTitle" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['contactTitle'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="30" maxlength="90" class="textField" /></td>
	</tr>	
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'contactAffiliation','key' => "user.affiliation"), $this);?>
</td>
		<td width="80%" class="value"><textarea name="contactAffiliation[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="contactAffiliation" rows="5" cols="40" class="textArea"><?php echo ((is_array($_tmp=$this->_tpl_vars['contactAffiliation'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea></td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'contactEmail','key' => "user.email",'required' => 'true'), $this);?>
</td>
		<td width="80%" class="value"><input type="text" name="contactEmail" id="contactEmail" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['contactEmail'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="30" maxlength="90" class="textField" /></td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'contactPhone','key' => "user.phone"), $this);?>
</td>
		<td width="80%" class="value"><input type="text" name="contactPhone" id="contactPhone" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['contactPhone'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="15" maxlength="24" class="textField" /></td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'contactFax','key' => "user.fax"), $this);?>
</td>
		<td width="80%" class="value"><input type="text" name="contactFax" id="contactFax" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['contactFax'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="15" maxlength="24" class="textField" /></td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'contactMailingAddress','key' => "common.mailingAddress"), $this);?>
</td>
		<td width="80%" class="value"><textarea name="contactMailingAddress" id="contactMailingAddress" rows="3" cols="40" class="textArea"><?php echo ((is_array($_tmp=$this->_tpl_vars['contactMailingAddress'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea></td>
	</tr>
</table>
</div>
<div class="separator"></div>
<div id="technicalSupportContact">
<h3>1.4 <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details.technicalSupportContact"), $this);?>
</h3>

<p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details.technicalSupportContact.description"), $this);?>
</p>

<table width="100%" class="data">
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'supportName','key' => "user.name",'required' => 'true'), $this);?>
</td>
		<td width="80%" class="value"><input type="text" name="supportName" id="supportName" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['supportName'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="30" maxlength="60" class="textField" /></td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'supportEmail','key' => "user.email",'required' => 'true'), $this);?>
</td>
		<td width="80%" class="value"><input type="text" name="supportEmail" id="supportEmail" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['supportEmail'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="30" maxlength="90" class="textField" /></td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'supportPhone','key' => "user.phone"), $this);?>
</td>
		<td width="80%" class="value"><input type="text" name="supportPhone" id="supportPhone" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['supportPhone'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="15" maxlength="24" class="textField" /></td>
	</tr>
</table>
</div>
<div class="separator"></div>
<div id="emails">
<h3>1.5 <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details.emails"), $this);?>
</h3>
<table width="100%" class="data">
	<tr valign="top"><td colspan="2"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details.emailSignature.description"), $this);?>
<br />&nbsp;</td></tr>
	<tr valign="top">
		<td class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'emailSignature','key' => "manager.schedConfSetup.details.emailSignature"), $this);?>
</td>
		<td class="value">
			<textarea name="emailSignature[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="emailSignature" rows="3" cols="60" class="textArea"><?php echo ((is_array($_tmp=$this->_tpl_vars['emailSignature'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea>
		</td>
	</tr>
	<tr valign="top"><td colspan="2">&nbsp;</td></tr>
	<tr valign="top"><td colspan="2"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details.emailBounceAddress.description"), $this);?>
<br />&nbsp;</td></tr>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'envelopeSender','key' => "manager.schedConfSetup.details.emailBounceAddress"), $this);?>
</td>
		<td width="80%" class="value">
			<input type="text" name="envelopeSender" id="envelopeSender" size="40" maxlength="255" class="textField" <?php if (! $this->_tpl_vars['envelopeSenderEnabled']): ?>disabled="disabled" value=""<?php else: ?>value="<?php echo ((is_array($_tmp=$this->_tpl_vars['envelopeSender'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
"<?php endif; ?> />
			<?php if (! $this->_tpl_vars['envelopeSenderEnabled']): ?>
			<br />
			<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details.emailBounceAddressDisabled"), $this);?>
</span>
			<?php endif; ?>
		</td>
	</tr>
</table>
</div>

<div class="separator"></div>
<div id="sponsors">
<h3>1.6 <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details.sponsors"), $this);?>
</h3>

<p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details.sponsors.description"), $this);?>
</p>

<table width="100%" class="data">
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'sponsorNote','key' => "manager.schedConfSetup.details.note"), $this);?>
</td>
		<td width="80%" class="value">
			<textarea name="sponsorNote[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="sponsorNote" rows="5" cols="40" class="textArea"><?php echo ((is_array($_tmp=$this->_tpl_vars['sponsorNote'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea>
			<br/>
			<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details.sponsors.noteDescription"), $this);?>
</span>
		</td>
	</tr>
<?php $_from = $this->_tpl_vars['sponsors']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['sponsors'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['sponsors']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['sponsorId'] => $this->_tpl_vars['sponsor']):
        $this->_foreach['sponsors']['iteration']++;
?>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "sponsors-".($this->_tpl_vars['sponsorId'])."-institution",'key' => "manager.schedConfSetup.details.institution"), $this);?>
</td>
		<td width="80%" class="value">
			<input type="text" name="sponsors[<?php echo ((is_array($_tmp=$this->_tpl_vars['sponsorId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][institution]" id="sponsors-<?php echo ((is_array($_tmp=$this->_tpl_vars['sponsorId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-institution" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['sponsor']['institution'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="90" class="textField" />
			<?php if ($this->_foreach['sponsors']['total'] > 1): ?>
				<input type="submit" name="delSponsor[<?php echo ((is_array($_tmp=$this->_tpl_vars['sponsorId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.delete"), $this);?>
" class="button" />
			<?php endif; ?>
		</td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "sponsors-".($this->_tpl_vars['sponsorId'])."-address",'key' => "common.mailingAddress"), $this);?>
</td>
		<td width="80%" class="value">
			<textarea name="sponsors[<?php echo ((is_array($_tmp=$this->_tpl_vars['sponsorId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][address]" id="sponsors-<?php echo ((is_array($_tmp=$this->_tpl_vars['sponsorId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-address" rows="4" cols="35" class="textArea"><?php echo ((is_array($_tmp=$this->_tpl_vars['sponsor']['address'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea>
		</td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "sponsors-".($this->_tpl_vars['sponsorId'])."-url",'key' => "common.url"), $this);?>
</td>
		<td width="80%" class="value"><input type="text" name="sponsors[<?php echo ((is_array($_tmp=$this->_tpl_vars['sponsorId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][url]" id="sponsors-<?php echo ((is_array($_tmp=$this->_tpl_vars['sponsorId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-url" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['sponsor']['url'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="255" class="textField" /></td>
	</tr>
	<?php if (! ($this->_foreach['sponsors']['iteration'] == $this->_foreach['sponsors']['total'])): ?>
	<tr valign="top">
		<td colspan="2" class="separator">&nbsp;</td>
	</tr>
	<?php endif; ?>
<?php endforeach; else: ?>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "sponsors-0-institution",'key' => "manager.schedConfSetup.details.institution"), $this);?>
</td>
		<td width="80%" class="value"><input type="text" name="sponsors[0][institution]" id="sponsors-0-institution" size="40" maxlength="90" class="textField" /></td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "sponsors-0-address",'key' => "common.mailingAddress"), $this);?>
</td>
		<td width="80%" class="value"><textarea name="sponsors[0][address]" id="sponsors-0-address" rows="4" cols="35" class="textArea"><?php echo ((is_array($_tmp=$this->_tpl_vars['sponsors'][0][$this->_sections['address']['index']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea>
		</td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "sponsors-0-url",'key' => "common.url"), $this);?>
</td>
		<td width="80%" class="value"><input type="text" name="sponsors[0][url]" id="sponsors-0-url" size="40" maxlength="255" class="textField" /></td>
	</tr>
<?php endif; unset($_from); ?>
</table>
</div>
<p><input type="submit" name="addSponsor" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details.addSponsor"), $this);?>
" class="button" /></p>

<div class="separator"></div>

<h3>1.7 <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details.contributors"), $this);?>
</h3>

<p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details.contributors.description"), $this);?>
</p>

<table width="100%" class="data">
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'contributorNote','key' => "manager.schedConfSetup.details.note"), $this);?>
</td>
		<td width="80%" class="value">
			<textarea name="contributorNote[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="contributorNote" rows="5" cols="40" class="textArea"><?php echo ((is_array($_tmp=$this->_tpl_vars['contributorNote'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea>
			<br/>
			<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details.contributors.noteDescription"), $this);?>
</span>
		</td>
	</tr>
<?php $_from = $this->_tpl_vars['contributors']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['contributors'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['contributors']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['contributorId'] => $this->_tpl_vars['contributor']):
        $this->_foreach['contributors']['iteration']++;
?>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "contributors-".($this->_tpl_vars['contributorId'])."-name",'key' => "manager.schedConfSetup.details.contributor"), $this);?>
</td>
		<td width="80%" class="value"><input type="text" name="contributors[<?php echo ((is_array($_tmp=$this->_tpl_vars['contributorId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][name]" id="contributors-<?php echo ((is_array($_tmp=$this->_tpl_vars['contributorId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-name" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['contributor']['name'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="90" class="textField" /><?php if ($this->_foreach['contributors']['total'] > 1): ?> <input type="submit" name="delContributor[<?php echo ((is_array($_tmp=$this->_tpl_vars['contributorId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.delete"), $this);?>
" class="button" /><?php endif; ?></td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "contributors-".($this->_tpl_vars['contributorId'])."-url",'key' => "common.url"), $this);?>
</td>
		<td width="80%" class="value"><input type="text" name="contributors[<?php echo ((is_array($_tmp=$this->_tpl_vars['contributorId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
][url]" id="contributors-<?php echo ((is_array($_tmp=$this->_tpl_vars['contributorId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
-url" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['contributor']['url'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="255" class="textField" /></td>
	</tr>
	<?php if (! ($this->_foreach['contributors']['iteration'] == $this->_foreach['contributors']['total'])): ?>
	<tr valign="top">
		<td colspan="2" class="separator">&nbsp;</td>
	</tr>
	<?php endif; ?>
<?php endforeach; else: ?>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "contributors-0-name",'key' => "manager.schedConfSetup.details.contributor"), $this);?>
</td>
		<td width="80%" class="value"><input type="text" name="contributors[0][name]" id="contributors-0-name" size="40" maxlength="90" class="textField" /></td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "contributors-0-url",'key' => "common.url"), $this);?>
</td>
		<td width="80%" class="value"><input type="text" name="contributors[0][url]" id="contributors-0-url" size="40" maxlength="255" class="textField" /></td>
	</tr>
<?php endif; unset($_from); ?>
</table>

<p><input type="submit" name="addContributor" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details.addContributor"), $this);?>
" class="button" /></p>

<div class="separator"></div>

<p><input type="submit" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.saveAndContinue"), $this);?>
" class="button defaultButton" /> <input type="button" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.cancel"), $this);?>
" class="button" onclick="document.location.href='<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'schedConfSetup'), $this);?>
'" /></p>

<p><span class="formRequired"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.requiredField"), $this);?>
</span></p>

</form>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>