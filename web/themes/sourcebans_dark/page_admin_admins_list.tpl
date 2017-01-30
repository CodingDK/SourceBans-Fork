{if not $permission_listadmin}
	Access Denied
{else}

<h3>Admins (<span id="admincount">{$admin_count}</span>)</h3>
Click on an admin to see more detailed information and actions to perform on them.<br /><br />

{php} require (TEMPLATES_PATH . "/admin.admins.search.php");{/php}

<div id="banlist-nav"> 
{$admin_nav}
</div>
<div id="banlist">
<table width="99%" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td width="34%" class="listtable_top"><b>Name</b></td>
		<td width="23%" class="listtable_top"><b>Server Admin Group </b></td>
		<td width="33%" class="listtable_top"><b>Web Admin Group</b></td>
		<!-- added by me start  34,33,33 % var standard ovenover-->
        <td width="10%" class="listtable_top"  align="center"><b>Forum</b></td>
        <!-- added by me end -->
	</tr>
	{foreach from="$admins" item="admin"}
		<tr onmouseout="this.className='tbl_out'" onmouseover="this.className='tbl_hover'" class="tbl_out opener">
			<td class="admin-row" style="padding:3px;">{$admin.user} (<a href="./index.php?p=banlist&advSearch={$admin.aid}&advType=admin" title="Show bans">{$admin.bancount} bans</a> | <a href="./index.php?p=banlist&advSearch={$admin.aid}&advType=nodemo" title="Show bans without demo">{$admin.nodemocount} w.d.</a>)</td>
			<td class="admin-row" style="padding:3px;">{$admin.server_group}</td>
			<td class="admin-row" style="padding:3px;">{$admin.web_group}</td>

		<!-- added by me start -->
		<td class="admin-row" align="center">
		<input type='text' value='{$admin.user}' id='f_input_{$admin.aid}' style='display:none;'>
		
		{php}
		if ($this->_tpl_vars['admin']['forum_id'] == 0) {
			$forum_name = "<img src=\"images/warning_small.png\" />";
			} elseif ($this->_tpl_vars['admin']['forum_ex']) {
			$forum_name = "<img src=\"images/ok.png\" />";
			} else {
			$forum_name = "<span style='padding:3px;'>";
			$forum_name = $forum_name. $this->_tpl_vars['admin']['forum_name']; 
			$forum_name = $forum_name. "</span>";
			}
		echo "<span id='f_output_". $this->_tpl_vars['admin']['aid'] ."'>".$forum_name."</span>";
		{/php}
		
        </td>
        <!-- added by me end -->
		
 		</tr>
		<tr>
			<td colspan="4"> <!-- added by me colspan is normal 3 -->
				<div class="opener" align="center" border="1">
					<table width="100%" cellspacing="0" cellpadding="3" bgcolor="#eaebeb">
						<tr>
			            	<td align="left" colspan="4" class="front-module-header"> <!-- added by me colspan is normal 3 -->
								<b>Admin Details of {$admin.user}</b>
							</td>
			          	</tr>
			          	<tr align="left">
				            <td width="35%" class="front-module-line"><b>Server Admin Permissions</b></td>
				            <td width="35%" class="front-module-line"><b>Web Admin Permissions</b></td>
				            <td width="30%" valign="top" class="front-module-line"><b>Action</b></td>
			          	</tr>
			          	<tr align="left">
				            <td valign="top">{$admin.server_flag_string}</td>
				            <td valign="top">{$admin.web_flag_string}</td>
				            <td width="30%" valign="top">
								<div class="ban-edit">
						        	<ul>
						        	{if $permission_editadmin}
							        	<li>
							        		<a href="index.php?p=admin&c=admins&o=editdetails&id={$admin.aid}"><img src="images/details.png" border="0" alt="" style="vertical-align:middle"/> Edit Details</a>
							        	</li>
							        	<li>
							        		<a href="index.php?p=admin&c=admins&o=editpermissions&id={$admin.aid}"><img src="images/permissions.png" border="0" alt="" style="vertical-align:middle" /> Edit Permissions</a>
							        	</li>
							        	<li>
							        		<a href="index.php?p=admin&c=admins&o=editservers&id={$admin.aid}"><img src="images/server_small.png" border="0" alt="" style="vertical-align:middle" /> Edit Server Access</a>
							        	</li>
										<!-- added by me start -->
										<li>
							        		<a href="#" class="f_knap" id="f{$admin.aid}"><img src="images/forum.png" border="0" alt="" style="vertical-align:middle" /> Edit Forum Name</a>
							        	</li>
										<!-- added by me end-->
							        	<li>
							        		<a href="index.php?p=admin&c=admins&o=editgroup&id={$admin.aid}"><img src="images/groups.png" border="0" alt="" style="vertical-align:middle" /> Edit Groups</a>
							        	</li>
						        	{/if}
						        	{if $permission_deleteadmin}
						            	<li>
							        		<a href="#" onclick="RemoveAdmin({$admin.aid}, '{$admin.user}');"><img src="images/delete.png" border="0" alt="" style="vertical-align:middle" /> Delete Admin</a>
							        	</li>
						            {/if}
						          	</ul>
								</div>
							   	<div class="front-module-line" style="padding:3px;">Immunity Level: <b>{$admin.immunity}</b></div>
							   	<div class="front-module-line" style="padding:3px;">Last Visited: <b><small>{$admin.lastvisit}</small></b></div>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	{/foreach}
</table>
</div>
<script type="text/javascript">InitAccordion('tr.opener', 'div.opener', 'mainwrapper');</script>
{/if}
