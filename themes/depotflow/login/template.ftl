<#macro registrationLayout displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>${realm.displayName!realm.name}</title>
  <link rel="stylesheet" href="${url.resourcesPath}/css/styles.css" />
</head>
<body>
  <main class="df-main">
    <header class="df-brand">
      <h1 class="df-brand-name">${realm.displayName!realm.name}</h1>
    </header>
    <div class="df-card">
      <#nested "header">
      <#nested "form">
      <#if displayInfo>
        <div class="df-info">
          <#nested "info">
        </div>
      </#if>
    </div>
    <footer class="df-footer">
      Powered by <span class="df-footer-brand">DepotFlow</span>
    </footer>
  </main>
</body>
</html>
</#macro>
