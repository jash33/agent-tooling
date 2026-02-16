# Color

> Judicious use of color can enhance communication, evoke your brand, provide visual continuity, communicate status and feedback, and help people understand information.

## Guiding Principles

- **Color communicates, it doesn't decorate.** Every color choice should serve a functional purpose — indicating interactivity, showing status, grouping related elements, or establishing hierarchy.
- **Use a limited palette.** A focused set of colors produces a cleaner, more professional result than a rainbow of options.
- **Never rely on color alone.** Always pair color with another indicator (text labels, icons, patterns) so that color-blind users and those in varied lighting conditions can still understand the interface.

## Semantic Color System

Apple's approach to color is **semantic** — colors are named by purpose, not by appearance. This approach maps directly to web design via CSS custom properties:

### Functional Color Roles

| Role | Purpose | Example CSS Variable |
|------|---------|---------------------|
| **Primary / Accent** | Interactive elements, links, primary buttons | `--color-accent` |
| **Destructive** | Delete actions, error states | `--color-destructive` |
| **Success** | Confirmation, completion | `--color-success` |
| **Warning** | Caution states, attention needed | `--color-warning` |
| **Label (Primary)** | Main text, titles | `--color-label` |
| **Label (Secondary)** | Subtitles, metadata | `--color-label-secondary` |
| **Label (Tertiary)** | Placeholders, disabled text | `--color-label-tertiary` |
| **Background (Primary)** | Main page background | `--color-bg` |
| **Background (Secondary)** | Grouped/card backgrounds | `--color-bg-secondary` |
| **Background (Tertiary)** | Inset backgrounds within cards | `--color-bg-tertiary` |
| **Separator** | Dividers between content sections | `--color-separator` |
| **Link** | Hyperlinks and interactive text | `--color-link` |

### Why Semantic Colors Matter
- Semantic tokens decouple your design from specific hex values. When you want to update your palette or support dark mode, you change the token values — not every component.
- They ensure consistency: "destructive" is always red, "interactive" is always your accent color, everywhere in the app.

## Color Usage Guidelines

### Interactivity
- **Reserve your accent color for interactive elements**: buttons, links, toggles, selected states. This trains users to recognize that elements in that color are tappable/clickable.
- **Never use the same color for interactive and non-interactive elements.** If both a decorative heading and a clickable link are the same shade of blue, users won't know where to click.

### Status Communication
- Use established conventions: **red** for errors/destructive, **green** for success, **yellow/amber** for warnings, **blue** for informational.
- Always supplement color with a text label or icon. A red border on an input means nothing to a color-blind user without an error message.

### Branding
- Incorporate your brand color as the accent/primary color, but use it sparingly — primarily for interactive elements and key brand moments.
- Avoid using brand colors for large background areas unless they have sufficient contrast with foreground content.

## Contrast

### Minimum Contrast Ratios (WCAG)
| Element | Minimum Ratio | Recommended Ratio |
|---------|--------------|-------------------|
| Normal text (< 18px) | 4.5:1 | 7:1 |
| Large text (≥ 18px bold or ≥ 24px) | 3:1 | 4.5:1 |
| UI components & graphics | 3:1 | 4.5:1 |
| Focus indicators | 3:1 | — |

- **Test contrast in both light and dark modes.** A common mistake is ensuring sufficient contrast in light mode but forgetting dark mode.
- **Smaller or lighter-weight text needs greater contrast** to remain legible.
- Use tools like WebAIM's contrast checker or browser DevTools to verify ratios.

### High Contrast Mode
- Support the `prefers-contrast: more` media query to increase contrast when users request it.
- In high contrast mode, increase border widths, strengthen text colors, and reduce translucency.

## Color and Appearance Modes

- Support both light and dark appearances. Define color tokens for each mode.
- For every custom color, provide both a light-mode and dark-mode variant.
- Use `prefers-color-scheme` media query to switch palettes automatically:
  ```css
  :root {
    --color-bg: #ffffff;
    --color-label: #000000;
  }
  @media (prefers-color-scheme: dark) {
    :root {
      --color-bg: #000000;
      --color-label: #ffffff;
    }
  }
  ```

## Color Selection Tips

- **Test under varied lighting conditions.** Colors on a monitor in a dark room look different from colors on a phone outdoors.
- **Avoid pure black (#000) on pure white (#fff) for large text areas.** The extreme contrast can cause eye strain for extended reading. Use off-black (#1d1d1f) on off-white (#f5f5f7) for gentler contrast.
- **Use wide color (P3) thoughtfully.** Modern displays support the Display P3 color space for richer, more saturated colors — useful for imagery and accents, but body text should use standard sRGB-safe colors.
- **Don't replicate system semantic colors** with your own definitions unless you have a good reason. Using established system colors ensures visual consistency with the platform.

## Best Practices Summary

| Do | Don't |
|----|-------|
| Use semantic color tokens (by purpose, not hex) | Hardcode hex values throughout your CSS |
| Reserve accent color for interactive elements only | Use the same color for decorative and interactive elements |
| Supplement color with text, icons, or patterns | Rely on color alone to convey meaning |
| Meet WCAG contrast minimums (4.5:1 for text) | Use low-contrast text for aesthetics |
| Provide light and dark mode variants for all colors | Define colors only for one appearance mode |
| Test with color blindness simulation tools | Assume everyone perceives color the same way |
| Use a limited, cohesive palette | Introduce new colors without clear purpose |
