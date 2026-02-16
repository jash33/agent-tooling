# Layout

> A consistent layout that adapts to various contexts makes your experience more approachable and helps people enjoy it on all their devices.

## Guiding Principles

- **Design for adaptability.** Your layout should display the same content across contexts — different screen sizes, orientations, and window widths — while gracefully adapting arrangement and density.
- **Content first.** Primary content must be clear at its default size. Users should never need to scroll horizontally or zoom to read important text or see primary images.
- **Respect system conventions.** Use safe areas, standard margins, and layout guides. These ensure content isn't clipped by device features or obscured by system UI.

## Responsive Design

### Fluid Layouts
- Avoid fixed-width layouts. Use relative units (`%`, `vw`, `rem`, `fr`) so the interface adapts naturally to the viewport.
- Design for a minimum viewport width (typically 320px for mobile), then scale up using breakpoints.
- Test at the largest and smallest layouts to validate that content remains accessible and aesthetically balanced.

### Breakpoints and Adaptation
- Use size classes conceptually: **compact** (narrow, single-column), **regular** (wide, multi-column).
- At compact widths, stack content vertically. At regular widths, use side-by-side layouts (split views, sidebars).
- When resizing, display the same content — don't hide primary information at smaller sizes.

### Content Width and Readability
- **Restrict text line length** for readability. Optimal reading width is 50–75 characters per line (roughly 500–700px for body text). Use a `max-width` on text containers.
- On wide screens, center the content column or use margins rather than stretching text edge-to-edge.
- Consider Apple's "readable content guide" concept: the system automatically constrains text width for comfortable reading on large screens.

## Spacing and Margins

### Standard Margins
- Apply consistent margins around content. A common baseline is 16px on compact layouts, scaling to 20–24px on wider viewports.
- Full-width elements (like images or hero sections) can bleed to the edges, but text and interactive content should respect margins.

### Whitespace as a Tool
- Use generous, consistent whitespace (padding and margins) to visually group related elements and separate distinct sections.
- Whitespace reduces clutter and makes the main content the focal point.
- Don't just fill space — every gap should serve grouping or emphasis.

### Spacing Between Elements
- Maintain consistent spacing between UI elements. Use a spacing scale (e.g., 4px, 8px, 12px, 16px, 24px, 32px, 48px) for rhythm and alignment.
- Adequate spacing between interactive elements prevents accidental taps/clicks and reduces visual noise.

## Grid Systems

- Use a grid to align and organize content. Apple's layouts often use flexible column grids that adapt to width.
- On wider screens, use multi-column grids (2–4 columns). On narrow screens, collapse to a single column.
- Maintain consistent gutters (gaps between grid columns), typically 16–20px.

## Safe Areas and Edge Handling

While "safe areas" are primarily a native concept (avoiding notches, home indicators), the web equivalent applies to:
- **Viewport-relative positioning**: Avoid placing interactive controls at the very bottom or top edges of the viewport where they may be obscured by browser chrome, mobile toolbars, or device-specific UI.
- **`env(safe-area-inset-*)`**: On iOS Safari, use CSS environment variables to respect device safe areas for PWAs and fullscreen web apps.
- **Scroll containers**: Ensure scrollable content extends fully to edges visually, but keep interactive elements away from edges.

## Full-Width Buttons
- A button that extends to the edges of the screen may not look like a button. Respect standard margins on full-width buttons.
- Full-width action buttons at the bottom of a screen look best with rounded corners and alignment to the bottom safe area.
- On desktop, full-width buttons are rarely appropriate — use contained, predictably-sized buttons instead.

## Best Practices Summary

| Do | Don't |
|----|-------|
| Adapt layout gracefully across viewport sizes | Use fixed-width layouts that break on resize |
| Constrain text width for readability (50–75 chars) | Let body text stretch the full width of a widescreen |
| Use consistent spacing scales | Apply arbitrary or inconsistent padding/margins |
| Extend backgrounds to edges, inset content | Clip or obscure content at viewport boundaries |
| Test at extremes (smallest and largest sizes) | Assume one breakpoint works for all screens |
| Place primary content above the fold | Hide critical content behind scrolling |
