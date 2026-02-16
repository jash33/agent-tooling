# Accessibility

> Accessible user interfaces empower everyone to have a great experience with your app. Approximately 1 in 4 adults has a disability — accessibility is not an edge case.

## Guiding Principles

- **Design for everyone from the start.** Accessibility is not an add-on phase. Think about people with disabilities from the beginning of design. Choices that help users with disabilities — like larger tap targets, clear text, and descriptive labels — help everyone.
- **Offer multiple ways to interact.** Users rely on diverse assistive technologies: screen readers, keyboard navigation, voice control, switch access. Every primary action must be achievable through multiple interaction modes.
- **Don't rely on any single sensory channel.** If information is conveyed through color, also convey it through text or icons. If feedback is given through sound, also provide visual confirmation.

## Color and Contrast

### Contrast Requirements
| Element | Minimum Ratio (WCAG AA) | Enhanced (WCAG AAA) |
|---------|------------------------|---------------------|
| Normal text (< 18px / 14px bold) | 4.5:1 | 7:1 |
| Large text (≥ 18px / 14px bold) | 3:1 | 4.5:1 |
| UI components (borders, icons) | 3:1 | — |
| Focus indicators | 3:1 | — |

- Test contrast in **both light and dark modes**, and with the "Increase Contrast" accessibility setting enabled.
- Smaller or lighter-weight text requires even greater contrast to remain legible.
- Gray-on-black in dark mode is a common failure — validate every text/background combination.

### Color Independence
- **Never use color as the only way** to differentiate objects, communicate information, or indicate states.
- Pair color with text labels, icons, underlines, patterns, or shape changes.
- Examples: error states should show a red border AND an error message; success states should show green AND a checkmark icon AND text.
- Test with color blindness simulation tools. Approximately 8% of men and 0.5% of women have some form of color vision deficiency.

### System / Semantic Colors
- Prefer semantic system colors that respond correctly to "Invert Colors" and "Increase Contrast" settings.
- Avoid color combinations as the only way to distinguish between two states or values.

## Keyboard Navigation

### Full Keyboard Accessibility
- **Every interactive element must be reachable and usable via keyboard alone** — Tab, Shift+Tab, Enter, Space, Arrow keys, Escape.
- Maintain a **logical tab order** that follows the visual reading order (typically left-to-right, top-to-bottom).
- Never create keyboard traps — users must be able to move freely in and out of any component.

### Focus Indicators
- **Visible focus indicators are non-negotiable.** Users must always be able to see which element is currently focused.
- Use a high-contrast outline (minimum 3:1 contrast ratio against adjacent colors):
  ```css
  :focus-visible {
    outline: 2px solid var(--color-accent);
    outline-offset: 2px;
  }
  ```
- Never `outline: none` without providing an equivalent visual indicator.
- Apply consistent focus styling across all interactive elements.

### Common Keyboard Patterns
| Component | Expected Keyboard Behavior |
|-----------|--------------------------|
| Buttons | Enter or Space to activate |
| Links | Enter to follow |
| Dropdowns | Space/Enter to open, Arrow keys to navigate, Escape to close |
| Modals | Escape to dismiss, focus trapped within modal while open |
| Tabs | Arrow keys to switch, Tab to move to tab content |
| Menus | Arrow keys to navigate items, Enter to select, Escape to close |

## Screen Reader Support

### Semantic HTML
- Use proper HTML elements: `<button>`, `<a>`, `<nav>`, `<main>`, `<header>`, `<footer>`, `<article>`, `<section>`, `<h1>`–`<h6>`.
- Semantic HTML provides built-in accessibility information. Screen readers know how to handle a `<button>` — they don't know what a `<div onclick>` is.

### ARIA Labels
- Provide `aria-label` for interactive elements whose purpose isn't clear from visible text (e.g., icon-only buttons):
  ```html
  <button aria-label="Close dialog">
    <svg><!-- X icon --></svg>
  </button>
  ```
- Use `aria-labelledby` to associate labels with complex components.
- Provide `aria-describedby` for additional context (e.g., linking an input to its error message).

### Landmark Regions
- Use ARIA landmarks or semantic HTML to define page regions: `<nav>`, `<main>`, `<aside>`, `<footer>`.
- Screen reader users navigate by landmarks — they jump directly to "main content" or "navigation."

### Live Regions
- Use `aria-live="polite"` for dynamic content updates that should be announced (e.g., toast notifications, search results counts).
- Use `aria-live="assertive"` sparingly — only for urgent updates like errors.

### Accessible Names and Descriptions
- Every interactive element needs an accessible name. Sources (in priority order): visible text content, `aria-label`, `aria-labelledby`, `title` attribute.
- Images: use `alt` text for meaningful images, `alt=""` for decorative images.
- Help screen readers understand relationships: group related elements, specify order, describe links between elements.
- Indicate when a control opens a new context (e.g., append "opens in new window" to external link labels).

## Touch Targets and Click Areas

- **Minimum interactive target size: 44×44px** (CSS pixels). Apple's research shows that smaller targets cause 25%+ error rates.
- If the visual element is smaller than 44×44px, extend the clickable area with padding:
  ```css
  .small-icon-button {
    /* Visual size: 24px */
    width: 24px;
    height: 24px;
    /* Hit area: 44px */
    padding: 10px;
    margin: -10px;
  }
  ```
- Maintain adequate spacing between touch targets to prevent accidental activation of adjacent controls.

## Text Sizing and Dynamic Type

- Support user font-size preferences. Use `rem` units and test at 200% zoom.
- Layouts should not break when text is scaled to 200%.
- Prioritize important content when text is enlarged — headings and body should scale, but decorative elements and labels may scale less.
- Never clip or hide text that overflows due to user-controlled size increases.

## Motion and Vestibular Sensitivity

- Respect `prefers-reduced-motion`:
  ```css
  @media (prefers-reduced-motion: reduce) {
    * {
      animation-duration: 0.01ms !important;
      transition-duration: 0.01ms !important;
    }
  }
  ```
- Replace sliding/zooming transitions with crossfades or instant changes.
- Disable parallax effects, auto-playing animations, and spinning/vortex effects.
- Provide play/pause controls for any auto-advancing content (carousels, video).

## Best Practices Summary

| Do | Don't |
|----|-------|
| Use semantic HTML elements | Build interactive elements from `<div>` and `<span>` |
| Provide visible focus indicators on all interactive elements | Remove outlines without replacement (`outline: none`) |
| Meet 4.5:1 contrast for normal text, 3:1 for large text | Use low-contrast text for aesthetics |
| Pair color with text/icons to convey meaning | Use color alone to communicate status |
| Make all functionality keyboard-accessible | Require mouse/touch for essential actions |
| Provide `alt` text for meaningful images | Leave images without alt attributes |
| Use `aria-label` for icon-only buttons | Use icon buttons with no accessible name |
| Support 200% text zoom without layout breakage | Use fixed layouts that clip enlarged text |
| Respect `prefers-reduced-motion` | Force animations on all users |
| Ensure 44×44px minimum touch/click targets | Use tiny touch targets (< 30px) |
