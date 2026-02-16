# Typography

> Your typographic choices help display legible text, convey an information hierarchy, communicate important content, and express your brand.

## Guiding Principles

- **Legibility is non-negotiable.** Every piece of text must be comfortably readable at its displayed size, in all lighting conditions and on all devices.
- **Hierarchy guides the eye.** Use font weight, size, and color to lead users through content — from headlines to body to captions — without ambiguity.
- **Restraint is sophistication.** Limit the number of typefaces and styles. One typeface family with a few weights and sizes produces a cleaner result than multiple competing fonts.

## Font Selection

### System Fonts
- Apple uses the **San Francisco** (SF) family: a sans-serif designed for screen legibility across all sizes.
  - **SF Pro** for general UI text.
  - **SF Mono** for code and monospaced contexts.
  - **New York** (NY) for a serif alternative that pairs well with SF.
- For web, use the system font stack to inherit the platform's native typeface:
  ```css
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, 
               "Helvetica Neue", Arial, sans-serif;
  ```
- This ensures text feels native on every platform and avoids font-loading performance costs.

### Custom Fonts
- If using a custom font, ensure it meets accessibility standards for legibility.
- Avoid decorative or script fonts for body text or UI labels.
- Limit to **one typeface family** (with its weight variants) plus optionally one accent/display typeface.

## Font Sizing

### Minimum Sizes
- **Body text**: minimum 16px (1rem) on web. Apple recommends 11pt as an absolute floor; for web readability at typical viewing distances, 14–16px is the practical minimum.
- **Captions and footnotes**: minimum 12px, but use sparingly and only for non-critical information.
- **Buttons and interactive labels**: at least 14px, preferably 16px.

### Sizing Scale (Text Styles)
Apple defines a hierarchy of text styles. Translate them to web with a consistent type scale:

| Text Style | Suggested Web Size | Weight | Use Case |
|------------|-------------------|--------|----------|
| Large Title | 34px | Bold | Page or section hero headings |
| Title 1 | 28px | Bold | Primary section headings |
| Title 2 | 22px | Bold | Subsection headings |
| Title 3 | 20px | Semibold | Card or group headings |
| Headline | 17px | Semibold | List item titles, emphasized labels |
| Body | 17px (16px web) | Regular | Primary content text |
| Callout | 16px | Regular | Supporting descriptive text |
| Subheadline | 15px | Regular | Metadata, secondary labels |
| Footnote | 13px | Regular | Timestamps, fine print |
| Caption 1 | 12px | Regular | Image captions, annotations |
| Caption 2 | 11px | Regular | Smallest permissible text |

### Dynamic Type / User-Controlled Sizing
- Support user font-size preferences. Use `rem` or `em` units so text scales with browser/OS text-size settings.
- **Never hardcode pixel sizes** for text in a way that prevents user scaling.
- When users increase text size, preserve the relative hierarchy — headlines should still be visually larger than body text.
- Prioritize important content when responding to size changes. Not every piece of text needs to scale equally.

## Font Weight and Emphasis

### Weight Guidelines
- **Avoid light and ultralight weights** for body text. They reduce readability, especially on lower-resolution screens or in low-contrast environments.
- Prefer **Regular** for body text, **Medium** or **Semibold** for emphasis, and **Bold** for headings.
- Use weight differences to create hierarchy — this is more effective and elegant than relying on size alone.

### Emphasis and Highlighting
- Use weight, size, and color to emphasize important information.
- Italics can highlight quotes, terms, or titles, but avoid for large blocks of text.
- **Don't over-bold.** If everything is bold, nothing stands out.

## Line Height (Leading)

- For body text in paragraphs, use a line height of **1.4–1.6×** the font size.
- **Minimum**: 1.3× for paragraphs to prevent crowding.
- For wide columns or long passages, increase line height (loose leading) to help readers track across lines.
- For constrained spaces (list rows, single-line labels), tighter leading is acceptable, but avoid tight leading for 3+ lines of text.

## Tracking (Letter Spacing)

- The system font dynamically adjusts tracking per point size. For web, you generally don't need to manually adjust letter-spacing for body text.
- **Headings** at large sizes may benefit from slightly tighter tracking (-0.02em to -0.01em).
- **Small text** (captions, footnotes) may benefit from slightly more open tracking (+0.01em to +0.02em) for legibility.
- **All-caps text** should always have increased letter-spacing (+0.05em to +0.1em).

## Line Length

- Restrict line lengths to **50–75 characters per line** for comfortable reading on all devices.
- On wide screens, use `max-width` on text containers rather than letting text span the full viewport.
- For mobile, 35–50 characters per line is optimal for quick scanning.

## Text Alignment

- Use **left-aligned text** (or start-aligned for RTL languages) for body content. It preserves predictable word spacing.
- **Avoid justified text** on the web — it creates uneven word spacing, especially without proper hyphenation support.
- Center alignment is acceptable for short headings, hero text, or call-to-action labels, but never for paragraphs.

## Best Practices Summary

| Do | Don't |
|----|-------|
| Use a consistent type scale with clear hierarchy | Mix many unrelated font sizes randomly |
| Set body text ≥ 16px on web | Use 10–12px for primary content |
| Use `rem` units for scalability | Hardcode `px` that blocks user font-size preferences |
| Limit to 1–2 typeface families | Use 4+ different fonts on one page |
| Prefer medium/semibold for emphasis | Rely on ultralight or thin weights for body |
| Test readability at largest and smallest text sizes | Assume your default size works for all users |
| Keep line length at 50–75 characters | Let text span 120+ characters on widescreen |
