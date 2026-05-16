<#assign realmName=realm.displayName!realm.name>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
  body { font-family: system-ui, -apple-system, "Segoe UI", Roboto, sans-serif; background: #F8FAFC; margin: 0; padding: 24px; color: #0F172A; }
  .email-wrap { max-width: 520px; margin: 0 auto; }
  .email-card { background: #FFFFFF; border: 1px solid #E2E8F0; border-radius: 8px; overflow: hidden; }
  .email-body { padding: 28px 32px; }
  .email-realm { font-size: 22px; font-weight: 600; color: #0F172A; margin: 0 0 20px; }
  .email-greeting { font-size: 15px; color: #0F172A; margin: 0 0 12px; }
  .email-text { font-size: 14px; color: #334155; line-height: 1.65; margin: 0 0 24px; }
  .email-cta { display: inline-block; background: #4F46E5; color: #FFFFFF !important; padding: 11px 22px; border-radius: 6px; text-decoration: none; font-size: 14px; font-weight: 500; }
  .email-cta:hover { background: #4338CA; }
  .email-fine { font-size: 12px; color: #94A3B8; line-height: 1.6; margin: 28px 0 0; padding-top: 18px; border-top: 1px solid #E2E8F0; }
</style>
</head>
<body>
  <div class="email-wrap">
    <div class="email-card">
      <div class="email-body">
        <p class="email-realm">${realmName}</p>
        <p class="email-greeting">Hi ${user.firstName!''},</p>
        <p class="email-text">We received a request to reset the password on your ${realmName} account. Click the button below to set a new one. The link expires in ${linkExpirationFormatter(linkExpiration)}.</p>
        <a href="${link}" class="email-cta">Reset password</a>
        <p class="email-fine">
          If you didn't request this, you can safely ignore this email — your password won't change.<br><br>
          Powered by DepotFlow
        </p>
      </div>
    </div>
  </div>
</body>
</html>
