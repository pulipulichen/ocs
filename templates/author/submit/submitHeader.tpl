{**
 * submitHeader.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Header for the paper submission pages.
 *
 * $Id$
 *}
{strip}
{assign var="pageCrumbTitle" value="author.submit"}
{include file="common/header.tpl"}
{/strip}

<ul class="nav nav-tabs" style="margin-bottom: 20px;">

	{if $showAbstractSteps}
		<li{if $submitStep == 1} class="current active"{/if}>
			{if $submitStep != 1 && $submissionProgress >= 1}<a href="{url op="submit" path="1" paperId=$paperId}">{else}
                                    <a href="#">{/if}
                                        {translate key="author.submit.start"}
                                    </a>
		</li>

		{if $showPaperSteps}
			<li{if $submitStep == 2} class="current active"{/if}>
				{if $submitStep != 2 && $submissionProgress >= 2}<a href="{url op="submit" path="2" paperId=$paperId}">{else}
                                    <a href="#">{/if}
				{translate key="author.submit.metadata"}</a>
			</li>
		{else}
			<li{if $submitStep == 3} class="current active"{/if}>
				{if $submitStep != 3 && $submissionProgress >= 3}<a href="{url op="submit" path="3" paperId=$paperId}">{else}
                                    <a href="#">{/if}
				{translate key="author.submit.metadataOnly"}</a>
			</li>
		{/if}
		
		{if $currentSchedConf->getSetting('acceptSupplementaryReviewMaterials') && !$showPaperSteps}
			<li{if $submitStep == 4} class="current active"{/if}>
				{if $submitStep != 4 && $submissionProgress >= 4}<a href="{url op="submit" path="4" paperId=$paperId}">{else}
                                    <a href="#">{/if}
				{translate key="author.submit.supplementaryFilesAbstractOnly"}</a>
			</li>

			<li{if $submitStep == 5} class="current active"{/if}>
				{if $submitStep != 5 && $submissionProgress >= 5}
                                    <a href="{url op="submit" path="5" paperId=$paperId}">
                                {else}
                                    <a href="#">
                                {/if}
				{translate key="author.submit.confirmationSkipSupp"}
                                </a>
			</li>
		{/if}
	{/if}

	{if $showPaperSteps}
		{if !$showAbstractSteps}
			<li{if $submitStep == 2} class="current active"{/if}>
				{if $submitStep != 2 && $submissionProgress >= 2}<a href="{url op="submit" path="2" paperId=$paperId}">{else}
                                    <a href="#">{/if}
				{translate key="author.submit.uploadOnly"}</a>
			</li>
		{else}
			<li{if $submitStep == 3} class="current active"{/if}>
				{if $submitStep != 3 && $submissionProgress >= 3}<a href="{url op="submit" path="3" paperId=$paperId}">{else}
                                    <a href="#">{/if}
				{translate key="author.submit.upload"}</a>
			</li>
		{/if}

		{if $currentSchedConf->getSetting('acceptSupplementaryReviewMaterials')}
			<li{if $submitStep == 4} class="current active"{/if}>
				{if $submitStep != 4 && $submissionProgress >= 4}<a href="{url op="submit" path="4" paperId=$paperId}">{else}
                                    <a href="#">{/if}
				{translate key="author.submit.supplementaryFiles"}</a>
			</li>

			<li{if $submitStep == 5} class="current active"{/if}>
				{if $submitStep != 5 && $submissionProgress >= 5}<a href="{url op="submit" path="5" paperId=$paperId}">{else}
                                    <a href="#">{/if}
				{translate key="author.submit.confirmation"}</a>
			</li>
		{else}
			<li{if $submitStep == 5} class="current active"{/if}>
				{if $submitStep != 5 && $submissionProgress >= 5}
                                    <a href="{url op="submit" path="5" paperId=$paperId}">
                                {else}
                                    <a href="#">
                                {/if}
				{translate key="author.submit.confirmationSkipSupp"}
                                </a>
			</li>
		{/if}
	{/if}

</ul>
