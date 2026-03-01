# 9 Web Design Hacks — From "Just Okay" to Professional

Personal reference guide. Source: Self-Made Web Designer (YouTube).

The video walks through leveling up a basic hero section step by step. Each hack builds on the last.

---

## 1. Break Up Big Chunks of Text

Users check out the moment they see a wall of copy (Nielsen study).

- Aim for **50–75 characters wide** (~600–700px).
- Add a line break every **2–3 sentences**.
- If a paragraph feels dense, split the last sentence into its own block.
- Look at Apple or Figma's sites — you'll never see a massive paragraph just sitting there.

## 2. Use Bullet Points (with Icons)

Our brains love lists. Bullets give the eye a clear entry point and help users process info fast without digging through paragraphs.

- Convert dense paragraphs into bullet points wherever it makes sense.
- **Level up:** Replace generic bullets with icons. The graphic element helps users organize the content even better.
- This reframing is the difference between a $500 website and a $5,000 website — you're not just putting client content online, you're thinking critically about what's best for the user.

## 3. Use a Consistent Spacing System (8-Point Grid)

"Clean" design = things aren't sized and spaced randomly. There's a rhythm.

**The 8-point grid:** Space elements in multiples of 8 (8, 16, 24, 32, 40…).

Rules:
- **Within a group:** Use a baseline value (e.g., 16px between elements).
- **Between groups:** At least **double** the baseline (e.g., 32px).
- **Between major sections:** Keep the distance consistent (e.g., 104px between nav ↔ text group ↔ image group).

Example from the video:
```
Within text group:     16px
Text group → bullets:  32px (doubled)
Bullets → signup form: 32px (doubled)
Nav ↔ text group:      104px
Text group ↔ image:    104px
```

## 4. Use Ratios for Line Height

Line height = the gap between one line of text and the next.

| Text type | Ratio | Example |
|---|---|---|
| Headers | 1:1 | 100px font → 100px line height |
| Paragraphs/body | 1:1.5 | 30px font → 45px line height |

- Spotify uses ~1:1 for headers and slightly expanded line height for body text (not exactly 1.5, but still adding breathing room).
- 1:1.5 is a starting point — every designer adjusts to taste.

**How to check any site's values:** Right-click → Inspect → select the element → go to "Computed" tab (not Styles) to see the final calculated font-size and line-height.

## 5. Refine Text with Letter Spacing

Fonts ship with default spacing that tries to work everywhere. You can dial it in for your specific layout.

| Text type | Letter spacing | Why |
|---|---|---|
| Display / headers | **Negative** (−1px to −3px) | Tighter = easier to scan, stops people in their tracks |
| Body text | **0px** (default) | Type designer already optimized for legibility |
| CTAs / buttons | **Positive** (+1px to +3px) | Wider = people slow down to read, feels more clickable |

Spotify example: Header letter-spacing is −0.6px. Body text has no computed letter-spacing value (left at default).

## 6. Use Font Super Families

Pairing unrelated fonts is hard — mismatched character sizes and spacing make the eye bounce around.

**Solution:** Use font super families — font sets designed to work together, usually by the same type designer. Styles feel cohesive out of the box.

Free options on Google Fonts:
- **Source family:** Source Sans, Source Serif, Source Code
- **Tato family:** Sans + Slab
- **DM family:** DM Sans, DM Serif

Pick a super family and use the serif for headers and sans for body (or vice versa) — instant cohesion without the guesswork.

## 7. Find Color Palettes with CSS Overview

Instead of randomly hitting spacebar on Coolors, be intentional.

**Workflow:**
1. Build an inspiration board in Figma — screenshots of sites with colors you like, linked back to originals.
2. Visit the inspiration site → open DevTools → click the **three dots** (top-right of DevTools panel) → **More tools → CSS Overview**.
3. Hit "Capture overview" — it lays out all the site's colors, color contrast ratios, typography, and sizing.
4. Grab the colors you want → go to Coolors → add them to a dashboard → export as SVG → pull into Figma as your palette reference.

CSS Overview also shows contrast ratios and font details — useful for more than just color.

## 8. Add Subtle Design Elements

Content is the star. Design elements support, never compete.

**Keep it subtle:** Gradients, soft textured backgrounds, shadows. Don't over-design.

Specific moves from the video:
- **Drop shadow** on images that blend into the background.
- **Rounded buttons and input fields** (pulled from inspiration board).
- **Dotted texture** on the background for depth — but if it competes with text, add a **radial gradient behind the text** to preserve readability.
- **Soft color gradients in corners** (purple, orange) — not loud, just enough to add warmth and dimension.

**The process:** Don't randomly throw elements on. Go back to your inspiration board and find specific treatments that fit your design's style.

## 9. The Squint Test

Taught in design school. Dead simple.

1. Step back from your design.
2. Squint until it gets blurry (or apply a blur filter to a screenshot).
3. Ask: **What stands out?**

- Headlines and CTAs should jump out. If they don't, the page is a blob and the hierarchy isn't working.
- If something important gets lost (like a form field), give it more visual weight — a background color, a border, more contrast.

In the video: the headline and buttons passed the squint test, but the email input field got lost → adding a background to the input field fixed it immediately.

---

## Quick Reference

| Hack | Key Number / Rule |
|---|---|
| Text chunks | 50–75 chars wide (~600–700px), line break every 2–3 sentences |
| Spacing system | 8-point grid. Baseline within groups, 2× between groups, consistent between sections |
| Line height | Headers 1:1, body 1:1.5 |
| Letter spacing | Headers: −1 to −3px · Body: 0px · CTAs: +1 to +3px |
| Image size | Keep ≤300KB, save as WebP (from 50 tips video) |
| Color ratio | 60% neutral / 30% brand / 10% accent for CTAs (from 50 tips video) |

## The Transformation Flow

```
Start:  Basic hero section — "it's fine"

  1. Break up text chunks
  2. Convert to bullet points + icons
  3. Apply 8-point spacing grid
  4. Set line height ratios (1:1 headers, 1:1.5 body)
  5. Tighten header letter spacing, widen CTA spacing
  6. Swap to a font super family (e.g., DM Sans + DM Serif)
  7. Pull intentional color palette via CSS Overview
  8. Add subtle elements (shadows, textures, gradients)
  9. Squint test → fix anything that doesn't pop

End:   "Okay wait, that's actually sick"
```
