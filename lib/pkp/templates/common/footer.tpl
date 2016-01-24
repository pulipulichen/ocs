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

{call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}
{if $rightSidebarCode}
    <div class="col-md-3">
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


</body>
</html>
