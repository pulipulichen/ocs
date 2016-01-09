<?php /* Smarty version 2.6.26, created on 2016-01-07 03:11:11
         compiled from index/site.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'nl2br', 'index/site.tpl', 21, false),array('modifier', 'escape', 'index/site.tpl', 25, false),array('block', 'iterate', 'index/site.tpl', 23, false),array('function', 'url', 'index/site.tpl', 31, false),array('function', 'translate', 'index/site.tpl', 31, false),)), $this); ?>
<?php echo ''; ?><?php if ($this->_tpl_vars['siteTitle']): ?><?php echo ''; ?><?php $this->assign('pageTitleTranslated', $this->_tpl_vars['siteTitle']); ?><?php echo ''; ?><?php endif; ?><?php echo ''; ?><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><?php echo ''; ?>


<br />

<?php if ($this->_tpl_vars['intro']): ?><?php echo ((is_array($_tmp=$this->_tpl_vars['intro'])) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)); ?>
<?php endif; ?>

<?php $this->_tag_stack[] = array('iterate', array('from' => 'conferences','item' => 'conference')); $_block_repeat=true;$this->_plugins['block']['iterate'][0][0]->smartyIterate($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>

<h3><?php echo ((is_array($_tmp=$this->_tpl_vars['conference']->getConferenceTitle())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</h3>

<?php if ($this->_tpl_vars['conference']->getLocalizedSetting('description') != ''): ?>
<p><?php echo ((is_array($_tmp=$this->_tpl_vars['conference']->getLocalizedSetting('description'))) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)); ?>
</p>
<?php endif; ?>

<p><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('conference' => $this->_tpl_vars['conference']->getPath(),'schedConf' => ""), $this);?>
" class="action"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "site.conferenceView"), $this);?>
</a></p>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['iterate'][0][0]->smartyIterate($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>