<nav class="navbar navbar-default navbar-fixed-top" role="banner">
  <div class="container">
    <div class="navbar-header">
        {if $isConferenceManager}
            <a class="edit-link" href="{url page="manager"}/editSchedConf/{$conferenceId}/{$schedConfId}#content" target="_blank">
                {*translate key="manager.registrationOptions.editTitle"*}
                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
            </a>
        {/if}
      <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
        <a href="{$currentConferenceHome}"  class="navbar-brand">
                    {if $schedConfAcronym}
                            {$schedConfAcronym}
                    {elseif $displayPageHeaderTitle && is_array($displayPageHeaderTitle)}
                            1<img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" width="{$displayPageHeaderTitle.width|escape}" height="{$displayPageHeaderTitle.height|escape}" {if $displayPageHeaderTitleAltText != ''}alt="{$displayPageHeaderTitleAltText|escape}"{else}alt="{translate key="common.pageHeader.altText"}"{/if} />
                    {elseif $displayPageHeaderTitle}
                            {$displayPageHeaderTitle|@strip_tags}
                    {elseif $alternatePageHeader}
                            {$alternatePageHeader}
                    {elseif $customLogoTemplate}
                            {include file=$customLogoTemplate}
                    {elseif $siteTitle}
                            {$siteTitle}
                    {else}
                            {$applicationName}
                    {/if}
        </a>
    </div>
        
        
        
        <nav class="collapse navbar-collapse" role="navigation">
      <ul class="nav navbar-nav navbar-right">
          
          {if $enableLanguageToggle}
            <li class='language-toggle'>
                <form action="#">
                    
                        <select {if $isPostRequest}disabled="disabled" {/if}size="1" name="locale" onchange="location.href={if $languageToggleNoUser}'{$currentUrl|escape}{if strstr($currentUrl, '?')}&amp;{else}?{/if}setLocale='+this.options[this.selectedIndex].value{else}('{url|escape:"javascript" page="user" op="setLocale" path="NEW_LOCALE" source=$smarty.server.REQUEST_URI}'.replace('NEW_LOCALE', this.options[this.selectedIndex].value)){/if}" 
                                                   class="btn btn-default btn-sm"
                                                   style="width:100%;">
                            {html_options options=$languageToggleLocales selected=$currentLocale}
                        </select>
                        
                </form>
        </li>
        {/if}
        
        {* ----------------------------------- *}
        
        {foreach from=$schedConfNavMenuItemNavOrder key=order item=navItems}
            {foreach from=$navItems item="navItem"}
                {*$navItem*}
                
                {if $navItem=='schedConfPostOverview'}
                    <li {if $requestedOp=="overview"}class="active overview"{else}class="overview"{/if}>
                        <a href="{url page="schedConf" op="overview"}">{translate key="schedConf.overview"}</a>
                    </li>
                    
                {elseif $navItem=='schedConfPostAnnouncement'}
                    <li {if $requestedPage=="announcement"}class="active announcement"{else}class="announcement"{/if}>
                        <a href="{url page="announcement"}">{translate key="plugins.block.navigation.announcement"}</a>
                    </li>
                {elseif $navItem=='schedConfShowCFP'}
                    <li {if $requestedOp=="cfp"}class="active cfp"{else}class="cfp"{/if}>
                        <a href="{url page="schedConf" op="cfp"}">

                                {translate key="schedConf.cfp"}

                            <br />
                            {if $submissionsOpenDate}    
                                ({$submissionsOpenDate|date_format:$dateFormatShort} ~ {$submissionsCloseDate|date_format:$dateFormatShort})
                            {/if}
                        </a>
                    </li>
                
                {elseif $navItem=='schedConfPostTrackPolicies'}
                    <li {if $requestedOp=="trackPolicies"}class="active trackPolicies"{else}class="trackPolicies"{/if}>
                        <a href="{url page="schedConf" op="trackPolicies"}">
                            {translate key="schedConf.trackPolicies"}
                        </a>
                    </li>
                    
                {elseif $navItem=='schedConfPostProgram'}    
                    <li {if $requestedOp=="program"}class="active program"{else}class="program"{/if}>
                        <a href="{url page="schedConf" op="program"}">{translate key="schedConf.program"}</a>
                    </li>
                    
                {elseif $navItem=='schedConfShowProgram'}    
                    <li {if $requestedOp=="presentations"}class="active presentations"{else}class="presentations"{/if}>
                        <a href="{url page="schedConf" op="presentations"}">
                            {translate key="schedConf.presentations.short"}
                        </a>
                    </li>
                    
                {elseif $navItem=='schedConfPostSchedule'}    
                    <li {if $requestedOp=="schedule"}class="active schedule"{else}class="schedule"{/if}>
                        <a href="{url page="schedConf" op="schedule"}">
                            {translate key="schedConf.schedule"}
                        </a>
                    </li>
                    
                {elseif $navItem=='schedConfPostPayment'}
                    <li {if $requestedOp=="registration" or $requestedOp=="register"}class="active registration register"{else}class="registration register"{/if}>
                        <a href="{url page="schedConf" op="registration"}">{translate key="schedConf.registration"}</a>
                    </li>
                    
                {elseif $navItem=='schedConfPostLocation'}
                    <li {if $requestedOp=="location"}class="active location"{else}class="location"{/if}>
                        <a href="{url page="schedConf" op="location"}">{translate key="schedConf.location"}</a>
                    </li>
                    
                {elseif $navItem=='schedConfPostAccommodation'}
                    <li {if $requestedOp=="accommodation"}class="active accommodation"{else}class="accommodation"{/if}>
                        <a href="{url page="schedConf" op="accommodation"}">{translate key="schedConf.accommodation"}</a>
                    </li>
                    
                {elseif $navItem=='schedConfPostSupporters'}
                    <li {if $requestedOp=="organizingTeam"}class="active organizingTeam"{else}class="organizingTeam"{/if}>
                        <a href="{url page="about" op="organizingTeam"}">
                            {translate key="schedConf.supporters"}
                        </a>
                    </li>
                    
                {elseif $navItem=='schedConfPostTimeline'}
                    <li {if $requestedOp=="timeline"}class="active timeline"{else}class="schedConfPostTimeline"{/if}>
                        <a href="{url page="schedConf" op="timeline"}">{translate key="schedConf.timeline"}</a>
                    </li>
                    
                {elseif $navItem=='schedConfContact'}
                    <li class="schedConfContact">
                        <a href="mailto:{$schedConfContactEmail}">
                            <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                            {translate key="schedConf.emailToDirector"}
                        </a>
                    </li>
                
                {elseif $navItem|substr:0:16 === "schedConfNavItem"}
                    {* schedConfNavItem *}
                    {assign var="navItemId" value=$navItem|substr:16}
                    {*$navId*}
                    
                    {assign var="navItem" value=$navMenuItems[$navItemId]}
                    {*$navItem.name*}
                    {if $navItem.name != '' 
                        && $navItem.visibility !== '0' && ($navItem.visibility === '1' 
                            || ($navItem.visibility === '2' && $isUserLoggedIn)
                            || ($navItem.visibility === '3' && $isRegistrationUser)
                            || ($navItem.visibility === '4' && $isConferenceManager)) }
                            <li {if $requestedOp=="page"}class="active navItem-{$navItemId}"{else}class="navItem-{$navItemId}"{/if}>
                                <a {if $navItem.urlType=='3'}
                                        href="{url page="schedConf"}/page?title={if $navItem.isLiteral}{$navItem.name|escape}{else}{translate key=$navItem.name}{/if}&url={$navItem.url|escape}"
                                    {elseif $navItem.urlType=='4'}
                                        href="{url page="schedConf"}/survey?id={$navItemId}"
                                    {elseif $navItem.urlType=='5'}
                                        href="{url page="schedConf"}/navPage?id={$navItemId}"
                                    {else}
                                        href="{$navItem.url|escape}"
                                    {/if}
                                   {if $navItem.urlType=='2'} target="_blank"{/if}>
                                    {if $navItem.isLiteral}
                                        {$navItem.name|escape}
                                    {else}
                                        {translate key=$navItem.name}
                                    {/if}
                                </a>
                            </li>
                    {/if}
                {/if}
            {/foreach}
        {/foreach}

        {* ----------------------------------- *}
        
        <!--
        {if $schedConfPostOverview}<li {if $requestedOp=="overview"}class="active"{/if}><a href="{url page="schedConf" op="overview"}">{translate key="schedConf.overview"}</a></li>{/if}
        <li {if $requestedPage=="announcement"}class="active"{/if}><a href="{url page="announcement"}">{translate key="plugins.block.navigation.announcement"}</a></li>
        {*if $schedConfShowCFP}
            <li {if $requestedOp=="cfp"}class="active"{/if}><a href="{url page="schedConf" op="cfp"}">{translate key="schedConf.cfp"}</a></li>
        {/if*}
        {if $schedConfPostTrackPolicies}<li {if $requestedOp=="trackPolicies"}class="active"{/if}><a href="{url page="schedConf" op="trackPolicies"}">{translate key="schedConf.trackPolicies"}</a></li>{/if}
        {if $schedConfShowProgram}<li {if $requestedOp=="program"}class="active"{/if}><a href="{url page="schedConf" op="program"}">{translate key="schedConf.program"}</a></li>{/if}
        {if $schedConfPostPresentations}<li {if $requestedOp=="presentations"}class="active"{/if}><a href="{url page="schedConf" op="presentations"}">{translate key="schedConf.presentations.short"}</a></li>{/if}
        {if $schedConfPostSchedule}<li {if $requestedOp=="schedule"}class="active"{/if}><a href="{url page="schedConf" op="schedule"}">{translate key="schedConf.schedule"}</a></li>{/if}
        {*if $schedConfPostPayment}<li {if $requestedOp=="registration" or $requestedOp=="register"}class="active"{/if}><a href="{url page="schedConf" op="registration"}">{translate key="schedConf.registration"}</a></li>{/if*}
        {if $schedConfPostLocation}<li {if $requestedOp=="location"}class="active"{/if}><a href="{url page="schedConf" op="location"}">{translate key="schedConf.location"}</a></li>{/if}
        {if $schedConfPostAccommodation}<li {if $requestedOp=="accommodation"}class="active"{/if}><a href="{url page="schedConf" op="accommodation"}">{translate key="schedConf.accommodation"}</a></li>{/if}
        {if $schedConfPostSupporters}<li {if $requestedOp=="organizingTeam"}class="active"{/if}><a href="{url page="about" op="organizingTeam"}">{translate key="schedConf.supporters"}</a></li>{/if}
        -->
        <!-- {if $schedConfPostTimeline}<li><a href="{url page="schedConf" op="timeline"}">{translate key="schedConf.timeline"}</a></li>{/if} -->
        <!--
        <li>
            <form class="navbar-form navbar-left" role="search" 
                  method="post" action="{url page="search" op="results"}">
                <div class="form-group">
                     <input type="text" class="form-control" placeholder="{translate key="common.search"}" size="9">
                </div>
                <select name="searchField" class="form-control" style="display: none;">
                    {html_options_translate options=$paperSearchByOptions}
                </select>
                <button type="submit" class="btn btn-default">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>
            </form>
        </li>
        -->
        
        {* ------------------------------------------ *}
        <li {if $requestedPage=="user" 
or $requestedPage=="admin" 
or $requestedPage=="login" 
or $requestedPage=="manager" 
or $requestedPage=="author" 
or $requestedPage=="director" 
or $requestedPage=="trackDirector" 
or $requestedPage=="reader"
or $requestedPage=="reviewer"}class="active"{/if}>
         
            {if $isUserLoggedIn}
                <a href="{url page="user"}">
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                    {translate key="nav.helloUsername" username=$loggedInUsername|escape}
                </a>
            {else}
                <a href="{url page="login"}">
                    {translate key="user.login"} / {translate key="user.register"}
                </a>
            {/if}
            
        </li>
        {* ------------------------------------------ *}

      </ul>
      
       
    </nav>
  </div>
</nav>