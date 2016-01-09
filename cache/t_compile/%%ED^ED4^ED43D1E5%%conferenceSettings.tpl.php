<?php /* Smarty version 2.6.26, created on 2016-01-06 08:12:11
         compiled from admin/conferenceSettings.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'admin/conferenceSettings.tpl', 18, false),array('function', 'translate', 'admin/conferenceSettings.tpl', 26, false),array('function', 'fieldLabel', 'admin/conferenceSettings.tpl', 32, false),array('function', 'form_language_chooser', 'admin/conferenceSettings.tpl', 35, false),array('modifier', 'escape', 'admin/conferenceSettings.tpl', 20, false),array('modifier', 'assign', 'admin/conferenceSettings.tpl', 34, false),)), $this); ?>
<?php echo ''; ?><?php $this->assign('pageTitle', "admin.conferences.conferenceSettings"); ?><?php echo ''; ?><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><?php echo ''; ?>


<br />
<div id="conferenceSettings">
<form name="conference" method="post" action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'updateConference'), $this);?>
">
<?php if ($this->_tpl_vars['conferenceId']): ?>
<input type="hidden" name="conferenceId" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['conferenceId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" />
<?php endif; ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/formErrors.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<?php if (! $this->_tpl_vars['conferenceId']): ?>
<p><span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "admin.conferences.createInstructions"), $this);?>
</span></p>
<?php endif; ?>

<table class="data" width="100%">
	<?php if (count ( $this->_tpl_vars['formLocales'] ) > 1): ?>
		<tr valign="top">
			<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'formLocale','key' => "form.formLanguage"), $this);?>
</td>
			<td width="80%" class="value">
				<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'editConference','path' => $this->_tpl_vars['conferenceId'],'escape' => false), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'settingsUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'settingsUrl'));?>

				<?php echo $this->_plugins['function']['form_language_chooser'][0][0]->smartyFormLanguageChooser(array('form' => 'conference','url' => $this->_tpl_vars['settingsUrl']), $this);?>

				<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "form.formLanguage.description"), $this);?>
</span>
			</td>
		</tr>
	<?php endif; ?>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'title','key' => "manager.setup.conferenceTitle",'required' => 'true'), $this);?>
</td>
		<td width="80%" class="value"><input type="text" id="title" name="title[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['title'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="120" class="textField" /></td>
	</tr>
	<tr valign="top">
		<td class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'description','key' => "admin.conferences.conferenceDescription"), $this);?>
</td>
		<td class="value">
			<textarea name="description[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="description" cols="40" rows="10" class="textArea"><?php echo ((is_array($_tmp=$this->_tpl_vars['description'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea>
			<br />
			<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "admin.conferences.conferenceDescriptionInstructions",'sampleUrl' => $this->_tpl_vars['sampleUrl']), $this);?>
</span>
		</td>
	</tr>
	<tr valign="top">
		<td class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'conferencePath','key' => "common.path",'required' => 'true'), $this);?>
</td>
		<td class="value">
			<input type="text" id="conferencePath" name="conferencePath" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['conferencePath'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="16" maxlength="32" class="textField" />
			<br />
			<?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.ellipsis"), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'sampleEllipsis') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'sampleEllipsis'));?>

			<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('conference' => 'path','schedConf' => ($this->_tpl_vars['sampleEllipsis'])), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'sampleUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'sampleUrl'));?>

			<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "admin.conferences.urlWillBe",'sampleUrl' => $this->_tpl_vars['sampleUrl']), $this);?>
</span>
		</td>
	</tr>
	<tr valign="top">
		<td colspan="2" class="label">
			<input type="checkbox" name="enabled" id="enabled" value="1"<?php if ($this->_tpl_vars['enabled']): ?> checked="checked"<?php endif; ?> /> <label for="enabled"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "admin.conferences.enableConferenceInstructions"), $this);?>
</label>
		</td>
	</tr>
	<tr valign="top">
		<td colspan="2" class="label">
			<input type="checkbox" name="scheduleConf" id="scheduleConf" value="1"<?php if ($this->_tpl_vars['scheduleConf']): ?> checked="checked"<?php endif; ?> /> <label for="scheduleConf"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "admin.conferences.scheduleConferenceInstructions"), $this);?>
</label>
		</td>
	</tr>
</table>

<p><input type="submit" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.save"), $this);?>
" class="button defaultButton" /> <input type="button" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.cancel"), $this);?>
" class="button" onclick="document.location.href='<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'conferences'), $this);?>
'" /></p>

</form>

<p><span class="formRequired"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.requiredField"), $this);?>
</span></p>
</div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>