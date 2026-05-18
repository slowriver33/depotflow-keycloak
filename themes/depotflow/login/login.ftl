<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password'); section>
    <#if section = "header">
        <h2 class="df-page-title">Sign in to your account</h2>
    <#elseif section = "form">
        <#if message?has_content && message.type = 'error'>
            <div class="alert-error">
                <span class="error-dot"></span>
                <span>${kcSanitize(message.summary)?no_esc}</span>
            </div>
        </#if>

        <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
            <div class="form-group">
                <label for="username" class="control-label">Email</label>
                <input tabindex="1" id="username" class="form-control" name="username"
                       value="${(login.username!'')}" type="email" autofocus autocomplete="email"
                       aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" />
            </div>

            <div class="form-group">
                <label for="password" class="control-label">Password</label>
                <input tabindex="2" id="password" class="form-control" name="password"
                       type="password" autocomplete="current-password"
                       aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" />
            </div>

            <div id="kc-form-options">
                <#if realm.rememberMe && !usernameHidden??>
                    <label>
                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"
                               <#if login.rememberMe??>checked</#if> />
                        Remember me
                    </label>
                <#else>
                    <span></span>
                </#if>
                <#if realm.resetPasswordAllowed>
                    <a tabindex="5" href="${url.loginResetCredentialsUrl}">Forgot password?</a>
                </#if>
            </div>

            <input type="hidden" id="id-hidden-input" name="credentialId"
                   <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if> />
            <input tabindex="4" class="btn-primary" name="login" id="kc-login" type="submit" value="Sign in" />
        </form>
    </#if>
</@layout.registrationLayout>
