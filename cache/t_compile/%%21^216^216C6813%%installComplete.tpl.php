<?php /* Smarty version 2.6.26, created on 2016-01-06 08:05:29
         compiled from install/installComplete.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'install/installComplete.tpl', 17, false),array('function', 'translate', 'install/installComplete.tpl', 18, false),array('modifier', 'assign', 'install/installComplete.tpl', 17, false),array('modifier', 'escape', 'install/installComplete.tpl', 26, false),)), $this); ?>
<?php echo ''; ?><?php $this->assign('pageTitle', "installer.ocsInstallation"); ?><?php echo ''; ?><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><?php echo ''; ?>


<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'login'), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'loginUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'loginUrl'));?>

<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "installer.installationComplete",'loginUrl' => $this->_tpl_vars['loginUrl'],'createUrl' => $this->_tpl_vars['createUrl']), $this);?>


<?php if ($this->_tpl_vars['writeConfigFailed']): ?>
<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "installer.overwriteConfigFileInstructions"), $this);?>


<form action="#">
<p>
<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "installer.contentsOfConfigFile"), $this);?>
:<br />
<textarea name="config" cols="80" rows="20" class="textArea" style="font-family: Courier,'Courier New',fixed-width"><?php echo ((is_array($_tmp=$this->_tpl_vars['configFileContents'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea>
</p>
</form>
<?php endif; ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>