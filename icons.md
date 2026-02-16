# Iconography & Imagery

> An effective icon expresses a single concept in ways people instantly understand. Imagery should complement text and enhance the experience without overwhelming it.

## Icons

### Design Principles
- **One concept per icon.** An icon should communicate a single, clear idea. If you need to explain what an icon means, it's not working.
- **Simplicity over detail.** Icons need to be legible at small sizes (16–24px). Reduce detail to essential shapes.
- **Consistency across the set.** All icons in your interface should share the same visual style: stroke weight, corner radius, optical sizing, and level of detail.

### Icon Sizing
| Context | Recommended Size | Notes |
|---------|-----------------|-------|
| Navigation bar / toolbar | 24px | Compact, immediately recognizable |
| Tab bar | 24–28px | Clear at bottom of viewport |
| Inline with text | Match the text's cap height | Use `vertical-align: text-bottom` |
| Feature / section icons | 28–32px | Larger for emphasis |
| Empty state / illustrations | 48–64px | Bigger for visual impact |

- Use consistent sizing within each context. Don't mix 20px and 28px icons in the same toolbar.
- On high-DPI screens, provide 2x assets or use SVGs that scale cleanly.

### Icon Types
| Type | Use | Format |
|------|-----|--------|
| **Outlined** | Default / inactive states, lighter visual weight | SVG with consistent stroke width |
| **Filled** | Active / selected states, heavier visual weight | SVG with filled shapes |
| **Duo-tone** | When a secondary color adds clarity | SVG with two fill colors |

- Use outlined icons by default and filled icons for the selected/active state (e.g., outlined heart → filled heart when favorited).
- Maintain the same icon shape between outlined and filled variants so the icon doesn't appear to "jump" when toggled.

### Icon + Text Pairing
- Whenever possible, pair icons with text labels. Icon-only interfaces create ambiguity.
- Exceptions: universally understood icons (close ✕, search 🔍, menu ☰, home, back arrow) may stand alone, but still benefit from `aria-label`.
- For icon-only buttons, always provide `aria-label` for screen readers.

### SF Symbols Principles (Adapted for Web)
Apple's SF Symbols library embodies these principles that apply to any icon system:
- **Alignment with text**: Icons should sit naturally alongside text at any size, aligning with the baseline and cap height.
- **Weight matching**: Icon stroke weight should correspond to the font weight of adjacent text. Thin text + bold icons (or vice versa) looks unbalanced.
- **Optical sizing**: Smaller icons may need slightly thicker strokes to remain visible; larger icons can use thinner strokes.

## App / Favicon / Logo Icons

### Design Guidelines
- **Instantly recognizable.** The icon should communicate your app's purpose at a glance.
- **Simple, distinctive silhouette.** It should be identifiable even at 16×16px (favicon size).
- **Avoid text in icons.** Text becomes illegible at small sizes.
- **Limit to 2–3 colors** for clarity.
- **Use consistent corner radius** matching the platform convention (Apple uses a superellipse with ~22% corner radius at standard sizes).

### Required Sizes (Web)
| Context | Size | Format |
|---------|------|--------|
| Favicon | 16×16, 32×32 | `.ico` or `.png` |
| Apple touch icon | 180×180 | `.png` |
| PWA icon | 192×192, 512×512 | `.png` |
| Open Graph / social sharing | 1200×630 | `.png` or `.jpg` |

## Images

### Quality
- Source imagery at the highest available quality. Downscale rather than upscale.
- For responsive images, provide multiple resolutions using `srcset`:
  ```html
  <img src="photo-800w.jpg"
       srcset="photo-400w.jpg 400w, photo-800w.jpg 800w, photo-1200w.jpg 1200w"
       sizes="(max-width: 600px) 400px, 800px"
       alt="Description of the image">
  ```
- Use modern formats (WebP, AVIF) with fallbacks for older browsers.
- Compress images appropriately — balance quality and file size.

### Image Treatment
- **Consistent corner radius** across image containers (typically 8–12px for cards, 50% for avatars).
- Use **aspect ratio containers** to prevent layout shift during loading:
  ```css
  .image-container {
    aspect-ratio: 16 / 9;
    overflow: hidden;
  }
  ```
- Favor `object-fit: cover` for images that fill a container, ensuring they're cropped gracefully.

### Imagery in Dark Mode
- Test all images in both light and dark mode.
- Soften images with white backgrounds when displaying in dark mode — a white image on a dark background glows uncomfortably.
- Consider providing alternate versions of illustrations for dark mode.
- Logos with dark text may need inverted or alternate versions for dark backgrounds.

### Alt Text
- Every meaningful image needs descriptive `alt` text.
- Decorative images should have `alt=""` (empty alt) so screen readers skip them.
- Alt text should describe the image's content or function, not just its appearance: "Chart showing revenue growing 40% over Q3" not "Image of a chart."

### Lazy Loading
- Use `loading="lazy"` for images below the fold.
- Never lazy-load the hero image or above-the-fold content — it should load immediately.
- Provide a low-resolution placeholder or dominant color background while the full image loads.

## Best Practices Summary

| Do | Don't |
|----|-------|
| Use simple, single-concept icons | Create overly detailed icons that are illegible at small sizes |
| Pair icons with text labels when possible | Use icon-only buttons without aria-labels |
| Maintain consistent icon style (stroke weight, radius) | Mix different icon styles in the same interface |
| Provide multiple image resolutions with srcset | Serve a single high-res image to all devices |
| Add alt text to all meaningful images | Leave images without alt attributes |
| Use aspect-ratio containers to prevent layout shift | Let images cause content jumps during loading |
| Test images in both light and dark modes | Ignore how images look on dark backgrounds |
| Use filled vs. outlined icons to show state | Change the icon shape entirely between states |
