{**
 * program.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Scheduled conference program page.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitleTranslated" value=$title}
{include file="common/header.tpl"}
{/strip}
<form>
    <fieldset id="survey"></fieldset>
    <!--span class="loading glyphicon glyphicon-refresh glyphicon-refresh-animate"></span-->
</form>
<form method="post" class="hidden">
    <input type="hidden" name="save" value="true" />
    <textarea name="data" id="survey_data" style='width: 100%; height: 500px;'>{$data}</textarea>
</form>

<!--------------------------------->

<script type="text/javascript" src="{$baseUrl}/lib/jquery-survey/handlebars.js"></script>
<script type="text/javascript" src="{$baseUrl}/lib/jquery-survey/jQuery.Survey.js"></script>
<script type="text/javascript" src="{$baseUrl}/lib/jquery-survey/jquery.validate.js"></script>

<script language="javascript" type="text/javascript">
var survey = {literal}{{/literal}
    pages: [{literal}{{/literal} 
        elements: [{$survey}], 
        options: [{literal}{{/literal}
            type: 'nextPage',
            caption: '完成'
        {literal}}{/literal}]
    {literal}}]{/literal}
{literal}}{/literal};
var data = {$data};

{literal}

    $('#survey').survey({
        survey: survey,
        data: data,
        init: function(target){
            target.closest('form').validate({
              errorPlacement: function(error, element){
                var p = element;
                while(p && (!p.hasClass('input'))){
                  p = p.parent();
                }
                error.appendTo(p||element);
              },
              wrapper: 'div'
            });
          },
          beforeChange: function(from, to, next){
            var target = this;
            if(from === void 0){
              next();
            }else if(target.closest('form').valid()){
              var survey = $.survey(target);
              var data = survey.pageData();
              var surveyData = survey.data();
              survey.updateData(data);
              $("#survey_data").val(JSON.stringify(data));
              $("#survey_data").parents("form:first").submit();
            }
          }
    });
{/literal}
</script>

{include file="common/footer.tpl"}
