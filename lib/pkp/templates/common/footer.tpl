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
</div><!-- body -->

</div><!-- container -->

<footer>
{if $displayCreativeCommons}
{translate key="common.ccLicense"}
{/if}
{if $pageFooter}
<!-- <br /><br /> -->
{if $isConferenceManager}
    <a class="edit-link" href="{$conferenceUrl}/manager/setup/3#conferencePageFooterInfo" target="_blank">
        {translate key="manager.registrationOptions.editTitle"}
    </a>
{/if}
{$pageFooter}
{/if}
{call_hook name="Templates::Common::Footer::PageFooter"}

{include file="common/navbar.tpl"}

{get_debug_info}
{if $enableDebugStats}{include file=$pqpTemplate}{/if}
</footer>


</body>
</html>
