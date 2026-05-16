<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${realm.displayName!realm.name}
    <#elseif section = "form">
        <p id="kc-page-title">Two-factor verification</p>
        <p class="kc-info">Enter the 6-digit code from your authenticator app.</p>

        <#if message?has_content && message.type = 'error'>
            <div class="alert-error">
                <span class="error-dot"></span>
                <span>${kcSanitize(message.summary)?no_esc}</span>
            </div>
        </#if>

        <form id="kc-otp-login-form" action="${url.loginAction}" method="post">
            <div class="form-group">
                <label for="otp" class="control-label">Verification code</label>
                <input id="otp" name="otp" autocomplete="off" type="text" class="form-control"
                       autofocus maxlength="6" inputmode="numeric" pattern="[0-9]*" />
            </div>
            <input class="btn-primary" name="login" id="kc-login" type="submit" value="Verify" />
        </form>
    </#if>
</@layout.registrationLayout>
