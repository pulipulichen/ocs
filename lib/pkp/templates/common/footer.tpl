{**
 * footer.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site footer.
 *
 *}

</div><!-- content -->
</div><!-- main -->

{call_hook|assign:"leftSidebarCode" name="Templates::Common::LeftSidebar"}
{if $leftSidebarCode}
    <div class="col-sm-3 col-sm-pull-9" id="leftCol">
        {if $leftSidebarCode}
                <div id="sidebar">
                        {$leftSidebarCode}
                </div>
        {/if}
    </div>
{/if}

{call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}
{if $rightSidebarCode}
    <div class="col-sm-3 col-sm-push-9">
        {if $rightSidebarCode}
            <div id="rightSidebar">
                {$rightSidebarCode}
            </div>
        {/if}
    </div>
{/if}

</div><!-- body -->

</div><!-- container -->


<footer>
    <div class="footer-container">
{if $displayCreativeCommons}
{translate key="common.ccLicense"}
{/if}
{if $isConferenceManager}
    <a class="edit-link" href="{$conferenceUrl}/manager/setup/3#conferencePageFooterInfo" target="_blank">
        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
    </a>
{/if}
{if $pageFooter}
<!-- <br /><br /> -->
{$pageFooter}
{/if}
{call_hook name="Templates::Common::Footer::PageFooter"}

{include file="common/navbar.tpl"}

{get_debug_info}
{if $enableDebugStats}{include file=$pqpTemplate}{/if}
    </div>
</footer>

{if $analyticsTrackingID}
<script>
{literal}
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
{/literal}
  ga('create', '{$analyticsTrackingID}', 'auto');
  ga('send', 'pageview');
</script>
{/if}
    
</body>
</html>
