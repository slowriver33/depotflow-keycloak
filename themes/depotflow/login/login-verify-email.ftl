<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        <h2 class="df-page-title">Verify your email</h2>
    <#elseif section = "form">
        <p class="df-verify-text">
            We've sent a verification link to
            <span class="df-verify-email">${user.email!}</span>.
            Click the link in the email to continue.
        </p>

        <form id="kc-verify-email-form" action="${url.loginAction}" method="post">
            <input class="btn-primary" type="submit" value="Resend verification email" />
        </form>
    </#if>
</@layout.registrationLayout>
