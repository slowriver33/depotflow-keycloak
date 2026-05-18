<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        ${realm.displayName!realm.name}
    <#elseif section = "form">
        <p id="kc-page-title">Reset your password</p>
        <p class="kc-info">Enter your email and we'll send you a link to reset your password.</p>

        <#if message?has_content && message.type = 'success'>
            <div style="background:#F0FDF4;border:1px solid #86EFAC;color:#166534;font-size:13px;padding:10px 12px;border-radius:6px;margin:0 0 20px;">
                ${kcSanitize(message.summary)?no_esc}
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

        <p class="kc-back-link">
            <a href="${url.loginUrl}">← Back to sign in</a>
        </p>
    </#if>
</@layout.registrationLayout>
