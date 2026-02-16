# Navigation

> Great navigation feels invisible — users always know where they are, how they got there, and how to get where they want to go.

## Guiding Principles

- **Provide a clear, predictable structure.** Users should always understand the app's hierarchy and their current position within it.
- **Use familiar patterns.** Leverage established navigation conventions so users can apply existing knowledge rather than learning a new system.
- **Minimize navigation depth.** Keep information architecture flat when possible. Deep hierarchies (5+ levels) disorient users.

## Navigation Patterns

### Tab Bar / Top-Level Navigation
- Use for **2–5 top-level sections** of your application.
- Tabs represent **mutually exclusive, peer content areas** — switching tabs doesn't imply hierarchy.
- **Always keep the tab bar visible** so users can switch sections at any time. The only exception: hide it during immersive/fullscreen experiences (media playback, editing).
- On mobile web: place the tab bar at the bottom of the viewport (thumb-reachable). On desktop: place tabs at the top or in a left sidebar.
- Each tab should have an icon and a short text label. Icon-only tabs are ambiguous.
- Preserve state: when a user switches tabs and returns, they should see the same state they left.

### Navigation Bar / Header
- Displays the current location title and provides back navigation.
- The **back button** should always be present when the user has navigated deeper into a hierarchy. Label it with the title of the previous view (e.g., "← Settings") rather than just "← Back" when space permits.
- Place the primary title centered or left-aligned in the navigation bar.
- Optionally include action buttons on the right side (e.g., "Edit", "Done", "Share").

### Sidebar Navigation
- Best for applications with **6+ sections** or complex information architectures.
- On desktop: persistent sidebar with section labels and optional icons.
- On mobile: collapsible sidebar (hamburger menu) or convert to bottom tab bar.
- Clearly indicate the currently selected section (highlight, background color, bold weight).
- Group related navigation items with section dividers or headers.

### Breadcrumbs
- Use for deep hierarchies (e-commerce categories, documentation) where users need to understand and navigate the full path.
- Display the full path from root to current page. Each segment is a clickable link.
- Breadcrumbs supplement primary navigation — they should never be the only way to navigate.

### Hierarchical / Drill-Down
- Content organized in a tree structure: users tap/click to go deeper, use the back button to return.
- Each level should clearly indicate that deeper content exists (chevron icons, preview text).
- Maintain context: show the parent title in the header when viewing child content.

## Search

### Search Bar Placement
- Place the search bar in a prominent, discoverable location — typically at the top of the content area or in the navigation bar.
- For content-heavy apps, search should be one of the first things users see.

### Search Behavior
- Show suggestions and recent searches as the user types.
- Display results incrementally — don't wait for a full result set before showing anything.
- Provide clear messaging when no results are found, with suggestions to broaden the search.
- Remember and display recent search history (with a clear option to delete it).
- On mobile, the search field can be revealed on pull-down or scroll-to-top gestures.

### Filtering and Sorting
- Place filter and sort controls near the content they affect.
- Show the number of results and active filter state prominently.
- Make it easy to clear all filters and return to the unfiltered view.

## Modals and Sheets

### When to Use Modals
- For **focused tasks** that require user input or decision before returning to the main context: forms, confirmations, settings changes.
- **Don't use modals for content browsing** or displaying information that doesn't require action.

### Modal Best Practices
- Provide a clear dismissal mechanism: close button (✕) in the top corner, and Escape key.
- **Trap focus within the modal** while it's open — Tab should cycle through modal elements only.
- Dim or blur the background to indicate the modal is a foreground layer.
- Don't stack modals on top of modals. If a second action is needed, replace the current modal's content.
- On mobile, modals should slide up from the bottom as sheets. On desktop, centered dialog boxes work well.

### Sheet Behavior
- Sheets should be dismissible by clicking outside (on the dimmed background) for non-critical tasks.
- For tasks with unsaved changes, show a confirmation before dismissing.
- Sheets can be draggable to resize or dismiss on mobile (swipe down to close).

## URL and State Management (Web-Specific)

### URL Reflects State
- Navigation changes should update the URL. Users expect to share links, bookmark pages, and use the browser back button.
- Every distinct view or content state should have a unique, readable URL.
- Support browser back/forward navigation — never break the browser's history stack.

### Deep Linking
- Every important view should be directly accessible via URL without requiring sequential navigation from the home page.
- When a user arrives via deep link, provide sufficient context (breadcrumbs, back button to parent) so they aren't disoriented.

## Navigation Don'ts

- **Don't hide primary navigation behind a hamburger menu on desktop.** Space permits showing it directly.
- **Don't use more than 5 tabs** in a mobile bottom tab bar — it becomes crowded and hard to tap.
- **Don't change the navigation structure contextually.** The same global navigation should appear on every page.
- **Don't use gestures as the only way to navigate.** Every gesture-based navigation must have an equivalent button/link.
- **Don't open links in new tabs/windows by default.** This disrupts the user's mental model of navigation. Only open in new tabs when the user explicitly requests it (Ctrl/Cmd+click) or when leaving the app (external links, with clear indication).

## Best Practices Summary

| Do | Don't |
|----|-------|
| Keep tab bars visible for global navigation | Hide global navigation behind interactions |
| Provide clear back navigation at every level | Strand users with no way to go back |
| Update URLs to reflect navigation state | Break browser back/forward behavior |
| Show the user's current location clearly | Leave users guessing which section they're in |
| Use modals for focused tasks requiring decisions | Use modals for content browsing |
| Trap focus inside open modals | Allow tab navigation to escape the modal |
| Support deep linking to all major views | Require sequential navigation from the homepage |
| Keep navigation hierarchy flat (3 levels max ideal) | Build deep 5+ level navigation trees |
