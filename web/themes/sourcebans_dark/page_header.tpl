<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>{if $header_title != ""}{$header_title}{else}SourceBans{/if}</title>
<link rel="Shortcut Icon" href="./images/favicon.ico" />
<script type="text/javascript" src="./scripts/sourcebans.js"></script>
<link href="themes/{$theme_name}/css/css.php" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="./scripts/mootools.js"></script>
<script type="text/javascript" src="./scripts/contextMenoo.js"></script>


{$tiny_mce_js}
{$xajax_functions}

{php}
if ($_GET['p'] == "admin" and $_GET['c'] == "admins") {
{/php}
<!-- added by me start -->
<script type="text/javascript" src="./scripts/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" href="./scripts/bfdstyle.css" />
<link rel='stylesheet' id='bfd_jquery_style-css'  href='http://clanbfd.com/wp-content/plugins/clan-bfd/css/ui-darkness/jquery-ui-1.10.3.custom.css' type='text/css' media='all' />
<script src="./scripts/jquery-ui-1.10.4.js"></script>
<script type="text/javascript">
$.noConflict();
</script>
<script type="text/javascript" src="./scripts/admin_list_js.js"></script>
<!-- added by me end -->
{php}
}
{/php}

</head>
<body>

{php}
if ($_GET['p'] == "admin" and $_GET['c'] == "admins") {
{/php}
<!-- added by me start -->
<div id="dialog" title="dialog">
	<div class="ui-widget">
        <label for="f_search">Search:</label>
    	<input id="f_search" />
        <input id="f_id" style='display:none;' />
		<input id="u_id" style='display:none;'/>
    </div>
</div>
<div id="loading" title="Saving"> 
    <p>Please wait ...</p>
</div>
<!-- added by me end -->
{php}
}
{/php}

<div id="mainwrapper">
	<div id="header">
		<div id="head-logo">
    		<a href="index.php">
    			<img src="images/{$header_logo}" border="0" alt="SourceBans Logo" />
    		</a>
		</div>
		<div id="head-userbox">
	         Welcome {$username}
	         {if $logged_in}
	         	(<a href='index.php?p=logout'>Logout</a>)<br /><a href='index.php?p=account'>Your account</a>
				{php}
                echo $this->_tpl_vars['admin']['forum_id'];
                {/php}
	         {else}
	          	(<a href='index.php?p=login'>Login</a>)
                (<a href='ForumLogin.php' title='Press to login with your forum login.'>Login with your forum login</a>)
	         {/if}
		</div>
	</div>     
	<div id="tabsWrapper">
        <div id="tabs">
          <ul>
         