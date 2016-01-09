<?php /* Smarty version 2.6.26, created on 2016-01-06 08:13:23
         compiled from manager/schedConfSettings.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'manager/schedConfSettings.tpl', 18, false),array('function', 'translate', 'manager/schedConfSettings.tpl', 27, false),array('function', 'fieldLabel', 'manager/schedConfSettings.tpl', 33, false),array('function', 'form_language_chooser', 'manager/schedConfSettings.tpl', 40, false),array('modifier', 'escape', 'manager/schedConfSettings.tpl', 20, false),array('modifier', 'to_array', 'manager/schedConfSettings.tpl', 36, false),array('modifier', 'assign', 'manager/schedConfSettings.tpl', 36, false),)), $this); ?>
<?php echo ''; ?><?php $this->assign('pageTitle', "manager.schedConfs.schedulingAConference"); ?><?php echo ''; ?><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><?php echo ''; ?>


<br />

<form name="schedConf" method="post" action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'updateSchedConf'), $this);?>
">
<?php if ($this->_tpl_vars['schedConfId']): ?>
<input type="hidden" name="schedConfId" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['schedConfId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" />
<?php endif; ?>
<input type="hidden" name="conferenceId" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['conferenceId'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" />

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/formErrors.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<?php if (! $this->_tpl_vars['schedConfId']): ?>
<p><span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfs.form.createInstructions"), $this);?>
</span></p>
<?php endif; ?>

<table class="data" width="100%">
	<?php if (count ( $this->_tpl_vars['formLocales'] ) > 1): ?>
		<tr valign="top">
			<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'formLocale','key' => "form.formLanguage"), $this);?>
</td>
			<td width="80%" class="value">
				<?php if ($this->_tpl_vars['schedConfId']): ?>
					<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'editSchedConf','path' => ((is_array($_tmp=$this->_tpl_vars['conferenceId'])) ? $this->_run_mod_handler('to_array', true, $_tmp, $this->_tpl_vars['schedConfId']) : $this->_plugins['modifier']['to_array'][0][0]->smartyToArray($_tmp, $this->_tpl_vars['schedConfId'])),'escape' => false), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'settingsUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'settingsUrl'));?>

				<?php else: ?>
					<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'createSchedConf','escape' => false), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'settingsUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'settingsUrl'));?>

				<?php endif; ?>
				<?php echo $this->_plugins['function']['form_language_chooser'][0][0]->smartyFormLanguageChooser(array('form' => 'schedConf','url' => $this->_tpl_vars['settingsUrl']), $this);?>

				<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "form.formLanguage.description"), $this);?>
</span>
			</td>
		</tr>
	<?php endif; ?>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'title','key' => "manager.schedConfs.form.title",'required' => 'true'), $this);?>
</td>
		<td width="80%" class="value"><input type="text" id="title" name="title[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['title'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="120" class="textField" /></td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'acronym','required' => 'true','key' => "manager.schedConfs.form.acronym"), $this);?>
</td>
		<td width="80%" class="value">
			<input type="text" name="acronym[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="acronym" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['acronym'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="8" maxlength="16" class="textField" />
		</td>
	</tr>
	<tr valign="top">
		<td class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'schedConfPath','key' => "common.path",'required' => 'true'), $this);?>
</td>
		<td class="value">
			<input type="text" id="schedConfPath" name="schedConfPath" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['schedConfPath'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="16" maxlength="32" class="textField" />
			<br />
			<?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.ellipsis"), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'sampleEllipsis') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'sampleEllipsis'));?>

			<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('schedConf' => 'path','page' => ($this->_tpl_vars['sampleEllipsis'])), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'sampleUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'sampleUrl'));?>

			<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfs.form.urlWillBe",'sampleUrl' => $this->_tpl_vars['sampleUrl']), $this);?>
</span>
		</td>
	</tr>
</table>

<p><input type="submit" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.save"), $this);?>
" class="button defaultButton" /> <input type="button" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.cancel"), $this);?>
" class="button" onclick="document.location.href='<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'schedConfs'), $this);?>
'" /></p>

</form>

<p><span class="formRequired"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.requiredField"), $this);?>
</span></p>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>