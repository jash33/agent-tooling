# Components

> System components provide a familiar, consistent experience. Use standard patterns so users can apply their existing knowledge, and customize only with intention.

## Buttons

### Button Types
| Type | Use Case | Visual Treatment |
|------|----------|-----------------|
| **Primary** (filled/prominent) | Main action on the page ("Submit", "Save", "Continue") | Filled background with accent color, white text |
| **Secondary** (outlined/tinted) | Alternative or less important actions | Outlined border or tinted background |
| **Tertiary** (text/plain) | Low-emphasis actions ("Cancel", "Skip", "Learn More") | Text-only, accent color, no border or fill |
| **Destructive** | Delete, remove, irreversible actions | Red fill or red text |

### Button Guidelines
- **Label clearly.** Use specific verbs: "Delete Account", "Save Changes", "Add to Cart" — not just "OK" or "Submit."
- **One primary action per view.** Multiple filled/prominent buttons create visual confusion about what to do.
- Minimum touch target: **44×44px**. If the button is visually smaller, extend the clickable area with padding.
- Show **loading state** when the button triggers an async action: replace label with spinner, disable the button to prevent double-clicks, maintain the button's size.
- **Disabled buttons** should be visually distinct (reduced opacity ~40%) and should not be clickable. Consider hiding unavailable actions entirely rather than showing disabled buttons.

### Button Placement
- Primary actions go in the **bottom-right** (for left-to-right languages) or in a prominent fixed position.
- Destructive actions go on the **left** or separated from primary actions.
- In forms, the submit button goes at the end, aligned with the form fields.
- In dialogs, the confirming action is on the right, the canceling action on the left.

## Forms and Inputs

### Text Fields
- Use clear, concise placeholder text to hint at expected input format — but never use placeholder text as a substitute for a label.
- **Always provide a visible label** above or to the left of the field.
- Show validation feedback inline, immediately below the field, as users complete each field (not only on submit).
- Use appropriate input types (`email`, `tel`, `url`, `number`, `date`) to trigger the correct keyboard/input mode on mobile.

### Form Layout
- **Single-column layouts** for forms. Multi-column form layouts reduce completion rates.
- Group related fields (e.g., first name and last name) but keep the overall flow vertical.
- Place labels above fields, not to the left — this works best across all viewport widths.
- Mark required fields clearly. Prefer marking optional fields with "(optional)" rather than using asterisks for required fields.

### Validation
- **Inline validation**: Show errors immediately after a field loses focus, not only on form submit.
- Error messages should explain what went wrong AND how to fix it: "Email must include an @ symbol" not just "Invalid email."
- Use red border/icon plus text for errors. Never use color alone.
- Preserve all user input on validation failure — never clear fields.

### Selection Controls
| Control | Use When |
|---------|----------|
| **Checkbox** | Multiple options can be selected (non-exclusive) |
| **Radio button** | One option from a small set (2–5, exclusive) |
| **Toggle/switch** | Binary on/off setting with immediate effect |
| **Dropdown/select** | One option from a larger set (6+) |
| **Segmented control** | 2–5 mutually exclusive options displayed inline |

- **Toggles** are for settings that take effect immediately. If the change requires confirmation, use a checkbox + submit button instead.
- **Dropdowns** are appropriate when there are too many options for radio buttons, but avoid them for very long lists (100+ items) — use a searchable select instead.

## Lists and Tables

### Lists
- Lists present ordered collections of data in rows.
- Each row should be a clear, scannable unit. Put the most important information (title, primary value) at the start.
- If list items are navigable, indicate so with a chevron (›) or clear interactive styling.
- Support keyboard navigation: Arrow keys to move between items, Enter to select.
- For long lists, implement virtualization/windowing to maintain performance.

### Tables
- Use for structured data with multiple attributes per item.
- **Always include column headers** that clearly describe the data.
- Support sorting by clicking column headers (indicate current sort with arrow icon).
- On narrow screens, consider transforming tables to card layouts or stacked key-value pairs rather than horizontal scrolling.
- Stripe alternating rows or use subtle borders for readability.

## Modals, Sheets, and Dialogs

### Alerts
- For **critical information requiring immediate user decision**.
- Keep the message concise. Title: what happened. Body: what it means. Buttons: what to do.
- Button labels should be specific actions, not "OK"/"Cancel".
- Destructive actions should use a red button style and be positioned away from the primary action.

### Action Sheets
- Present multiple related choices in response to a user action.
- Include a Cancel option at the bottom.
- Use when there are 2–5 choices; for more, consider a different pattern (dropdown, menu).

### Popovers
- A transient view appearing near the trigger element, for contextual actions or information.
- On desktop: positioned near the element that triggered it, with an arrow pointing to the trigger.
- On mobile: may convert to a full-width action sheet.
- Dismiss on click outside or Escape key.

### Sheets/Modals
- See the **Navigation** file for detailed modal guidelines.

## Scroll Views

- Allow vertical scrolling for content that exceeds the viewport. This is the natural pattern — users expect it.
- **Avoid horizontal scrolling** for primary content. If horizontal scrolling is needed (image galleries, data tables), provide clear visual indicators (partial visibility of off-screen content, scroll indicators).
- Consider pull-to-refresh for content that benefits from manual refresh.
- Show scroll position indicators (scrollbar) so users understand their position in long content.

## Disclosure and Progressive Disclosure

- Use expandable/collapsible sections to manage complex information without overwhelming the user.
- Disclosure controls (chevrons, plus/minus icons, expand arrows) should clearly indicate that more content is available.
- The label should describe what will be revealed: "Show advanced options", "View details."
- Animated expand/collapse transitions help users maintain context.

## Cards

- Cards group related content and actions into a contained, scannable unit.
- Each card should be about a single topic or item.
- Consistent sizing and spacing between cards creates visual rhythm.
- If cards are interactive (clickable), the entire card should be the click target, not just a small element within it.
- In a grid of cards, maintain consistent heights or use masonry layout.

## Best Practices Summary

| Do | Don't |
|----|-------|
| Use specific, action-oriented button labels | Use generic labels like "OK" or "Click Here" |
| Limit to one primary (filled) button per view | Show multiple competing primary buttons |
| Provide visible labels for all form fields | Rely on placeholder text as the only label |
| Show inline validation on field blur | Only validate on form submission |
| Use the right control for the choice type | Use checkboxes for mutually exclusive options |
| Include column headers and sort controls on tables | Display table data without headers |
| Make entire cards clickable when they're interactive | Make only a tiny element within a card clickable |
| Provide Cancel/Escape for all dialogs and modals | Trap users in dialogs with no dismissal mechanism |
