<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        <h2 class="df-page-title">Set a new password</h2>
        <p class="df-page-subtitle">Choose a password with at least 8 characters including one uppercase letter, one number, and one special character.</p>
    <#elseif section = "form">
        <#if message?has_content && message.type = 'error'>
            <div class="alert-error">
                <span class="error-dot"></span>
                <span>${kcSanitize(message.summary)?no_esc}</span>
            </div>
        </#if>

        <form id="kc-passwd-update-form" action="${url.loginAction}" method="post">
            <input type="text" id="username" name="username" value="${username}"
                   autocomplete="username" readonly style="display:none;" />

            <div class="form-group">
                <label for="password-new" class="control-label">New password</label>
                <input type="password" id="password-new" name="password-new" class="form-control"
                       autofocus autocomplete="new-password" />
            </div>
            <div class="form-group">
                <label for="password-confirm" class="control-label">Confirm new password</label>
                <input type="password" id="password-confirm" name="password-confirm" class="form-control"
                       autocomplete="new-password" />
            </div>
            <input class="btn-primary" type="submit" value="Set password" />
        </form>
    </#if>
</@layout.registrationLayout>
