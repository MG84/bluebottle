{% load templatetag_handlebars %}
{% load i18n %}
{% load static %}

{% tplhandlebars "my_project_basics" %}

    <legend>
        <strong>{% trans "Project basics" %}</strong>
    </legend>

    <fieldset>
        <ul>
            {{bb-text-field label='Title' hint='Be short, creative, simple and memorable.'
                valueBinding=title placeholder='Title'errors=errors.title}}

            {{bb-text-area label='Pitch' hint='Pitch your smart idea in one sentence.' valueBinding=pitch
                placeholder='Tell us in one sentence where you need to the money for.' errors=errors.pitch}}
        </ul>
    </fieldset>
    <fieldset>
        <ul>
            {{#bb-form-field hint='Select one of the themes.' label='Theme' errors=errors.theme}}
                {{view App.ThemeSelectView valueBinding="theme" classBinding="errors.theme.length:error"}}
            {{/bb-form-field}}
        </ul>
    </fieldset>
    <fieldset>
        <ul>
            {{#bb-form-field hint='Add some tags that characterise your project.' label='Tags' errors=errors.tags}}
                {{view App.TagWidget tagsBinding="tags" classBinding="errors.tags.length:error"}}
            {{/bb-form-field}}
        </ul>
    </fieldset>

    {{#if isDirty}}
        <button {{bindAttr class=":btn :btn-iconed :btn-next"}} {{action updateRecordOnServer}}><span class="flaticon solid right-2"></span>{% trans "Save & Next" %}</button>
    {{else}}
        <button {{bindAttr class=":btn :btn-iconed :btn-next"}} {{action goToNextStep}}><span class="flaticon solid right-2"></span>{% trans "Next" %}</button>
    {{/if}}


    {{partial "my_project_tasks_and_updates"}}

{% endtplhandlebars %}