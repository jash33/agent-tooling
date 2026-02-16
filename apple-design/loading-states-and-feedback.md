# Feedback & Loading States

> Feedback helps people know what's happening, discover what they can do next, understand the results of actions, and avoid mistakes.

## Guiding Principles

- **Provide clear, consistent feedback at every stage.** As users interact with the product, they should understand what's happening at every moment. Silence breeds confusion.
- **Show content as soon as possible.** Don't make people wait for everything to load before seeing the screen they expect. Display the shell immediately, then progressively fill in content.
- **Keep indicators moving.** A stationary indicator makes people think the process has stalled or the app has frozen.

## Types of Feedback

### Visual Feedback
- **Press/click states**: Every interactive element should show a visible change on interaction — color shift, scale change, or opacity adjustment.
- **Hover states** (desktop): Show that an element is interactive before the user clicks. Subtle background color change, underline for links, or slight elevation.
- **Active/selected states**: Clearly indicate which item, tab, or option is currently selected.
- **Disabled states**: Reduce opacity (typically 40–60%) and remove interactivity. Never let users click a disabled element without explanation.

### Status Communication
- **Success**: Show confirmation that an action completed. Use a checkmark icon, green color (supplemented with text), and a brief message.
- **Error**: Clearly identify what went wrong and what to do about it. Red color (supplemented with icon/text), positioned near the relevant element.
- **Warning**: Amber/yellow to indicate caution. Explain what might happen and how to proceed.
- **Informational**: Blue or neutral tone for non-urgent status updates.

## Progress Indicators

### When to Use Which Type

| Indicator | Use When | Duration Context |
|-----------|----------|-----------------|
| **Spinner** (indeterminate circular) | Background operations, unknown duration, small spaces | < 10 seconds expected |
| **Progress bar** (determinate) | Quantifiable tasks with known duration | > 2 seconds, known endpoint |
| **Skeleton screen** | Initial page/content load | Page first-load |
| **Inline spinner** | Specific element is loading (e.g., button submitting) | < 5 seconds |

### Spinner (Indeterminate)
- Use for background operations or when you can't determine the duration.
- Place near the context they relate to — a spinner in a button, next to a field, or in the area where content will appear.
- **Don't label a spinner** unless the label adds meaningful context. The animation itself communicates "loading."
- **Keep spinners small and unobtrusive.** They should communicate activity without demanding attention.

### Progress Bar (Determinate)
- Use for tasks with measurable progress: file uploads, multi-step processes, data syncing.
- **Report progress accurately.** Never display fake progress just to seem busy.
- If a process stalls, provide feedback explaining the problem and what the user can do.
- When possible, **switch from indeterminate to determinate** once you can estimate duration. Users prefer knowing how long they'll wait.
- Include a **Cancel button** when interrupting the process wouldn't cause negative side effects.
- If canceling would lose progress, offer both **Pause** and **Cancel** options, with the Cancel option showing a confirmation dialog.

### Skeleton Screens
- Display the layout structure immediately with placeholder shapes where content will appear.
- Use subtle pulsing animation on skeleton elements to indicate loading (respect `prefers-reduced-motion`).
- Replace placeholder elements smoothly as real content loads — avoid jarring pops.
- Skeleton screens are superior to blank screens or full-page spinners because they set expectations for the coming content.

```css
/* Skeleton loading animation */
.skeleton {
  background: linear-gradient(90deg, 
    var(--skeleton-base) 25%, 
    var(--skeleton-shine) 50%, 
    var(--skeleton-base) 75%
  );
  background-size: 200% 100%;
  animation: shimmer 1.5s infinite;
}

@media (prefers-reduced-motion: reduce) {
  .skeleton {
    animation: none;
    background: var(--skeleton-base);
  }
}

@keyframes shimmer {
  0% { background-position: 200% 0; }
  100% { background-position: -200% 0; }
}
```

## Loading Best Practices

### Progressive Loading
- **Show the screen immediately.** Don't wait for all data to load before rendering anything.
- Display the navigation, layout structure, and any static content first.
- Load content in priority order: above-the-fold content first, then secondary content, then off-screen content.
- **Preload upcoming content** when you can predict what the user will need (e.g., the next page in a pagination, the detail view of a hovered item).

### Button Loading States
When a button triggers an async action:
1. Immediately show a loading state (spinner replacing or alongside the label).
2. Disable the button to prevent double-submission.
3. Keep the button the same size — don't let it resize and shift layout.
4. On completion, briefly show success feedback before returning to the default state.

### Empty States
- When content hasn't loaded yet, distinguish between "loading" and "empty."
- **Loading**: Show skeleton screens or spinners.
- **Empty** (no content exists): Show a helpful message explaining why it's empty and what the user can do (e.g., "No messages yet. Start a conversation.").
- Never show a blank white screen — that looks like a bug.

### Error Recovery
- If loading fails, show a clear error message with an action to retry.
- Don't replace already-visible content with a full-page error — show the error inline near the failed content.
- Preserve any user input or scroll position on retry.

## Pull-to-Refresh
- On mobile web, pull-to-refresh manually reloads content without waiting for automatic updates.
- Also perform **automatic content updates** periodically — don't make users responsible for every refresh.
- The pull animation itself indicates loading; adding a title label is usually unnecessary.

## Alerts and Confirmations

### Alerts
- Use alerts for **critical information that requires immediate attention**.
- Alerts interrupt the user's flow, so use them sparingly — only when the information can't be communicated in a less intrusive way.
- Provide clear, actionable options. Avoid generic "OK" when more specific labels apply (e.g., "Delete", "Save", "Cancel").

### Confirmation Dialogs
- Require confirmation before destructive or irreversible actions (delete, discard unsaved changes).
- Clearly state the consequences: "This will permanently delete 3 files. This action cannot be undone."
- Use destructive button styling (red) for the destructive option.

### Toast Notifications / Snackbars
- Use for non-critical, transient feedback: "Message sent", "Item saved", "Link copied".
- Auto-dismiss after 3–5 seconds.
- Position consistently (typically bottom-center or top-right).
- Don't stack multiple toasts — replace or queue them.

## Best Practices Summary

| Do | Don't |
|----|-------|
| Show the screen structure immediately (skeleton) | Display a blank screen while loading |
| Use determinate progress for quantifiable tasks | Show fake progress to seem busy |
| Provide inline error feedback near the relevant element | Replace the entire page with a full-screen error |
| Keep spinners moving at all times | Let a spinner stall (implies frozen app) |
| Offer Cancel/Pause for long operations | Trap users in uninterruptible processes |
| Use hover and press states on all interactive elements | Leave interactive elements with no visual feedback |
| Show success confirmation for completed actions | Silently complete actions without feedback |
| Distinguish "loading" from "empty" states | Show the same blank screen for both |
