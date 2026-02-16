---
name: react-spa-security
description: Apply OWASP Top 10 security best practices to React single-page applications. Use this skill whenever building, reviewing, or auditing React SPA code to ensure it follows modern web security standards. Covers XSS prevention, authentication, sensitive data exposure, injection, misconfigurations, vulnerable dependencies, and more.
license: MIT
---

This skill guides secure development of React single-page applications (SPAs) based on the **OWASP Top 10 (2021)**. Apply these practices when building new components, reviewing pull requests, or auditing existing React codebases.

The user provides React code or describes a feature to build. Claude should proactively apply these security principles and flag violations — even when the user hasn't explicitly asked for a security review.

---

## A01: Broken Access Control

Frontend access control is **never sufficient on its own** — the server must enforce all authorization. However, the SPA still plays a critical role in UX and defense-in-depth.

### Principles

- **Never trust the client.** All authorization decisions must be validated server-side. Frontend route guards and conditional rendering are UX conveniences, not security controls.
- **Protect routes with auth guards.** Wrap protected routes so unauthenticated or unauthorized users are redirected before components mount or data fetches fire.
- **Hide UI elements the user cannot use.** Conditionally render buttons, links, and menu items based on the user's role/permissions. This reduces attack surface discovery.
- **Do not store roles or permissions in manipulable client state.** Derive permissions from a signed, server-issued token (e.g., JWT claims) or a server-side session. Never read them from `localStorage` values the user can edit.

### Patterns

**Route guard wrapper:**

```jsx
function ProtectedRoute({ children, requiredRole }) {
  const { user, isLoading } = useAuth();

  if (isLoading) return <LoadingSpinner />;
  if (!user) return <Navigate to="/login" replace />;
  if (requiredRole && user.role !== requiredRole) return <Navigate to="/unauthorized" replace />;

  return children;
}
```

**Conditional rendering based on permissions:**

```jsx
// Good — derived from auth context backed by server token
{user.permissions.includes('admin:delete') && <DeleteButton />}

// Bad — role stored in plain localStorage
{localStorage.getItem('role') === 'admin' && <DeleteButton />}
```

### Checklist

- [ ] Every API call that mutates data or returns sensitive information requires an auth token sent via `Authorization` header (not URL params).
- [ ] Route guards redirect before any data fetching occurs.
- [ ] No client-side-only permission gates protect destructive actions.
- [ ] Deep links to protected pages are handled (redirect to login → return after auth).

---

## A02: Cryptographic Failures

SPAs cannot perform server-side encryption, but they handle and transport sensitive data constantly.

### Principles

- **Enforce HTTPS everywhere.** All API calls, asset loads, and third-party scripts must use TLS. Mixed content is a vulnerability.
- **Never store secrets in frontend code.** API keys, signing secrets, and credentials must never appear in source bundles. Use environment variables server-side and proxy requests when needed.
- **Minimize sensitive data in the browser.** Don't store PII, tokens, or financial data in `localStorage` or `sessionStorage` if it can be avoided. Prefer `httpOnly` cookies for auth tokens.
- **Avoid implementing your own crypto.** Use the Web Crypto API for legitimate client-side needs (e.g., encrypting data before upload). Never roll custom hashing or encryption.

### Patterns

**Environment variable safety:**

```jsx
// DANGER — this is bundled into the client JS and visible to anyone
const API_SECRET = process.env.REACT_APP_API_SECRET;

// SAFE — non-secret public key for client-side use only
const STRIPE_PK = process.env.REACT_APP_STRIPE_PUBLISHABLE_KEY;

// SAFE — secret stays server-side, SPA calls your own backend
const response = await fetch('/api/payment', { method: 'POST', body: data });
```

**Token storage preference order (most to least secure):**

1. `httpOnly`, `Secure`, `SameSite=Strict` cookie (not accessible to JS at all)
2. In-memory variable (lost on refresh, but immune to XSS exfiltration from storage)
3. `sessionStorage` (cleared on tab close, but readable by XSS)
4. `localStorage` (persists indefinitely, readable by XSS — **avoid for tokens**)

### Checklist

- [ ] No secrets, API keys, or credentials in client-side bundles.
- [ ] All network requests use HTTPS.
- [ ] Auth tokens stored in `httpOnly` cookies or in-memory — not `localStorage`.
- [ ] Sensitive form fields use `autocomplete="off"` where appropriate.
- [ ] Build output (`build/static/js/*.js`) reviewed for leaked secrets before deploy.

---

## A03: Injection

In React SPAs, the primary injection vector is **Cross-Site Scripting (XSS)**. SQL injection and command injection are server concerns, but the SPA can still introduce injection risks.

### Principles

- **Trust React's default escaping.** JSX expressions (`{variable}`) auto-escape content. This is your first line of defense — don't circumvent it.
- **Never use `dangerouslySetInnerHTML` with untrusted data.** If you must render HTML, sanitize it with a library like DOMPurify first.
- **Sanitize URL schemes.** User-supplied URLs in `href` or `src` can execute JavaScript via `javascript:` protocol. Always validate URL schemes.
- **Beware `eval()`, `Function()`, and `innerHTML`.** These bypass React's protections entirely. Avoid them. If dynamic code execution is required, use a sandboxed iframe or Web Worker.

### Patterns

**Dangerous — raw HTML injection:**

```jsx
// NEVER do this with user-supplied content
<div dangerouslySetInnerHTML={{ __html: userComment }} />

// SAFE — sanitize first
import DOMPurify from 'dompurify';

<div dangerouslySetInnerHTML={{ __html: DOMPurify.sanitize(userComment) }} />
```

**Dangerous — `javascript:` URLs:**

```jsx
// VULNERABLE — user can submit javascript:alert(document.cookie)
<a href={userProvidedUrl}>Click here</a>

// SAFE — validate the scheme
function SafeLink({ url, children }) {
  const isAllowed = /^https?:\/\//i.test(url);
  return isAllowed ? <a href={url}>{children}</a> : <span>{children}</span>;
}
```

**Dangerous — dynamic code execution:**

```jsx
// NEVER
eval(userInput);
new Function(userInput)();
document.querySelector('#target').innerHTML = userInput;

// These all bypass React's XSS protections.
```

### Checklist

- [ ] Zero uses of `dangerouslySetInnerHTML` without DOMPurify (or equivalent) sanitization.
- [ ] No `eval()`, `new Function()`, or direct `innerHTML` assignments with user data.
- [ ] All user-supplied URLs validated against an allowlist of schemes (`https:`, `mailto:`, etc.).
- [ ] Template literals used in DOM APIs are escaped or avoided.
- [ ] Third-party rich-text editors configured with strict sanitization on output.

---

## A04: Insecure Design

Security must be designed in from the start, not bolted on later.

### Principles

- **Implement rate limiting on the backend and reflect it in the UI.** Show users clear feedback when rate-limited. Disable submit buttons and show countdowns.
- **Use multi-step confirmation for destructive actions.** Delete account, bulk delete, financial transactions — all should require explicit confirmation dialogs, not single clicks.
- **Design forms to resist abuse.** Use CAPTCHA or proof-of-work for public forms. Implement client-side validation as a UX aid, but always re-validate server-side.
- **Apply the principle of least privilege to API calls.** Request only the data and scopes needed for the current view.

### Patterns

**Destructive action confirmation:**

```jsx
function DeleteAccountButton() {
  const [step, setStep] = useState('idle');

  if (step === 'confirm') {
    return (
      <div role="alertdialog" aria-labelledby="confirm-title">
        <h3 id="confirm-title">Are you sure?</h3>
        <p>This will permanently delete your account and all data.</p>
        <button onClick={() => deleteAccount()}>Yes, delete my account</button>
        <button onClick={() => setStep('idle')}>Cancel</button>
      </div>
    );
  }

  return <button onClick={() => setStep('confirm')}>Delete Account</button>;
}
```

**Least-privilege API requests:**

```jsx
// Bad — fetching all user fields when only name and avatar are needed
const { data } = useQuery('/api/users/me');

// Better — request only needed fields via query params or a dedicated endpoint
const { data } = useQuery('/api/users/me?fields=name,avatar');
```

### Checklist

- [ ] All destructive actions require explicit confirmation.
- [ ] Public forms protected by CAPTCHA or rate limiting.
- [ ] API requests fetch only the data required for the current view.
- [ ] Business logic (pricing, discounts, quotas) enforced server-side — never trusted from the client.

---

## A05: Security Misconfiguration

Misconfigurations in the build pipeline, hosting, and headers are common SPA vulnerabilities.

### Principles

- **Set security headers.** Your server or CDN should send `Content-Security-Policy`, `X-Content-Type-Options`, `X-Frame-Options`, `Referrer-Policy`, and `Strict-Transport-Security`.
- **Configure Content Security Policy (CSP) strictly.** A strong CSP is the single most effective XSS mitigation. Avoid `unsafe-inline` and `unsafe-eval`.
- **Remove source maps in production.** Source maps expose your original source code. Strip them from production builds.
- **Disable directory listing.** Ensure your static file server doesn't expose `/static/` contents.
- **Configure CORS narrowly.** Your API should never return `Access-Control-Allow-Origin: *` for authenticated endpoints.

### Patterns

**Recommended security headers (server/CDN config):**

```
Content-Security-Policy: default-src 'self'; script-src 'self'; style-src 'self' 'unsafe-inline'; img-src 'self' data: https:; connect-src 'self' https://api.yourdomain.com; frame-ancestors 'none';
X-Content-Type-Options: nosniff
X-Frame-Options: DENY
Referrer-Policy: strict-origin-when-cross-origin
Strict-Transport-Security: max-age=31536000; includeSubDomains; preload
Permissions-Policy: camera=(), microphone=(), geolocation=()
```

**Strip source maps in production (in `package.json` or build config):**

```json
{
  "scripts": {
    "build": "GENERATE_SOURCEMAP=false react-scripts build"
  }
}
```

**Vite equivalent:**

```js
export default defineConfig({
  build: {
    sourcemap: false,
  },
});
```

### Checklist

- [ ] CSP header configured and enforced (not just `report-only` in production).
- [ ] No `unsafe-eval` in CSP (breaks if you use `eval()` — which you shouldn't).
- [ ] Source maps disabled in production builds.
- [ ] CORS configured with specific allowed origins — never wildcard for auth endpoints.
- [ ] Error pages do not leak stack traces, file paths, or server versions.
- [ ] All default/sample configuration removed before deploy.

---

## A06: Vulnerable and Outdated Components

SPAs typically have hundreds of npm dependencies. Each one is a potential vulnerability.

### Principles

- **Audit dependencies regularly.** Run `npm audit` or `yarn audit` as part of CI. Treat critical and high vulnerabilities as build-breaking.
- **Keep dependencies up to date.** Use tools like Dependabot, Renovate, or Socket to automate updates.
- **Minimize dependency count.** Every package is attack surface. Before adding a dependency, ask: can this be done with native APIs or a few lines of code?
- **Lock dependency versions.** Use lock files (`package-lock.json`, `yarn.lock`) and commit them. Use exact versions for security-critical packages.
- **Vet new dependencies.** Check download counts, maintenance activity, known vulnerabilities, and whether the package uses install scripts.

### Patterns

**CI audit step (GitHub Actions example):**

```yaml
- name: Security audit
  run: npm audit --audit-level=high
```

**Check for known vulnerabilities before adding a package:**

```bash
# Before installing
npx socket:npm info <package-name>
npm audit signatures
```

### Checklist

- [ ] `npm audit` runs in CI and fails on high/critical vulnerabilities.
- [ ] Lock files committed and reviewed in PRs.
- [ ] Dependabot or Renovate enabled for automated dependency updates.
- [ ] No dependencies with known critical CVEs in production.
- [ ] Unused dependencies removed (`npx depcheck`).

---

## A07: Identification and Authentication Failures

The SPA manages the auth UX — login flows, token handling, and session lifecycle.

### Principles

- **Use established auth libraries and protocols.** Don't hand-roll auth flows. Use OAuth 2.0 / OIDC with a proven library (e.g., `oidc-client-ts`, Auth0 SDK, Firebase Auth).
- **Implement proper session lifecycle.** Handle token expiry, refresh, and revocation gracefully. Auto-logout on expiry. Clear all auth state on logout.
- **Protect against CSRF.** If using cookies for auth, require `SameSite=Strict` or `SameSite=Lax` and use anti-CSRF tokens for state-changing requests.
- **Never expose tokens in URLs.** Tokens in query strings get logged in browser history, server logs, and referrer headers. Use the `Authorization` header or `httpOnly` cookies.

### Patterns

**Proper logout — clear everything:**

```jsx
function useLogout() {
  const queryClient = useQueryClient();

  return useCallback(async () => {
    // Revoke session server-side
    await fetch('/api/auth/logout', { method: 'POST', credentials: 'include' });
    // Clear client state
    queryClient.clear();
    sessionStorage.clear();
    // Redirect
    window.location.href = '/login';
  }, [queryClient]);
}
```

**Token refresh with race condition protection:**

```jsx
let refreshPromise = null;

async function getValidToken() {
  const token = getStoredToken();
  if (token && !isExpired(token)) return token;

  // Prevent multiple simultaneous refresh calls
  if (!refreshPromise) {
    refreshPromise = fetch('/api/auth/refresh', {
      method: 'POST',
      credentials: 'include',
    })
      .then(res => res.json())
      .then(data => {
        storeToken(data.accessToken);
        return data.accessToken;
      })
      .finally(() => { refreshPromise = null; });
  }

  return refreshPromise;
}
```

### Checklist

- [ ] Auth tokens never appear in URLs or query parameters.
- [ ] Logout clears all client-side auth state (memory, storage, caches).
- [ ] Token expiry handled gracefully — auto-refresh or redirect to login.
- [ ] Failed auth redirects don't create open redirect vulnerabilities (validate redirect targets).
- [ ] Password / credential forms use `autocomplete` attributes correctly for password managers.

---

## A08: Software and Data Integrity Failures

SPAs are especially vulnerable to supply chain and integrity attacks because they rely heavily on external resources.

### Principles

- **Use Subresource Integrity (SRI) for CDN scripts.** Any `<script>` or `<link>` loaded from a third-party CDN must include an `integrity` attribute.
- **Verify your build pipeline.** Ensure CI/CD runs in a trusted environment. Pin action versions in GitHub Actions. Review build scripts.
- **Don't trust client-side data for server decisions.** Prices, quantities, permissions — anything sent from the client must be re-validated server-side.
- **Sign and verify API responses when integrity matters.** For critical data (e.g., configuration, feature flags), consider server-signed payloads.

### Patterns

**SRI for third-party scripts:**

```html
<script
  src="https://cdn.example.com/lib@3.2.1/dist/lib.min.js"
  integrity="sha384-abc123..."
  crossorigin="anonymous"
></script>
```

**Pinned CI actions:**

```yaml
# Bad — mutable tag, can be compromised
- uses: actions/checkout@v4

# Good — pinned to exact commit SHA
- uses: actions/checkout@b4ffde65f46336ab88eb53be808477a3936bae11 # v4.1.1
```

### Checklist

- [ ] All third-party CDN resources include SRI hashes.
- [ ] CI/CD actions pinned to commit SHAs, not mutable tags.
- [ ] Client-submitted values (prices, roles, IDs) re-validated server-side.
- [ ] Build artifacts checksummed and verified before deployment.

---

## A09: Security Logging and Monitoring Failures

SPAs can contribute to observability by reporting client-side security events.

### Principles

- **Log authentication events client-side.** Failed logins, session expiries, and permission denials should be reported to your monitoring stack.
- **Report CSP violations.** Use the `report-uri` or `report-to` CSP directive to collect violation reports.
- **Capture and report client-side errors.** Use an error reporting service (Sentry, Datadog, etc.) to catch unexpected errors that may indicate attacks.
- **Don't log sensitive data.** Never log tokens, passwords, PII, or full credit card numbers to the console or error services.

### Patterns

**CSP violation reporting:**

```
Content-Security-Policy: ...; report-uri /api/csp-report; report-to csp-endpoint;
```

**Error boundary with security event reporting:**

```jsx
class SecurityErrorBoundary extends React.Component {
  componentDidCatch(error, errorInfo) {
    // Report to monitoring — but scrub sensitive data
    reportToMonitoring({
      error: error.message,
      component: errorInfo.componentStack,
      url: window.location.pathname, // path only, no query params
      timestamp: Date.now(),
    });
  }

  render() {
    if (this.state.hasError) return <GenericErrorPage />;
    return this.props.children;
  }
}
```

### Checklist

- [ ] CSP `report-uri` / `report-to` configured and reports monitored.
- [ ] Client-side error reporting enabled (Sentry, Datadog, etc.).
- [ ] Auth failures (401/403 responses) logged and alerted on at threshold.
- [ ] No sensitive data (tokens, PII, passwords) in console logs or error reports.
- [ ] `console.log` statements stripped or disabled in production builds.

---

## A10: Server-Side Request Forgery (SSRF)

SSRF is primarily a server vulnerability, but the SPA can introduce vectors.

### Principles

- **Never pass user-controlled URLs directly to backend fetch endpoints.** If your SPA sends a URL for the server to fetch (e.g., "import from URL," "preview link"), the server must validate and restrict the target.
- **Validate and sanitize URL inputs.** On the client side, validate that user-provided URLs match expected patterns before sending them to the server.
- **Restrict URL schemes and domains.** Only allow `https://` and block internal/private IP ranges on the server.

### Patterns

**Client-side URL validation before sending to server:**

```jsx
function isAllowedUrl(url) {
  try {
    const parsed = new URL(url);
    // Only allow HTTPS
    if (parsed.protocol !== 'https:') return false;
    // Block obvious internal targets
    const blocked = ['localhost', '127.0.0.1', '0.0.0.0', '169.254.169.254'];
    if (blocked.includes(parsed.hostname)) return false;
    return true;
  } catch {
    return false;
  }
}

// Usage
async function importFromUrl(url) {
  if (!isAllowedUrl(url)) {
    throw new Error('Invalid URL');
  }
  return fetch('/api/import', {
    method: 'POST',
    body: JSON.stringify({ url }),
  });
}
```

### Checklist

- [ ] User-provided URLs validated client-side before server submission.
- [ ] Server-side URL fetching restricted to allowed schemes, hosts, and IP ranges.
- [ ] "Import from URL" features sanitize input and use allowlists.

---

## General React SPA Security Practices

These cross-cutting concerns apply across all OWASP categories.

### Secure Coding Defaults

- **Use TypeScript.** Type safety catches entire classes of bugs (wrong data shapes, missing null checks) that can become security issues.
- **Enable strict linting.** Use `eslint-plugin-security` and `eslint-plugin-react` with strict configs.
- **Use `React.StrictMode`.** Catches unsafe lifecycles and deprecated patterns during development.

### Dependency & Build Hygiene

- **Audit `<script>` tags.** Every third-party script (analytics, widgets, chat) is a potential XSS vector. Minimize and vet them.
- **Use a CSP nonce or hash for inline scripts.** If inline scripts are absolutely necessary, use nonces generated per-request.
- **Review bundle contents.** Run `npx source-map-explorer build/static/js/main.*.js` to see exactly what's in your bundle.

### Secure Communication Patterns

- **Use `fetch` with `credentials: 'include'` for cookie-based auth.** Don't mix auth strategies.
- **Set timeouts on all API calls.** Prevent hanging requests from blocking the UI or leaking connection state.
- **Handle API errors without leaking details.** Show user-friendly messages; log detailed errors to your monitoring service, not the console.

### Recommended ESLint Rules

```json
{
  "plugins": ["security"],
  "rules": {
    "no-eval": "error",
    "no-implied-eval": "error",
    "no-new-func": "error",
    "security/detect-object-injection": "warn",
    "security/detect-non-literal-regexp": "warn",
    "security/detect-unsafe-regex": "error",
    "react/no-danger": "error"
  }
}
```

---

## Quick Reference: Security Review Checklist

When reviewing React SPA code, run through these high-signal checks:

| Category | Check |
|---|---|
| **XSS** | No unescaped `dangerouslySetInnerHTML`, no `eval()`, no `javascript:` URLs |
| **Auth** | Tokens in `httpOnly` cookies or memory, not `localStorage`; logout clears all state |
| **Secrets** | No API keys or credentials in client bundles; only public keys client-side |
| **Headers** | CSP, HSTS, X-Frame-Options, X-Content-Type-Options configured |
| **Deps** | `npm audit` clean; lock files committed; unused deps removed |
| **Build** | Source maps disabled; `console.log` stripped; no debug endpoints |
| **URLs** | User-provided URLs validated; redirect targets allowlisted |
| **Data** | Sensitive data minimized in browser; no PII in logs or error reports |
| **Design** | Destructive actions confirmed; rate limits reflected in UI; least privilege API calls |
