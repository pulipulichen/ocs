<?php /* Smarty version 2.6.26, created on 2016-01-06 08:02:21
         compiled from common/header.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'common/header.tpl', 11, false),array('modifier', 'assign', 'common/header.tpl', 11, false),)), $this); ?>
<?php echo ''; ?><?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.openConferenceSystems"), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'applicationName') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'applicationName'));?><?php echo ''; ?><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "core:common/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><?php echo ''; ?>
