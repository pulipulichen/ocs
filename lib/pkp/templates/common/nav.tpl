<nav class="navbar navbar-default navbar-fixed-top" role="banner">
  <div class="container">
    <div class="navbar-header">
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
                            <img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" width="{$displayPageHeaderTitle.width|escape}" height="{$displayPageHeaderTitle.height|escape}" {if $displayPageHeaderTitleAltText != ''}alt="{$displayPageHeaderTitleAltText|escape}"{else}alt="{translate key="common.pageHeader.altText"}"{/if} />
                    {elseif $displayPageHeaderTitle}
                            {$displayPageHeaderTitle}
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
        {if $schedConfPostOverview}<li><a href="{url page="schedConf" op="overview"}">{translate key="schedConf.overview"}</a></li>{/if}
        <li><a href="{url page="announcement"}">{translate key="plugins.block.navigation.announcement"}</a></li>
        {if $schedConfShowCFP}
            <li><a href="{url page="schedConf" op="cfp"}">{translate key="schedConf.cfp"}</a></li>
        {/if}
        {if $schedConfPostTrackPolicies}<li><a href="{url page="schedConf" op="trackPolicies"}">{translate key="schedConf.trackPolicies"}</a></li>{/if}
        {if $schedConfShowProgram}<li><a href="{url page="schedConf" op="program"}">{translate key="schedConf.program"}</a></li>{/if}
        {if $schedConfPostPresentations}<li><a href="{url page="schedConf" op="presentations"}">{translate key="schedConf.presentations.short"}</a></li>{/if}
        {if $schedConfPostSchedule}<li><a href="{url page="schedConf" op="schedule"}">{translate key="schedConf.schedule"}</a></li>{/if}
        {if $schedConfPostPayment}<li><a href="{url page="schedConf" op="registration"}">{translate key="schedConf.registration"}</a></li>{/if}
        {if $schedConfPostAccommodation}<li><a href="{url page="schedConf" op="accommodation"}">{translate key="schedConf.accommodation"}</a></li>{/if}
        {if $schedConfPostSupporters}<li><a href="{url page="about" op="organizingTeam"}">{translate key="schedConf.supporters"}</a></li>{/if}
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
        <li>
            
            {if $isUserLoggedIn}
                <a href="{url page="user"}">
                    <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                    {translate key="nav.helloUsername" username=$loggedInUsername|escape}
                </a>
            {else}
                <a href="{url page="login"}">
                    {translate key="user.login"}/{translate key="user.register"}
                </a>
            {/if}
            
        </li>
      </ul>
      
      
    </nav>
  </div>
</nav>