<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        <h2 class="df-page-title">Something went wrong</h2>
    <#elseif section = "form">
        <div class="alert-error">
            <span class="error-dot"></span>
            <span>${kcSanitize(message.summary)?no_esc}</span>
        </div>
        <#if client?? && client.baseUrl?has_content>
            <a class="btn-primary" style="display:block;text-align:center;text-decoration:none;line-height:40px;"
               href="${client.baseUrl}">Back to ${client.name!client.clientId}</a>
        <#else>
            <a class="btn-primary" style="display:block;text-align:center;text-decoration:none;line-height:40px;"
               href="${url.loginUrl}">Back to sign in</a>
        </#if>
    </#if>
</@layout.registrationLayout>
