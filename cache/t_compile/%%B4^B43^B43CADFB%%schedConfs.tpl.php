<?php /* Smarty version 2.6.26, created on 2016-01-06 08:13:46
         compiled from manager/schedConfs.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'manager/schedConfs.tpl', 29, false),array('function', 'url', 'manager/schedConfs.tpl', 39, false),array('function', 'page_info', 'manager/schedConfs.tpl', 63, false),array('function', 'page_links', 'manager/schedConfs.tpl', 64, false),array('block', 'iterate', 'manager/schedConfs.tpl', 37, false),array('modifier', 'escape', 'manager/schedConfs.tpl', 39, false),array('modifier', 'default', 'manager/schedConfs.tpl', 40, false),array('modifier', 'to_array', 'manager/schedConfs.tpl', 43, false),)), $this); ?>
<?php echo ''; ?><?php $this->assign('pageTitle', "schedConf.scheduledConferences"); ?><?php echo ''; ?><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><?php echo ''; ?>

<script type="text/javascript">
<?php echo '
$(document).ready(function() { setupTableDND("#adminSchedConfs", "moveSchedConf"); });
'; ?>

</script>

<br />

<div id="schedConfs">
<table width="100%" class="listing" id="adminSchedConfs">
	<tr>
		<td colspan="4" class="headseparator">&nbsp;</td>
	</tr>
	<tr valign="top" class="heading">
		<td width="50%"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfs.scheduledConference"), $this);?>
</td>
		<td width="20%"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfs.form.acronym"), $this);?>
</td>
		<td width="10%"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.order"), $this);?>
</td>
		<td width="20%" align="right"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.action"), $this);?>
</td>
	</tr>
	<tr>
		<td colspan="4" class="headseparator">&nbsp;</td>
	</tr>
	<?php $this->_tag_stack[] = array('iterate', array('from' => 'schedConfs','item' => 'schedConf')); $_block_repeat=true;$this->_plugins['block']['iterate'][0][0]->smartyIterate($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
	<tr valign="top" id="schedConf-<?php echo $this->_tpl_vars['schedConf']->getId(); ?>
" class="data">
		<td><a class="action" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('schedConf' => $this->_tpl_vars['schedConf']->getPath(),'page' => 'manager'), $this);?>
"><?php echo ((is_array($_tmp=$this->_tpl_vars['schedConf']->getSchedConfTitle())) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</a></td>
		<td class="drag"><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['schedConf']->getLocalizedSetting('acronym'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)))) ? $this->_run_mod_handler('default', true, $_tmp, "&mdash;") : smarty_modifier_default($_tmp, "&mdash;")); ?>
</td>
		<td><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'moveSchedConf','d' => 'u','id' => $this->_tpl_vars['schedConf']->getId()), $this);?>
">&uarr;</a> <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'moveSchedConf','d' => 'd','id' => $this->_tpl_vars['schedConf']->getId()), $this);?>
">&darr;</a></td>
		<td align="right">
			<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'editSchedConf','path' => ((is_array($_tmp=$this->_tpl_vars['conference']->getId())) ? $this->_run_mod_handler('to_array', true, $_tmp, $this->_tpl_vars['schedConf']->getId()) : $this->_plugins['modifier']['to_array'][0][0]->smartyToArray($_tmp, $this->_tpl_vars['schedConf']->getId()))), $this);?>
" class="action"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.edit"), $this);?>
</a>
			&nbsp;|&nbsp;
			<a class="action" href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'deleteSchedConf','path' => $this->_tpl_vars['schedConf']->getId()), $this);?>
" onclick="return confirm('<?php echo ((is_array($_tmp=$this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfs.confirmDelete"), $this))) ? $this->_run_mod_handler('escape', true, $_tmp, 'jsparam') : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp, 'jsparam'));?>
')">
				<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.delete"), $this);?>

			</a>
		</td>
	</tr>
	<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['iterate'][0][0]->smartyIterate($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
	<?php if ($this->_tpl_vars['schedConfs']->wasEmpty()): ?>
	<tr>
		<td colspan="4" class="nodata"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfs.noneCreated"), $this);?>
</td>
	</tr>
	<tr>
		<td colspan="4" class="endseparator">&nbsp;</td>
	<tr>
	<?php else: ?>
		<tr>
			<td colspan="4" class="endseparator">&nbsp;</td>
		</tr>
		<tr>
			<td colspan="2" align="left"><?php echo $this->_plugins['function']['page_info'][0][0]->smartyPageInfo(array('iterator' => $this->_tpl_vars['schedConfs']), $this);?>
</td>
			<td colspan="2" align="right"><?php echo $this->_plugins['function']['page_links'][0][0]->smartyPageLinks(array('anchor' => 'schedConfs','name' => 'schedConfs','iterator' => $this->_tpl_vars['schedConfs']), $this);?>
</td>
		</tr>
	<?php endif; ?>
</table>

<p><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'createSchedConf'), $this);?>
" class="action"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfs.create"), $this);?>
</a></p>
</div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>