---
name: digital-marketing
description: Use this skill when optimizing a client website for search engines, setting up e-commerce, improving conversion rates, or configuring analytics. Covers technical SEO (page structure, headings, meta tags, performance), conversion rate optimization, e-commerce platform selection (Shopify, WooCommerce), and Google Analytics setup. Apply when structuring HTML for SEO, optimizing page speed, setting up product pages, or advising clients on how to measure website performance.
---

# Digital Marketing for Client Websites

Digital marketing on websites has two jobs:

1. **Traffic** — Getting people to the website (pouring water into a bucket)
2. **Conversion** — Getting those people to take action: book a call, buy a product, join a list (keeping the water in the bucket)

This is where web design connects directly to money. The closer a skill is to helping a business make more money, the more that skill is worth to a client and the more you can charge for it.

A critical insight: you don't just want more traffic. You want fewer holes in the bucket. If people are landing on a site but leaving without doing anything, traffic alone won't fix that. Conversion rate optimization does.

---

## SEO (Search Engine Optimization)

At some point in your web design journey, every client will ask: "Do you do SEO?" SEO is how websites show up higher in search results when someone types a query into Google.

SEO is **not** a button you press on the backend. It's a holistic strategy with three components:

| Component | What It Is | Your Role as Web Designer |
|-----------|-----------|--------------------------|
| **Technical SEO** | How the site is built and structured | **Primary responsibility** |
| **Content** | The words on the pages, keywords chosen | Supportive role (structure and presentation) |
| **Backlinks** | Other websites linking to yours | Usually outside your scope |

As a web designer, most of your influence is on **technical SEO**. Despite the intimidating name, it comes down to two questions:

### Question 1: Can Google (and people) understand what the site is about?

This comes down to structure and clarity. Your job is to make the point of every page obvious quickly — for both humans and search engines.

#### Page Titles and Meta Descriptions

These are the preview that appears in Google search results. They're what gets the click — if they don't speak to what the page is about in a motivating way, the click never happens and nothing else matters.

```html
<!-- Page title: appears in the browser tab and as the clickable headline in search results -->
<title>Custom Kitchen Renovations in Austin, TX | Smith Remodeling</title>

<!-- Meta description: appears as the snippet text below the title in search results -->
<meta name="description" content="Transform your kitchen with Smith Remodeling. 20+ years of custom kitchen renovations in Austin. Free consultations available.">
```

Guidelines:
- **Page title**: 50–60 characters. Include the primary keyword and make it compelling. Every page should have a unique title.
- **Meta description**: 150–160 characters. Summarize the page's value and include a reason to click. Every page should have a unique description.
- Most modern website builders (Showit, Webflow, WordPress, etc.) have fields for setting both of these. If a builder doesn't offer this, that's a red flag.

#### HTML Heading Structure

What's actually on the page matters more to Google than even the page title or meta description. Every page should have one clear topic, and your HTML headings should reflect that clearly.

**Think of headings like an outline:**

```
Page Title + Meta Description → Why someone should click / care about this page
  └── H1 → Reconfirms the click was worth it; states what the entire page is about
        ├── H2 → Main section of the page
        │     ├── H3 → Supporting point within this section
        │     └── H3 → Another supporting point
        ├── H2 → Another main section
        │     └── H3 → Supporting point
        └── H2 → Final main section
```

**Critical rules for headings:**

- **One H1 per page. Only one.** This is the only HTML element where you should never have more than one on a single page. It should clearly explain what the entire page is about. Don't be clever or cute — be obvious.
- **H2s are the main sections** of the page. Use them to break the page into scannable chunks.
- **H3s support the H2s.** They're sub-points within a section.
- **Don't choose headings for their style/size.** Choose them for their semantic role. Style them with CSS independently.
- **The skim test:** If someone can skim just the headings and instantly understand what the page is about, Google usually can too. This is the overlap between good UX and good SEO.

```html
<!-- Good: clear, descriptive, properly nested -->
<h1>Kitchen Renovation Services in Austin</h1>

<h2>Our Renovation Process</h2>
<h3>Initial Consultation</h3>
<h3>Design Phase</h3>
<h3>Construction</h3>

<h2>Kitchen Styles We Specialize In</h2>
<h3>Modern Minimalist</h3>
<h3>Farmhouse</h3>

<h2>Why Choose Smith Remodeling</h2>
```

```html
<!-- Bad: skipping levels, multiple H1s, vague headings -->
<h1>Welcome to Our Website</h1>
<h1>We Do Kitchens</h1>
<h3>Some Info</h3>  <!-- Skipped H2 -->
<h2>Click Here</h2>  <!-- Not descriptive -->
```

### Question 2: Does the site load fast and work correctly?

Your job as a web designer is to make sure you're not putting unnecessary strain on users' internet connections. Just because a site loads fast on your laptop doesn't mean it loads fast for everyone.

#### Image Optimization

This is usually the single biggest performance win:

- **Use modern formats.** WebP images are dramatically smaller than JPEG or PNG with nearly identical visual quality. A multi-megabyte PNG can compress to ~100KB as WebP with no visible difference.
- **Compress aggressively.** Use compression tools (Squoosh, TinyPNG, ImageOptim, or your build tool's image pipeline).
- **Serve responsive images.** Use `srcset` so mobile devices don't download desktop-sized images.
- **Lazy load below-the-fold images.** Use `loading="lazy"` on images that aren't visible on initial page load.

```html
<!-- Responsive, lazy-loaded WebP image with fallback -->
<picture>
  <source srcset="hero-800.webp 800w, hero-1200.webp 1200w, hero-1600.webp 1600w" type="image/webp">
  <img src="hero-1200.jpg" alt="Modern kitchen renovation by Smith Remodeling"
       loading="lazy" width="1200" height="800">
</picture>
```

#### Layout Stability

Content on a page should not shift suddenly when the user is trying to click a button or read text. This is called **Cumulative Layout Shift (CLS)** and it's both annoying for users and a negative signal for Google.

Prevent it by:
- Always setting `width` and `height` attributes on images and videos (so the browser reserves space before they load).
- Avoiding dynamically injected content above existing content.
- Using `font-display: swap` with web fonts (and consider `size-adjust` to minimize layout shift from font loading).

#### Broken Links

A broken link is when someone clicks a link expecting to reach a page, but that page doesn't exist — sending them to a 404 page. This is frustrating for users and a bad signal for Google.

**When a page gets deleted or a URL changes, always set up a redirect:**

A **redirect** sends anyone hitting the old URL to the correct new page instead of a 404. This is critical because there may be links from other websites pointing to the old URL — those external sites won't know the page was deleted.

```
# Example: 301 redirect (permanent)
/old-page-url → /new-page-url
/services/kitchens → /services/kitchen-renovation
```

**Options when a URL changes:**
1. **Set up a redirect** (always do this — it catches external links)
2. **Update internal links** on your own site to point to the new URL
3. **Remove the link** if the content no longer exists anywhere

Most website builders and domain registrars have built-in redirect management. Use it every time you delete or rename a page.

#### Keep the Site Fresh

Google tries to serve the freshest, most relevant content. A site that sits untouched gathering dust sends negative signals. Broken links are one of the biggest indicators that nobody is maintaining the site. Regular content updates, even small ones, signal that the site is active and cared for.

---

## E-Commerce

Once someone decides they want to buy, the website has to make that possible. E-commerce is the system that lets websites sell things.

As a web designer, you're **not** building a custom checkout from scratch. You're choosing the right tool for the client and making sure the buying process is simple and pain-free.

### Platform Comparison

| | **Shopify** | **WooCommerce** |
|---|---|---|
| **What it is** | All-in-one e-commerce platform | WordPress plugin |
| **Best for** | Product-heavy businesses (50+ products) | Clients already on WordPress |
| **Strengths** | Stable, secure, handles scale well | Flexible, customizable, open ecosystem |
| **Trade-offs** | Less design flexibility, has its own coding language (Liquid) | More moving parts (plugins, hosting, updates) |
| **Learning curve** | Moderate (Liquid templating is unique) | Moderate (plugin ecosystem can be complex) |
| **Recommendation** | Best for dedicated e-commerce stores | Best when e-commerce is added to an existing WordPress site |

**Not recommended for beginners to start with Shopify** — the Liquid templating language is an additional learning curve on top of HTML/CSS/JS.

WooCommerce was made by the same people who made WordPress, so it fits together well. There's also a large ecosystem of plugins, tutorials, and resources.

### Minimum Requirements for Any E-Commerce Platform

Whatever platform you choose or recommend to a client, it needs these three basics:

1. **Product management** — The ability to add products with images, descriptions, and pricing, and display them on the site.
2. **Cart functionality** — Users can add products to a cart, view their cart, and modify quantities.
3. **Payment processing** — Connection to a payment processor (Stripe, PayPal, etc.) that actually handles the money. This is what collects payment from the user — you don't build this yourself.

If these basics are covered, you're in good shape.

### Why E-Commerce Changes Everything

When you add e-commerce to your skill set, the website stops being just a marketing tool — it becomes an ATM. Clients are much more willing to pay higher rates for websites that directly generate revenue.

---

## Conversion Rate Optimization (CRO)

Most online stores don't fail because of lack of traffic. They fail because people **almost buy** and then don't. That's the holes in the bucket.

CRO is figuring out how to get more of the people who visit to actually take the next step — buy, schedule, or sign up. You do this by **testing different ideas**.

### What to Test

| Element | Example Changes |
|---------|----------------|
| **Headlines** | Fact-based vs. motivation-based copy |
| **Button copy** | "Add to Cart" vs. "Get Yours Now" vs. "Start Your Order" |
| **Page layout** | Product image on the right vs. the left |
| **Checkout flow** | Cart → Checkout vs. Cart → Suggested Items → Checkout |
| **Form length** | 6 fields vs. 3 fields |
| **Social proof placement** | Testimonials above the fold vs. below |
| **Pricing display** | Monthly vs. annual (with savings highlighted) |

### The Catch: You Need to Measure

You don't know what's actually working unless you measure it. That's where analytics comes in.

---

## Google Analytics

Google Analytics is the main analytics tool most web designers use. It's free, works with virtually any website, and is fairly straightforward to set up. Set it up on every client site.

### Key Metrics to Understand

| Metric | What It Tells You |
|--------|-------------------|
| **Page Views** | How many times a page was loaded in someone's browser. Includes refreshes and return visits, so it's not a count of unique people. |
| **Active Users** | How many actual individual users visited. A better indicator of real traffic than page views. |
| **Event Count** | How many times users performed tracked actions (clicks, form fills, scrolls, etc.). Depends on what you've configured. |
| **Key Events** | The most important metric for CRO. These are specific actions you've told Google Analytics to watch for — form submissions, purchases, call bookings, etc. |

### How Key Events Drive CRO

Key Events are actions you manually set up within Google Analytics. You're telling it: "Anytime someone buys a product, fills out a form, or books a call — track that as a key event."

The workflow:
1. Make a change to the site (new headline, different layout, updated CTA).
2. Monitor the Key Events metric.
3. If Key Events go up after the change → you're moving in the right direction.
4. If they go down or stay flat → the change didn't help; try something else.

This replaces guessing with data. You're not just hoping the site works better — you can see it.

### Setting Up Google Analytics

For every client site:
1. Create a Google Analytics 4 (GA4) property for the site.
2. Add the tracking code to every page (most website builders have a dedicated field for this).
3. Set up Key Events for the actions that matter most to the client's business (form submissions, purchases, phone calls, etc.).
4. Share access with the client so they can see their own data.

Even just offering to set up Google Analytics immediately makes you more valuable. It signals to the client that you're thinking critically — not just about making their website look good, but about helping it make them money.

### Practical CRO When Starting Out

Don't let CRO overwhelm you early on. Stick to the basics:

- [ ] Set up Google Analytics on every client site
- [ ] Configure Key Events for the client's primary goals
- [ ] Think through the site critically: are there obvious problems that would keep people from taking action?
- [ ] Check for friction in the user flow (see UX Design skill)
- [ ] Make sure CTAs are visible, clear, and compelling
- [ ] Ensure forms are as short as possible
- [ ] Test the full path from landing page to conversion — complete the action yourself and note any pain points

---

## The Traffic Side: SEO Content Strategy (Supporting Role)

While content strategy isn't your primary role as a web designer, understanding it helps you build better sites and serve clients more effectively.

### Keywords

Keywords are the phrases people type into Google. The content side of SEO involves identifying these phrases and incorporating them naturally into page copy.

As a web designer, your job is to make sure the **structure** supports the content:
- Each page targets one clear topic/keyword
- Headings include relevant keywords naturally (not stuffed in awkwardly)
- The page structure makes it easy for the client (or their content writer) to add and update keyword-targeted content

### What's Outside Your Scope (Usually)

- **Paid ads** (Google Ads, Meta Ads) — these work but are typically managed by separate specialists
- **Backlink building** — the process of getting other websites to link to your client's site
- **Ongoing content creation** — blog posts, articles, social media content

Knowing these exist (and knowing they're not your job) helps you set realistic expectations with clients about what SEO results a website redesign alone can achieve.

---

## Quick Technical SEO Checklist

Run through this on every client site before launch:

### Structure & Clarity
- [ ] Every page has a unique, descriptive `<title>` tag (50–60 characters)
- [ ] Every page has a unique `<meta name="description">` (150–160 characters)
- [ ] Every page has exactly one `<h1>` that clearly states the page topic
- [ ] Headings are properly nested (H1 → H2 → H3, no skipped levels)
- [ ] Headings alone tell a coherent story when scanned
- [ ] URLs are clean and descriptive (`/kitchen-renovation` not `/page?id=47`)

### Performance
- [ ] All images are compressed and in modern formats (WebP preferred)
- [ ] Images below the fold use `loading="lazy"`
- [ ] Images have `width` and `height` attributes to prevent layout shift
- [ ] Web fonts use `font-display: swap`
- [ ] No unnecessary large JavaScript libraries loading on every page

### Links & Maintenance
- [ ] No broken internal links (test all navigation and in-content links)
- [ ] Redirects are in place for any deleted or renamed pages
- [ ] External links open in new tabs where appropriate
- [ ] A sitemap exists and is submitted to Google Search Console

### Analytics & Conversion
- [ ] Google Analytics 4 is installed and tracking
- [ ] Key Events are configured for the client's primary conversion goals
- [ ] All forms work correctly and submit to the right destination
- [ ] E-commerce checkout flow works end-to-end (if applicable)
- [ ] Payment processing is tested with a real transaction (if applicable)
- [ ] CTAs are visible, clear, and use action-oriented language
