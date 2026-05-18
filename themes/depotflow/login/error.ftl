<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${realm.displayName!realm.name}
    <#elseif section = "form">
        <p id="kc-page-title">Something went wrong</p>
        <div class="alert-error">
            <span class="error-dot"></span>
            <span>${kcSanitize(message.summary)?no_esc}</span>
        </div>
        <#if client?? && client.baseUrl?has_content>
            <a class="btn-primary" style="display:block;text-align:center;text-decoration:none;line-height:40px;"
               href="${client.baseUrl}">Back to ${client.name!client.clientId}</a>
        </#if>
    </#if>
</@layout.registrationLayout>
