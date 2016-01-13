{**
 * block.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site sidebar menu -- user tools.
 *
 * $Id$
 *}
<div class="block" id="sidebarUser">
	<!-- <span class="blockTitle">{translate key="navigation.user"}</span> -->
	{if $isUserLoggedIn}
		{translate key="plugins.block.user.loggedInAs"}<br />
		<strong>{$loggedInUsername|escape}</strong>

		<ul class="nav nav-stacked">
			{if $hasOtherConferences}
				<li><a href="{url conference="index" page="user"}">{translate key="plugins.block.user.myConferences"}</a></li>
			{/if}
			<li><a href="{url page="user" op="profile"}">{translate key="plugins.block.user.myProfile"}</a></li>
                        {if $isConferenceManager}
                            <li><a href="{url page="manager"}">{translate key="manager.conferenceSiteManagement"}</a></li>
                        {/if}
                        {if $isDirector}
                            <li>
                                <a href="{url page="director"}">
                                    {translate key="director.home"}
                                </a>
                            </li>
                            <li>
                                <a href="{url page="director"}/submissions/submissionsUnassigned">
                                    {translate key="common.queue.long.submissionsUnassigned"}
                                </a>
                            </li>
                        {/if}
                        {if $isTrackDirector}
                            <li><a href="{url page="trackDirector"}">
                                    {translate key="common.queue.long.submissionsInReview"}</a></li>
                        {/if}
                        {if $isAuthor}
                            <li><a href="{url page="author"}">
                                    {translate key="common.queue.long.active"}</a></li>
                        {/if}
			<li><a href="{url page="login" op="signOut"}">{translate key="plugins.block.user.logout"}</a></li>
			{if $userSession->getSessionVar('signedInAs')}
				<li><a href="{url page="login" op="signOutAsUser"}">{translate key="plugins.block.user.signOutAsUser"}</a></li>
			{/if}
		</ul>
	{else}
		<form method="post" action="{$userBlockLoginUrl}">
			<table width="100%">
				<tr>
					<td colspan="2"  class="form-group">
                                            <label for="sidebar-username" class="control-label">
                                                {translate key="user.username"}
                                            </label>
                                                <input type="text" id="sidebar-username" name="username" value="" size="12" maxlength="32" class="form-control" />
                                        </td>
				</tr>
				<tr>
                                    <td colspan="2"  class="form-group"><label for="sidebar-password">{translate key="user.password"}</label>
					<input type="password" id="sidebar-password" name="password" value="{$password|escape}" size="12" maxlength="32" class="form-control" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="checkbox" id="remember" name="remember" value="1" /> <label for="remember">{translate key="plugins.block.user.rememberMe"}</label></td>
				</tr>
				<tr>
                                    <td colspan="2" class="text-center"><input type="submit" value="{translate key="user.login"}" class="btn btn-default" /></td>
				</tr>
			</table>
		</form>
	{/if}
</div>
