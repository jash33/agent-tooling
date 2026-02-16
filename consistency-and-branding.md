# Branding

> Apps express their unique brand identity in ways that make them instantly recognizable while feeling at home on the platform and giving people a consistent experience.

## Guiding Principles

- **Brand should enhance, not override.** Your brand identity should feel like a natural layer on top of familiar design patterns — not a replacement for them.
- **Consistency breeds trust.** Maintain your brand elements consistently across all touchpoints, but always defer to usability and platform conventions when they conflict with brand expression.
- **Subtlety is sophistication.** The most effective brand expressions are restrained. A consistent accent color, a well-chosen typeface, and a distinctive icon do more than animated logos and custom UI controls.

## Brand Expression Points

### Where to Express Brand
| Element | Brand Opportunity | Caution |
|---------|------------------|---------|
| **Accent / primary color** | Strong — use your brand color for interactive elements | Don't use it for everything; reserve for actions |
| **Typography** | Moderate — a custom display font for headings | Don't sacrifice readability for brand fonts |
| **App icon / logo** | Strong — this is your primary brand mark | Keep it simple and recognizable at all sizes |
| **Imagery style** | Strong — consistent photo/illustration style | Don't let imagery overwhelm content |
| **Tone of voice** | Strong — microcopy, labels, error messages | Stay clear and helpful above all |
| **Animation style** | Light — subtle motion personality | Don't create non-standard interaction patterns |
| **Custom components** | Cautious — only when standard patterns don't suffice | Don't reinvent navigation, modals, or buttons |

### Where NOT to Express Brand
- **Standard navigation patterns**: Users expect tabs, back buttons, and sidebars to work the way they work everywhere.
- **Form controls**: Custom-styled checkboxes and selects that look different from platform defaults confuse users and can break accessibility.
- **Error and system states**: Error messages, loading states, and empty states should prioritize clarity over brand personality.
- **Accessibility features**: Never sacrifice contrast, focus indicators, or text sizing for brand aesthetics.

## Color as Brand

- Choose **one primary brand color** and use it as your accent color throughout the interface.
- This color should appear on: primary buttons, active navigation items, links, selected states, toggle controls.
- Ensure the brand color meets contrast requirements (4.5:1 on white backgrounds, 4.5:1 on dark backgrounds). If your brand color is too light for text or too dark for dark-mode buttons, create accessible variants.
- Support the brand color with 1–2 secondary/neutral colors for backgrounds and supporting elements.
- **Don't paint the entire interface in your brand color.** Use it as a strategic accent — its power comes from scarcity.

## Typography as Brand

- A carefully chosen typeface can express brand personality without disrupting usability.
- Use your brand font for **display elements only**: headings, hero text, marketing sections.
- Use the system font stack (or a highly legible sans-serif) for **body text, UI labels, form fields, and navigation**.
- If using a custom font, ensure it:
  - Has sufficient weight variety (Regular, Medium, Bold at minimum)
  - Is optimized for web (WOFF2 format, subset to used characters)
  - Passes readability tests at body-text sizes
  - Supports all needed character sets and languages

## Content and Tone

- **Microcopy is a brand expression.** The way you write button labels, error messages, empty states, and tooltips contributes to brand personality.
- Be consistent with tone: if your brand is playful, it should be playfully helpful — not playfully confusing.
- Clarity always wins. If a clever brand-voice label sacrifices clarity, rewrite it.
- Example tones:
  - **Professional**: "Your changes have been saved."
  - **Friendly**: "All saved! You're good to go."
  - **Playful**: "Saved it! 🎉" (use sparingly, know your audience)

## Brand Consistency Across Modes

- Your brand should feel the same in light mode, dark mode, and high-contrast mode.
- Define brand color variants for each appearance mode.
- Logo and icon should have variants for light and dark backgrounds.
- Imagery style should remain consistent — if you use warm photography in light mode, maintain warmth in dark mode.

## Custom Components: When and How

Custom UI components can express brand personality, but they come with costs:
- **Increased development effort** for building and maintaining
- **Reduced accessibility** unless carefully implemented
- **User confusion** if the custom control doesn't match platform expectations

### When Custom Components Are Appropriate
- Your app has a unique interaction that no standard pattern handles (e.g., a specialized editor, canvas tool, or visualization).
- The standard component's visual design conflicts severely with your brand (rare — usually styling standard components is sufficient).

### When to Use Standard Components
- **Always** for: navigation, forms, modals, alerts, toggles, selections.
- Standard components come with built-in accessibility, keyboard handling, and user familiarity — custom components must reimplement all of this.

## Best Practices Summary

| Do | Don't |
|----|-------|
| Use brand color as a strategic accent on interactive elements | Paint the entire UI in brand color |
| Use a custom font for headings/display, system font for body | Use a decorative brand font for body text |
| Maintain consistent brand expression across light/dark modes | Define brand colors for only one appearance |
| Let microcopy reflect brand tone while staying clear | Sacrifice clarity for clever brand-voice copy |
| Style standard components to match your brand | Replace standard components with custom ones unless necessary |
| Ensure brand colors meet accessibility contrast minimums | Use inaccessible brand colors for text or UI |
