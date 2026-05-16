# depotflow-keycloak

Custom Keycloak login + email theme for DepotFlow. Deployed via Railway to the `abundant-embrace` service.

Tenant name renders as the page header via `${realm.displayName!realm.name}` — no hardcoded tenant names anywhere. All future realms inherit the branding automatically.

---

## What's in this repo

```
themes/depotflow/
├── login/          — Login, OTP, password reset, update-password, page-expired, error pages
│   ├── resources/css/styles.css  — Full palette (indigo-600 primary, slate-50 background)
│   └── messages/messages_en.properties
└── email/          — HTML + plain-text password-reset email templates
    └── messages/messages_en.properties
Dockerfile          — Multi-stage build, Keycloak 26.0, kc.sh build + start --optimized
```

---

## Build locally

```bash
docker build -t depotflow-keycloak .
```

Test with start-dev (no TLS, local only):

```bash
docker run --rm -p 8080:8080 \
  -e KEYCLOAK_ADMIN=admin \
  -e KEYCLOAK_ADMIN_PASSWORD=admin \
  depotflow-keycloak start-dev
```

Then visit `http://localhost:8080/admin/` to log in, create a test realm, set the theme, and browse to `http://localhost:8080/realms/<realm>/account/` to preview the login page.

---

## Deploy to Railway

1. In the Railway dashboard, open the `abundant-embrace` project.
2. Settings → Source → disconnect the current image source.
3. Connect repo: `depotflow-keycloak`, branch `main`, root `/`, builder: Dockerfile (auto-detected).
4. Deploy.

Railway will build the Dockerfile on each push and deploy the resulting image.

---

## Set the theme in Keycloak admin

After the first deploy completes:

1. Log in to the Keycloak admin console at `<keycloak-domain>/admin/`.
2. For each realm (e.g. `awg`):
   - Realm settings → Themes
   - Login theme: `depotflow`
   - Email theme: `depotflow`
   - Save
3. To make `depotflow` the default for all new realms:
   - Switch to the `master` realm → Realm settings → Themes → set defaults there.

---

## Smoke test

After deploy and theme activation:

1. Visit `<keycloak-domain>/realms/awg/account/` (or trigger a login from DepotFlow).
2. Confirm:
   - Page header shows the realm display name (e.g. "AWG"), not "Keycloak" or "DepotFlow".
   - Primary button is indigo `#4F46E5`.
   - Background is slate-50, card is white with slate-200 border.
   - "Powered by DepotFlow" appears in muted text at the bottom of the login card.
3. Trigger forgot-password flow, check the email renders correctly (HTML + plain-text).

---

## Keycloak version note

The Dockerfile is pinned to `KC_VERSION=26.0`. Verify the version running on Railway via:

- Keycloak admin → Support → Server info → Server version field.

If it differs, update the `ARG KC_VERSION` line in the Dockerfile before deploying.

---

## Extending the theme

- **Additional email types** (verify-email, executeActions): copy the pattern from `email/html/password-reset.ftl`.
- **Additional languages**: add the locale code to `locales=` in `theme.properties` files and create matching `messages_<locale>.properties`.
- **Account console**: the account console is a React app — not covered here. Leave it on the default `keycloak.v2` theme.
