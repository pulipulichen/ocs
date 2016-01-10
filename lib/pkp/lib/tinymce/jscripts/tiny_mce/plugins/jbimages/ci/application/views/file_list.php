<html>
<head>
	<title><?php echo lang('jb_uploaded_images') ?></title>
	<link href="../../../css/dialog.css" rel="stylesheet" type="text/css" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="text/javascript" src="../../../../../tiny_mce_popup.js"></script>
</head>
<body>
<div id="imageListing">
    
<?php if($files) {
    ?>
    <ul>
        <?php
    $img_ext = array("git", "jpg", "jpeg", "png");
		foreach ($files as $file) { 
                        echo "<li>";
                    $img_path = $file['img_path'];
                    $ext = substr($img_path, strrpos($img_path, ".")+1);
                    //echo $ext;
                    ?>
                    <a href="javascript:insertFile('<?php echo html_escape($file['img_path']) ?>')">
                    <?php
                    if (in_array($ext, $img_ext)) {
                    ?>
			<img src="<?php echo html_escape($file['img_path']) ?>" width="25" height="25" alt="<?php echo html_escape($file['name']) ?>" />
                    <?php
                    }
                    ?>
			<?php echo html_escape($file['name']) ?></a>&nbsp;
			(<?php echo html_escape($file['size']) ?> kB)&nbsp;&nbsp;&nbsp;
                        <div>
                            <span class="delete"><a href="../deleteImage/<?php echo urlencode($file['name']) ?>"><?php echo lang('jb_delete') ?></a></span>
                        </div>
                        </li>
                    <?php
                    }
                    ?>
        </ul>
    <?php
	} else { ?>
	<h3><?php echo lang('jb_no_files') ?></h3>
	<a href="../../../dialog.htm"><?php echo lang('jb_go_back') ?></a>
<?php } ?>
    
</div>
<script type="text/javascript">
    function insertFile(_path) {
        //alert(_path);
        console.log(window.opener.tinyMCEPopup)
                        var _filename = _path;
                        var _f_name = _filename.substring(_filename.lastIndexOf("/")+1, _filename.length);
                        var _ext = _filename.substring(_filename.lastIndexOf(".")+1, _filename.length);
                        _ext = _ext.toLowerCase();
                        var _img_ext = ["gif", "jpg", "jpeg", "png"];
                        //alert([_f_name, _ext, typeof($)]);
                        if (_img_ext.indexOf(_ext) > -1) { 
                            tinyMCEPopup.editor.execCommand('mceInsertContent', false, '<img src="' + _filename +'" alt="" />');
                        }
                        else {
                            tinyMCEPopup.editor.execCommand('mceInsertContent', false, '<a href="' + _filename +'" target="_blank">'+_f_name+'</a>');
                        }
			tinyMCEPopup.close();
    }
</script>
</body>
</html>