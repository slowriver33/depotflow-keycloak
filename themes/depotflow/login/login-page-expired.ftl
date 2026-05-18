<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${realm.displayName!realm.name}
    <#elseif section = "form">
        <p id="kc-page-title">Session expired</p>
        <p class="kc-info">Your sign-in session timed out. Please start over.</p>
        <a class="btn-primary" style="display:block;text-align:center;text-decoration:none;line-height:40px;"
           href="${url.loginRestartFlowUrl}">Restart sign in</a>
    </#if>
</@layout.registrationLayout>
