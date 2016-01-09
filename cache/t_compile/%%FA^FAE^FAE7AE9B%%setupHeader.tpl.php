<?php /* Smarty version 2.6.26, created on 2016-01-06 08:14:55
         compiled from manager/schedConfSetup/setupHeader.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'manager/schedConfSetup/setupHeader.tpl', 13, false),array('function', 'translate', 'manager/schedConfSetup/setupHeader.tpl', 19, false),array('modifier', 'assign', 'manager/schedConfSetup/setupHeader.tpl', 13, false),)), $this); ?>
<?php echo ''; ?><?php $this->assign('pageCrumbTitle', "manager.schedConfSetup.schedConfSetup"); ?><?php echo ''; ?><?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'schedConfSetup'), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'currentUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'currentUrl'));?><?php echo ''; ?><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><?php echo ''; ?>



<ul class="steplist">
	<li id="step1" <?php if ($this->_tpl_vars['setupStep'] == 1): ?> class="current"<?php endif; ?>><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'schedConfSetup','path' => '1'), $this);?>
">1. <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.details"), $this);?>
</a></li>
	<li id="step2" <?php if ($this->_tpl_vars['setupStep'] == 2): ?> class="current"<?php endif; ?>><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'schedConfSetup','path' => '2'), $this);?>
">2. <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.submissions"), $this);?>
</a></li>
	<li id="step3" <?php if ($this->_tpl_vars['setupStep'] == 3): ?> class="current"<?php endif; ?>><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'schedConfSetup','path' => '3'), $this);?>
">3. <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup.review"), $this);?>
</a></li>
</ul>
