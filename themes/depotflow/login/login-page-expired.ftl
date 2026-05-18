<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        <h2 class="df-page-title">Session expired</h2>
        <p class="df-page-subtitle">Your sign-in session timed out. Please start over.</p>
    <#elseif section = "form">
        <a class="btn-primary" style="display:block;text-align:center;text-decoration:none;line-height:40px;"
           href="${url.loginRestartFlowUrl}">Restart sign in</a>
    </#if>
</@layout.registrationLayout>
