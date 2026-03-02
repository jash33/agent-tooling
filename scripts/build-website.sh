#!/bin/bash
#
# Automated Website Build Script
# Runs Claude Code through phases to build a website from intake data.
#
# Usage: ./build-website.sh <intake.yaml> <output-dir>
#
# Phases:
#   1. Foundation - Brand design + UX planning (brand-design.md, ux-design.md)
#   2. Build - Create all pages and components (ux-design.md, brand-design.md)
#   3. SEO - Technical SEO optimization (digital-marketing.md)
#   4. Polish - Refinement and accessibility (design-hacks.md, ux-design.md)
#

set -e

# =============================================================================
# Configuration
# =============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_DIR="${SCRIPT_DIR}/../skills/freelance"

# Skill files
SKILL_BRAND="${SKILLS_DIR}/brand-design.md"
SKILL_UX="${SKILLS_DIR}/ux-design.md"
SKILL_MARKETING="${SKILLS_DIR}/digital-marketing.md"
SKILL_HACKS="${SKILLS_DIR}/design-hacks.md"

# =============================================================================
# Argument Parsing
# =============================================================================

if [ $# -lt 2 ]; then
    echo "Usage: $0 <intake.yaml> <output-dir>"
    echo ""
    echo "Arguments:"
    echo "  intake.yaml   Path to the client intake YAML file"
    echo "  output-dir    Directory where the website will be built"
    echo ""
    echo "Example:"
    echo "  $0 ./clients/acme-plumbing.yaml ./projects/acme-plumbing"
    exit 1
fi

INTAKE_FILE="$1"
OUTPUT_DIR="$2"
PROGRESS_FILE="${OUTPUT_DIR}/progress.md"

# Validate intake file exists
if [ ! -f "$INTAKE_FILE" ]; then
    echo "Error: Intake file not found: $INTAKE_FILE"
    exit 1
fi

# Validate skill files exist
for skill in "$SKILL_BRAND" "$SKILL_UX" "$SKILL_MARKETING" "$SKILL_HACKS"; do
    if [ ! -f "$skill" ]; then
        echo "Error: Skill file not found: $skill"
        exit 1
    fi
done

# =============================================================================
# Helper Functions
# =============================================================================

timestamp() {
    date "+%Y-%m-%d %H:%M:%S"
}

log_progress() {
    local phase="$1"
    local status="$2"
    local message="$3"
    
    echo "" >> "$PROGRESS_FILE"
    echo "## Phase $phase - $status" >> "$PROGRESS_FILE"
    echo "_$(timestamp)_" >> "$PROGRESS_FILE"
    echo "" >> "$PROGRESS_FILE"
    echo "$message" >> "$PROGRESS_FILE"
}

init_progress() {
    mkdir -p "$OUTPUT_DIR"
    
    cat > "$PROGRESS_FILE" << EOF
# Website Build Progress

**Client:** $(basename "$INTAKE_FILE" .yaml)
**Started:** $(timestamp)
**Intake File:** $INTAKE_FILE

---
EOF
    echo "Progress file initialized: $PROGRESS_FILE"
}

# =============================================================================
# Phase Execution
# =============================================================================

run_phase_1() {
    echo ""
    echo "=========================================="
    echo "PHASE 1: Foundation"
    echo "Skills: brand-design.md, ux-design.md"
    echo "=========================================="
    echo ""
    
    log_progress "1" "Started" "Establishing brand identity, color palette, typography, and site structure."
    
    claude --print -p "
You are building a website for a client. This is Phase 1: Foundation.

## Your Task
1. Read the client intake file to understand their business, brand, and goals
2. Apply the principles from the skill files to plan the website foundation
3. Create the project structure with Astro
4. Establish the design system: colors, typography, spacing
5. Define the site structure and navigation
6. Create base CSS variables and global styles

## Skill Files (read these first)
- Brand Design: $SKILL_BRAND
- UX Design: $SKILL_UX

## Client Intake
$(cat "$INTAKE_FILE")

## Output Requirements
1. Initialize an Astro project in the current directory
2. Create src/styles/global.css with CSS variables for:
   - Color palette (following 60-30-10 rule)
   - Typography scale
   - Spacing system (8-point grid)
3. Create src/layouts/Layout.astro as the base layout
4. Create a sitemap.md documenting planned pages and their purpose
5. Create a design-system.md documenting all design decisions

## Important
- Follow the brand personality specified in the intake
- Use the 60-30-10 color distribution
- Establish clear visual hierarchy
- Keep typography to 2 font families max

After completing, summarize what was accomplished in a structured format.
" --cwd "$OUTPUT_DIR"

    log_progress "1" "Completed" "Foundation phase complete. Design system and project structure established."
}

run_phase_2() {
    echo ""
    echo "=========================================="
    echo "PHASE 2: Build"
    echo "Skills: ux-design.md, brand-design.md"
    echo "=========================================="
    echo ""
    
    log_progress "2" "Started" "Building all pages and components based on the design system."
    
    claude --print -p "
You are building a website for a client. This is Phase 2: Build.

## Your Task
1. Review the design system and sitemap created in Phase 1
2. Apply UX principles to create effective page layouts
3. Build all pages specified in the client intake
4. Create reusable components (Header, Footer, CTA sections, etc.)
5. Implement the primary call-to-action throughout the site
6. Add all content from the intake (services, testimonials, about, etc.)

## Skill Files (read these first)
- UX Design: $SKILL_UX
- Brand Design: $SKILL_BRAND

## Client Intake
$(cat "$INTAKE_FILE")

## Output Requirements
1. Create all pages in src/pages/ based on the intake requirements
2. Create components in src/components/:
   - Header.astro (with navigation)
   - Footer.astro
   - Hero.astro
   - CTA.astro (call-to-action sections)
   - Any other needed components
3. Implement the user flow from landing to conversion
4. Ensure every page has a clear focal point and CTA
5. Apply visual hierarchy principles to all layouts

## Important
- Every section should have ONE clear focal point
- CTAs must stand out using the accent color
- Navigation should be simple (5-7 items max)
- Mobile-first approach

After completing, summarize what was accomplished in a structured format.
" --cwd "$OUTPUT_DIR"

    log_progress "2" "Completed" "Build phase complete. All pages and components created."
}

run_phase_3() {
    echo ""
    echo "=========================================="
    echo "PHASE 3: Technical SEO"
    echo "Skills: digital-marketing.md"
    echo "=========================================="
    echo ""
    
    log_progress "3" "Started" "Applying technical SEO optimizations."
    
    claude --print -p "
You are building a website for a client. This is Phase 3: Technical SEO.

## Your Task
1. Review all pages created in Phase 2
2. Apply technical SEO best practices from the skill file
3. Optimize page titles and meta descriptions
4. Ensure proper heading structure (one H1, proper nesting)
5. Optimize all images (WebP, compression, lazy loading, alt text)
6. Set up proper semantic HTML structure
7. Add structured data where appropriate

## Skill File (read this first)
- Digital Marketing: $SKILL_MARKETING

## Client Intake
$(cat "$INTAKE_FILE")

## Output Requirements
1. Update all pages with proper <title> tags (50-60 chars)
2. Add <meta name=\"description\"> to all pages (150-160 chars)
3. Audit and fix heading structure on every page
4. Ensure all images have:
   - Descriptive alt text
   - width/height attributes
   - loading=\"lazy\" for below-fold images
5. Add an SEO.astro component for consistent meta handling
6. Create or update astro.config.mjs for sitemap generation
7. Document all SEO changes in seo-audit.md

## Important
- One H1 per page that clearly states the page topic
- Headings should tell a coherent story when scanned
- URLs should be clean and descriptive
- No broken internal links

After completing, summarize what was accomplished in a structured format.
" --cwd "$OUTPUT_DIR"

    log_progress "3" "Completed" "SEO phase complete. All pages optimized for search engines."
}

run_phase_4() {
    echo ""
    echo "=========================================="
    echo "PHASE 4: Polish"
    echo "Skills: design-hacks.md, ux-design.md"
    echo "=========================================="
    echo ""
    
    log_progress "4" "Started" "Applying final polish and accessibility audit."
    
    claude --print -p "
You are building a website for a client. This is Phase 4: Polish.

## Your Task
1. Review all pages and apply design refinements
2. Apply the design hacks from the skill file
3. Audit and improve accessibility
4. Fine-tune typography (line-height, letter-spacing)
5. Ensure consistent spacing throughout
6. Add subtle design elements where appropriate
7. Run the squint test on key pages

## Skill Files (read these first)
- Design Hacks: $SKILL_HACKS
- UX Design (Accessibility section): $SKILL_UX

## Client Intake
$(cat "$INTAKE_FILE")

## Output Requirements
1. Typography refinements:
   - Headers: 1:1 line-height ratio
   - Body: 1:1.5 line-height ratio
   - Tighten header letter-spacing (-1 to -3px)
   - Widen CTA letter-spacing (+1 to +3px)
2. Spacing audit:
   - Consistent 8-point grid
   - Double spacing between groups
3. Accessibility checklist:
   - All text meets contrast ratios (4.5:1 small, 3:1 large)
   - All interactive elements keyboard accessible
   - Focus indicators visible
   - Skip navigation link present
4. Add subtle enhancements:
   - Hover states
   - Micro-interactions where appropriate
   - Polish form inputs
5. Document all changes in polish-audit.md

## Important
- Squint test: headlines and CTAs should stand out
- Don't over-design - content is the star
- Test keyboard navigation end-to-end

After completing, summarize what was accomplished in a structured format.
" --cwd "$OUTPUT_DIR"

    log_progress "4" "Completed" "Polish phase complete. Site is production-ready."
}

finalize() {
    echo ""
    echo "=========================================="
    echo "BUILD COMPLETE"
    echo "=========================================="
    echo ""
    
    cat >> "$PROGRESS_FILE" << EOF

---

# Build Complete

**Finished:** $(timestamp)

## Summary

The website has been built through all four phases:

1. **Foundation** - Design system, colors, typography, structure
2. **Build** - All pages and components
3. **SEO** - Technical optimization for search engines
4. **Polish** - Refinement, accessibility, final touches

## Next Steps

- [ ] Review the site locally (\`npm run dev\`)
- [ ] Test all forms and interactions
- [ ] Review on mobile devices
- [ ] Get client approval
- [ ] Deploy to production

## Files Generated

- \`progress.md\` - This file
- \`sitemap.md\` - Site structure documentation
- \`design-system.md\` - Design decisions
- \`seo-audit.md\` - SEO optimizations made
- \`polish-audit.md\` - Final refinements made
EOF

    echo "Build complete! See $PROGRESS_FILE for details."
    echo ""
    echo "To preview the site:"
    echo "  cd $OUTPUT_DIR && npm run dev"
}

# =============================================================================
# Main Execution
# =============================================================================

main() {
    echo ""
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║           AUTOMATED WEBSITE BUILD                           ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo ""
    echo "Intake: $INTAKE_FILE"
    echo "Output: $OUTPUT_DIR"
    echo ""
    
    # Initialize
    init_progress
    
    # Run phases
    run_phase_1
    run_phase_2
    run_phase_3
    run_phase_4
    
    # Finalize
    finalize
}

main
