{**
 * footer.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common footer for RT pages.
 *
 * $Id$
 *}
<br />

{if !$omitCloseButton}
    <p class="text-center">
<input type="button" onclick="window.close()" value="{translate key="common.close"}" class="btn btn-primary" /></p>
{/if}

{call_hook name="Templates::Rt::Footer::PageFooter"}
</div>
</div>
</div>
</div>
</body>
</html>
