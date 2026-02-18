---
name: brand-design
description: Use this skill when building or styling a client website to ensure strong, cohesive brand design. Covers color palette creation, font selection and pairing, and image consistency. Apply when choosing colors, selecting typography, sourcing or evaluating images, or extending an existing brand across a website. Also use when reviewing or auditing a site's visual identity.
---

# Brand Design for Client Websites

Brand design is what separates a $5,000 website from a $15,000 website. It's not just about making pages — it's about shaping how a business is perceived. When a site feels "on brand," clients see it as an investment, not just a website.

Think of brand design like meeting someone for the first time: within seconds, you form an impression based on how they look, communicate, and carry themselves. A brand is what businesses use to connect with people on a deeper level — more than just "here's my product, do you want it?" Your job as a web designer is to make sure that feeling comes through loud and clear on the website.

Your three main tools for brand design are **colors**, **fonts**, and **images**.

---

## Color Palettes

### The Foundation: Start Simple

Every website needs a strong color palette, and the most important rule that beginners fight against is: **simple is almost always better**. Too many colors are hard to manage and make a site feel chaotic.

**Starting Framework — The Minimum Viable Palette:**

| Role | Description | Example |
|------|-------------|---------|
| **Neutral colors** | Used for text and backgrounds | Browns, blacks, whites, grays |
| **Main brand color** | The primary identity color | One strong, recognizable hue |
| **Accent color** | Used sparingly for emphasis and CTAs | A complementary or contrasting hue |

This gives you 3–4 total colors to work with, which is plenty for most client sites.

### The 60-30-10 Rule

This is the go-to distribution for applying your palette across a website:

- **60% — Neutrals**: Backgrounds, body text, large surface areas. These are your browns, blacks, whites, and grays.
- **30% — Main brand color**: Headers, navigation, section backgrounds, key UI elements.
- **10% — Accent color**: Call-to-action buttons, highlights, hover states, badges, alerts.

This rule is great to start with, but you don't have to stay there. As you grow, you may need more than four colors — and that's fine, as long as they **harmonize**.

### Color Harmony

Colors that harmonize have a specific relationship on the color wheel. When expanding beyond the basic palette, use these established relationships:

- **Analogous palettes**: Colors that sit right next to each other on the color wheel. These feel calm and cohesive. Example: blue, blue-green, green.
- **Complementary palettes**: Colors directly across from each other on the color wheel. These create strong contrast and energy. Example: blue and orange.
- **Split-complementary**: A base color plus the two colors adjacent to its complement. Offers contrast with less tension.
- **Triadic**: Three colors equally spaced on the color wheel. Vibrant but needs careful balance.

### Practical Guidelines When Building

- **Don't memorize color theory** — instead, avoid random choices. Grab palette ideas from sites like Coolors, Adobe Color, or Pinterest boards.
- When a client comes with existing brand colors, extend those across the site rather than inventing new ones. Derive tints and shades from their existing palette.
- **Test contrast**: Ensure text is readable against its background. (See the UX/Accessibility skill for specific contrast ratios.)
- Use CSS custom properties (variables) for colors so the entire palette can be adjusted from one place:

```css
:root {
  --color-neutral-light: #F5F5F0;
  --color-neutral-dark: #1A1A1A;
  --color-brand: #2B5EA7;
  --color-accent: #E8A838;
}
```

- When in doubt, lean toward fewer colors. You can always add more later; removing colors from an established design is harder.

---

## Typography

Text is roughly 80% of what you see on any given website, so font choices matter more than most people realize.

### Font Categories and Their Personalities

| Category | Personality | Typical Use |
|----------|-------------|-------------|
| **Serif** (e.g., Georgia, Playfair Display) | Traditional, trustworthy, elegant | Law firms, luxury brands, editorial |
| **Sans-serif** (e.g., Inter, Open Sans, Helvetica) | Modern, clean, approachable | Tech, startups, most contemporary sites |
| **Monospace** (e.g., JetBrains Mono, Courier) | Technical, precise, code-like | Developer tools, fintech, technical brands |
| **Handwritten / Script** (e.g., Caveat, Dancing Script) | Personal, creative, casual | Bakeries, artisan brands, personal blogs |

The font's personality should match the overall brand of the site. A law firm's website shouldn't use a handwritten script for headings; a children's art studio probably shouldn't use a monospace font.

### How Many Fonts?

- **Many great sites use just one font.** Beginners have a strong urge to use tons of different font styles — resist this. Simple is almost always better.
- If you use more than one, **keep it tight: two font families is usually plenty**. Three should be the absolute maximum.
- When pairing fonts, the key is **intentional contrast**:
  - Serif + Sans-serif ✓
  - Sans-serif + Monospace ✓
  - Serif + Serif that looks almost the same ✗ (feels unintentional and messy)

### Practical Guidelines When Building

- Set up a clear **typographic scale** early. Define sizes for H1 through H6, body text, small text, and captions. Stick to it.
- Use relative units (`rem` or `em`) so typography scales well across devices.
- Establish consistent `line-height` (1.4–1.6 for body text is a safe range) and `letter-spacing` where needed.
- Load fonts efficiently — use `font-display: swap` to prevent invisible text during loading.
- Google Fonts is free and has a massive library. For more distinctive options, consider Fontshare, Adobe Fonts, or purchasing from foundries.

```css
/* Example typographic scale */
:root {
  --font-primary: 'Inter', sans-serif;
  --font-heading: 'Playfair Display', serif;

  --text-xs: 0.75rem;
  --text-sm: 0.875rem;
  --text-base: 1rem;
  --text-lg: 1.25rem;
  --text-xl: 1.5rem;
  --text-2xl: 2rem;
  --text-3xl: 2.5rem;
  --text-4xl: 3.5rem;
}
```

---

## Images

Mismatched or generic images can drag down even the best color and font choices. Images deserve as much attention as the rest of the brand.

### Three Rules for Choosing Images

**1. Fit the brand.**
Ask: Is this brand more professional? Relaxed or natural? High-style or editorial? The image style should match. A corporate consulting firm needs different imagery than a surf shop.

**2. Stay consistent.**
All images on the site should look like they were taken by the same photographer at the same photo shoot. Watch for:
- Consistent lighting (don't mix harsh flash with soft natural light)
- Consistent color temperature (don't mix warm golden tones with cool blue tones)
- Consistent style (don't mix candid lifestyle shots with stiff stock photos)

**3. Match the brand colors.**
If a photo's colors are completely off from every other color on the website, it will stand out like a sore thumb. Select or edit images so their color palette feels cohesive with the site's palette.

### Sourcing Images

- **Client-provided photos** are always best when available. They're authentic and unique.
- **Stock photos** are often necessary, especially for clients without big budgets. Good free sources:
  - [Pexels](https://pexels.com)
  - [Unsplash](https://unsplash.com)
  - [Pixabay](https://pixabay.com)
- Refine your eye for stock photos that don't *look* like stock photos. Avoid the classic "business people shaking hands in front of a whiteboard" clichés.
- Consider using image editing to color-grade stock photos so they match the brand palette (adjust hue, saturation, or apply a consistent filter/overlay).

### Practical Guidelines When Building

- **Optimize aggressively.** Use modern formats like WebP instead of massive JPEGs or PNGs. Compress images — the visual difference is often negligible, but the file size difference can be enormous (e.g., several MB down to ~100KB). See the Digital Marketing skill for more on performance.
- Always include descriptive `alt` text for accessibility and SEO.
- Use `loading="lazy"` on images below the fold to improve initial page load.
- Maintain consistent aspect ratios across image grids and galleries so the layout doesn't feel uneven.
- If using hero/banner images, ensure text overlaid on them remains readable (use overlays, gradients, or careful positioning).

---

## Working With Different Client Scenarios

### Client has a complete brand
Your job is to **extend** that brand faithfully across the site. Don't reinvent their colors, fonts, or image style. Use their brand guidelines as your source of truth, and derive any additional styles (hover states, section backgrounds, secondary colors) from what they've already established.

### Client has a partial brand (e.g., just a logo)
This is where brand design really pays off. Use the logo as a starting point to derive a full palette, select complementary fonts, and establish an image style. Present this to the client as a cohesive direction before building.

### Client has no brand at all
You're essentially doing brand design from scratch. Start by asking about their audience, their competitors, and the feeling they want to convey. Then build the palette, typography, and image direction before touching a single page layout. Tools like Canva or Coolors can help you mock up options quickly.

---

## How to Keep Improving

- **Study other sites in the same industry** as what you're building. Notice: How many colors do they use? Are they pairing fonts or using a single font? Do the images feel cohesive?
- **Save screenshots and examples** that catch your eye. Over time, patterns start to jump out, and your decisions stop feeling random. That's how brand design instincts form.
- **Start with simpler tools** like Canva or Kittl. Eventually move to the Adobe Suite (Photoshop for image manipulation, Illustrator for vector graphics/SVGs) or Affinity (a free alternative).
- **Remember: the tools aren't the skill.** The real learning happens when you start paying attention to the design choices around you.

---

## Quick Checklist Before Launching a Site

- [ ] Color palette is intentional (not random) and follows a clear harmony
- [ ] 60-30-10 distribution (or an intentional variation) is applied consistently
- [ ] No more than 2–3 font families are in use
- [ ] Font personalities match the brand's tone
- [ ] Images feel consistent — similar lighting, color temperature, and style
- [ ] Image colors complement the brand palette
- [ ] Stock photos (if used) are high quality and don't feel generic
- [ ] All images are optimized (WebP, compressed, lazy-loaded)
- [ ] Brand feels cohesive across every page, not just the homepage
