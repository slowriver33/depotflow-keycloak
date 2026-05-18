<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username') displayInfo=true; section>
    <#if section = "header">
        <h2 class="df-page-title">Reset your password</h2>
        <p class="df-page-subtitle">Enter your email and we'll send you a link to reset your password.</p>
    <#elseif section = "form">
        <#if message?has_content && message.type = 'success'>
            <div class="alert-success">
                ${kcSanitize(message.summary)?no_esc}
            </div>
        </#if>
        <#if message?has_content && message.type = 'error'>
            <div class="alert-error">
                <span class="error-dot"></span>
                <span>${kcSanitize(message.summary)?no_esc}</span>
            </div>
        </#if>

        <form id="kc-reset-password-form" action="${url.loginAction}" method="post">
            <div class="form-group">
                <label for="username" class="control-label">Email</label>
                <input type="email" id="username" name="username" class="form-control"
                       autofocus autocomplete="email" />
            </div>
            <input class="btn-primary" type="submit" value="Send reset link" />
        </form>
    <#elseif section = "info">
        <a href="${url.loginUrl}">← Back to sign in</a>
    </#if>
</@layout.registrationLayout>
