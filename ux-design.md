---
name: ux-design
description: Use this skill when designing page layouts, structuring navigation, building user flows, or ensuring accessibility on client websites. Covers visual hierarchy, user flow design, user testing methods, and accessibility standards. Apply when laying out pages, designing CTAs, structuring multi-page flows, or auditing a site's usability. Also relevant when working with Figma mockups or prototypes.
---

# UX Design for Client Websites

UX stands for **User Experience** — it's how people move through a site, how they understand it, and how they know what to do next. It is distinct from UI (User Interface), which is the visual design — how the site looks. UX is the invisible instruction manual for a website: when it's clear, people move through the site easily; when it's confusing, everything falls apart no matter how good it looks.

No matter how good the brand is, if a website is hard to use, people aren't going to stick around.

---

## The Curse of Knowledge

At the core of good UX is understanding the user's perspective. The fundamental problem is the **curse of knowledge**: the site makes perfect sense to you because you built it. But if you handed it to a random stranger, they'd immediately run into things that make zero sense.

This happens on almost every project, regardless of experience level. The solution is always **real user testing** (covered below), but the awareness itself changes how you design. Every time you make a layout decision, ask: "Would someone who has never seen this site know what to do here?"

---

## Visual Hierarchy

Visual hierarchy is how you guide someone's attention using size, contrast, color, spacing, and grouping. It determines what people notice first, then second, then third.

**The core principle: if everything looks equally important, nothing feels important.**

### Tools of Visual Hierarchy

| Tool | How It Works | Example |
|------|-------------|---------|
| **Size** | Larger elements draw attention first | Hero headlines vs. body text |
| **Contrast** | High contrast elements stand out from their surroundings | Dark button on a light background |
| **Color** | Brand/accent colors draw the eye, especially when used sparingly | A single orange CTA button on a neutral page |
| **Spacing** | White space isolates and emphasizes elements | A testimonial with generous padding around it |
| **Grouping** | Related items placed together are perceived as a unit | An icon + heading + description forming a "feature card" |
| **Position** | Top-left (in LTR languages) and center get the most natural attention | Logo top-left, main CTA centered in the hero |

### Practical Guidelines When Building

- **Every section should have a clear focal point.** When you look at a section, there should be one element that your eye goes to first. If you can't identify it, the hierarchy is weak.
- **Headings do the heavy lifting.** Users scan headings before reading anything else. Make sure your heading hierarchy (H1 → H2 → H3) tells a coherent story even if the user reads nothing else.
- **CTAs (calls to action) must stand out.** Use the accent color, make them large enough to notice, give them whitespace, and use action-oriented text ("Get Started" not "Submit").
- **Don't let decorative elements compete with functional ones.** Background patterns, illustrations, and animations should support the content, not fight with it for attention.
- **Use consistent visual patterns.** If feature cards look one way on the homepage, they should look the same way on every page. Consistency reduces cognitive load.

---

## User Flows

A website isn't a static poster — it's an interactive experience. You're not just building pages; you're creating a path for someone to follow from the moment they land on the site to the moment they take the desired action (book a service, buy a product, fill out a form).

Think of a user flow like a **GPS for the website**. If the directions aren't clear, users get frustrated and leave.

### Designing User Flows: Work Backwards

The best way to design a user flow is to **start at the final destination** and trace the path backwards:

1. **Identify the end goal.** What's the single most important action we want the user to take? (e.g., checkout confirmation, thank-you page after form submission, booking confirmation)
2. **Trace backwards to entry.** What page/section comes right before that? And before that? Keep going until you reach the entry point (usually the homepage or a landing page).
3. **Identify every decision point.** At each step, what does the user need to understand or decide in order to move forward?
4. **Remove dead ends.** If there's any point along the path where the user could get stuck, confused, or distracted — fix it.
5. **Make the next step obvious at every point.** The user should never have to wonder "what do I do now?"

### Common User Flow Problems

- **Dead ends**: Pages with no clear next action. Every page should guide the user somewhere.
- **Too many choices**: When a user is presented with 8 equally weighted options, they often choose none. Limit choices and highlight the primary action.
- **Buried CTAs**: The call to action is below the fold, hidden in a sidebar, or styled like regular text. Users won't hunt for it.
- **Friction in forms**: Too many fields, confusing labels, no indication of progress. Keep forms as short as possible and only ask for what's truly necessary.
- **Unclear navigation**: If users can't figure out how to get to a specific page from the main nav, the information architecture needs work.

### Practical Guidelines When Building

- Keep the **primary navigation simple**. 5–7 top-level items is a good range. If you need more, use dropdowns or group into categories.
- On every page, ask: "What is the ONE thing I want the user to do here?" Then make that action the most visually prominent element.
- Use **breadcrumbs** on deeper pages so users always know where they are in the site structure.
- For multi-step processes (checkout, onboarding, multi-page forms), show a **progress indicator** so users know how far along they are.
- **Mobile-first flow design**: On mobile, the flow is linear (top to bottom). Design the flow for mobile first, then adapt for desktop — not the other way around.

---

## User Testing

User testing is the single best way to uncover UX problems, and it's also the best way to learn good UX design. You don't need big budgets — even informal testing is enormously valuable.

### How to Run a Simple User Test

1. **Find someone not connected to the project.** A friend, family member, or acquaintance — anyone who hasn't seen the site before.
2. **Have them scroll through the homepage and think out loud.** Ask them to narrate:
   - What are you looking at?
   - How does this feel?
   - What would you want to do next?
3. **Give them a specific task.** "Sign up for a call," "Find the pricing page," or "Add a product to the cart and check out."
4. **Watch and take notes.** Don't guide them. Don't explain things. Just observe where they hesitate, get confused, or miss something.
5. **Identify the gaps.** You will quickly spot assumptions you didn't even realize you were making.

### Why This Works So Well for Learning

You'll be dying inside when the user doesn't see that button you thought was really obvious. That pain is the best UX teacher you'll ever have. Every time you test, you get better at thinking like a user. You start writing clearer sections, simplifying layouts, and anticipating confusion before it happens.

### When Building With Claude Code

Even when you can't do live user testing, you can apply the same mindset:

- After building a page, step back and look at it as if you've never seen it before. Can you tell what the page is about within 3 seconds?
- Check that every section has a clear purpose and an obvious next action.
- Test the full flow end-to-end: from landing on the homepage to completing the primary action. Note any point where you have to think about what to do next — those are friction points.

---

## Accessibility

Accessibility ensures the site works for **every user**, including people with visual impairments, motor limitations, cognitive differences, and those using assistive technologies. The best part: when a site is highly accessible, it's better for everyone.

### Text Contrast

Just because text looks readable to you doesn't mean it passes accessibility standards. There are defined contrast ratios:

| Text Size | Minimum Contrast Ratio (WCAG AA) |
|-----------|----------------------------------|
| **Small text** (under ~18px regular / ~14px bold) | **4.5:1** |
| **Large text** (18px+ regular / 14px+ bold) | **3:1** |

**How to check contrast:**
- In Chrome DevTools, click the element inspector icon (dotted box with arrow), then hover over any text. Chrome will show whether the contrast passes.
- Online tools: [WebAIM Contrast Checker](https://webaim.org/resources/contrastchecker/), [Coolors Contrast Checker](https://coolors.co/contrast-checker)
- When selecting colors in your palette, test contrast early — don't discover problems after the whole site is built.

### Alt Text for Images

All meaningful images should include `alt` text so that screen readers can describe what's on the page to users who can't see it.

```html
<!-- Good: descriptive and specific -->
<img src="team-photo.webp" alt="The Acme Design team gathered around a whiteboard during a brainstorming session">

<!-- Bad: vague or unhelpful -->
<img src="team-photo.webp" alt="photo">
<img src="team-photo.webp" alt="image">

<!-- Decorative images that don't convey information should have empty alt -->
<img src="decorative-swirl.svg" alt="">
```

Guidelines for writing alt text:
- **Be specific and descriptive.** Describe what's in the image, not just that an image exists.
- **Keep it concise.** Usually 1–2 sentences is enough.
- **Don't start with "Image of..." or "Photo of..."** — screen readers already announce it as an image.
- **For decorative images** (backgrounds, visual separators, icons that are next to text labels), use `alt=""` so screen readers skip them.

### Keyboard Navigation

The site should be fully navigable using only a keyboard — no mouse required. This matters for users with motor limitations and for power users who prefer keyboard navigation.

Key requirements:
- **All interactive elements must be focusable.** Links, buttons, form fields, and custom interactive components should be reachable via Tab key.
- **Focus indicators must be visible.** Don't remove the default focus outline (`outline: none`) without providing an equally visible alternative. Users need to see where they are.
- **Logical tab order.** Focus should move through the page in a natural reading order (generally top-to-bottom, left-to-right in LTR languages). Don't use `tabindex` values greater than 0 — they create confusing jump-around behavior.
- **Skip navigation links.** On pages with complex headers/navs, include a "Skip to main content" link as the first focusable element so keyboard users don't have to tab through the entire nav on every page.

```html
<!-- Skip navigation link -->
<a href="#main-content" class="skip-link">Skip to main content</a>

<!-- Style it to be visually hidden until focused -->
<style>
.skip-link {
  position: absolute;
  left: -9999px;
  top: auto;
}
.skip-link:focus {
  position: static;
  left: auto;
}
</style>
```

### Semantic HTML

Using the correct HTML elements isn't just good for SEO — it's essential for accessibility:

- Use `<nav>` for navigation sections
- Use `<main>` for the primary content area
- Use `<header>` and `<footer>` for page header/footer
- Use `<button>` for actions and `<a>` for navigation (don't use `<div>` with click handlers)
- Use `<label>` elements properly associated with form inputs
- Use `aria-label` or `aria-labelledby` when the visual context is clear to sighted users but not to screen reader users

### Practical Accessibility Checklist

- [ ] All text meets minimum contrast ratios (4.5:1 for small text, 3:1 for large)
- [ ] All meaningful images have descriptive alt text
- [ ] Decorative images have `alt=""`
- [ ] The entire site is navigable by keyboard alone
- [ ] Focus indicators are visible on all interactive elements
- [ ] Semantic HTML elements are used correctly
- [ ] Form inputs have associated labels
- [ ] Skip navigation link is present on complex pages
- [ ] Color is never the only means of conveying information (e.g., don't rely solely on red/green to indicate error/success — add icons or text)
- [ ] Interactive elements are large enough to tap on mobile (minimum 44x44px touch target)

---

## Figma in the Workflow

Figma is the industry standard tool for UX design. Many web designers use Figma for brand design, graphic design, and everything visual.

### Why Design Before You Build

Designing in Figma (or any design tool) before developing saves significant time and headaches:

- **Faster iteration.** Moving boxes around in Figma is much faster than restructuring code.
- **Client approval.** You can get sign-off on layouts and flows before writing a single line of code.
- **Prototyping.** Figma prototypes can feel and work like a real website, letting you test user flows before they're built.
- **Design system creation.** You can establish your color palette, typography scale, spacing system, and component library in one place, then reference it during development.

### When Using Claude Code

If working from a Figma design, extract:
- The exact color values (hex/RGB)
- Font families, sizes, and weights used
- Spacing patterns (padding, margins, gaps)
- Component structures (cards, buttons, nav patterns)
- Responsive breakpoints and how layouts change

Then implement these consistently in code. A design system defined in CSS custom properties makes this much easier to maintain.

---

## Quick UX Review Checklist

Run through this before considering a page "done":

- [ ] The page's purpose is clear within 3 seconds of landing
- [ ] There is one obvious primary action (CTA) per page/section
- [ ] The visual hierarchy guides the eye in the intended order
- [ ] Navigation is simple and the user always knows where they are
- [ ] User flow from entry to conversion has no dead ends or confusion
- [ ] Forms are as short as possible with clear labels
- [ ] The site works fully with keyboard navigation
- [ ] Contrast ratios pass WCAG AA standards
- [ ] All images have appropriate alt text
- [ ] Mobile experience is just as clear as desktop
- [ ] No content shifts unexpectedly when the page loads
