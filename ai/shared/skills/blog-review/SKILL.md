---
name: blog-review
description: Evaluate a blog post draft against the blog's criteria and return structured, actionable feedback without rewriting it. Use when the user shares a draft post or asks for a blog review. Takes the post as an argument — a path, a note slug, a fuzzy title, or the pasted draft itself.
argument-hint: [path | note-slug | title]
---

# Blog Post Review Skill

Evaluate a blog post draft using the criteria below and return structured feedback. Do not rewrite the post — give actionable guidance so the author can improve it in their own voice.

---

## Input

The post to review comes from the skill argument: `$ARGUMENTS`

Resolve it in this order:

1. **Absolute or relative path** (`/Users/mvaldes/Obsidian/wiki/Blog/foo.md`, `Blog/foo.md`) — read it directly.
2. **Bare note name or slug** (`what-is-an-fde`, `what-is-an-fde.md`) — read `/Users/mvaldes/Obsidian/wiki/Blog/<slug>.md`. If that path doesn't exist, locate it with `obsidian files | grep -i <slug>` and read the match.
3. **Fuzzy title or topic** (`the FDE post`, `latest draft`) — list candidates with `ls -lt /Users/mvaldes/Obsidian/wiki/Blog/`, pick the obvious match, and state which file you chose. If two or more are plausible, ask before reviewing.
4. **Pasted draft text** — if the argument is the post body itself (multi-line, prose), review it as-is with no file read.
5. **No argument** — if the conversation already contains a draft, review that. Otherwise show the five most recent files in `Blog/` and ask which one.

Always name the file you reviewed at the top of your output. Read the whole file — including frontmatter — before reviewing; `tags:` and `name:` are part of the SEO check.

---

## About the Blog

- **Niche:** [e.g., "DevOps, observability, cloud-native — practical tutorials and opinions from a practitioner"]
- **Audience:** [e.g., "Engineers who want real-world experience, not vendor marketing"]
- **Tone:** [e.g., "Direct, opinionated, technically credible"]

---

## Voice Rules

- [e.g., "Short to medium sentences. First person. Opinionated."]
- [e.g., "Technical terms are fine — but grounded in practical context"]
- **Flag:** [e.g., "Passive voice, corporate language, over-hedging, filler phrases like 'it's worth noting'"]
- **Don't flag:** [e.g., "Sentences starting with 'And'/'But', one-sentence paragraphs, opinions without citations — all intentional"]

---

## Review Criteria

**Hook & Opening**
- Clear within 2–3 sentences what the post is about and why it matters?
- Does it make the reader want to continue?

**Clarity & Structure**
- Easy to follow start to finish?
- Headings used effectively?
- Any walls of text that need breaking up?

**Argument & Value**
- Clear point of view or key takeaway?
- Does it deliver on what the opening promises?
- Anything vague, hand-wavy, or underdeveloped?

**Voice Consistency**
- Sounds like the author throughout?
- Any sections that feel stiff or written differently?

**Technical Accuracy**
- Any claims, commands, or configs that look off or need a double-check?

**SEO & Discoverability**
- Title specific and accurate?
- Primary topic present naturally in the opening paragraph?
- Headings descriptive, not clever-but-vague?

**Ending & CTA**
- Clear conclusion or takeaway?
- Natural next step for the reader?

---

## Output Format

```
**Reviewing:** `<path to the file reviewed>`

## Overall Impression
[2–4 sentences. Is this ready to publish, close, or needs work? Be direct.]

## Strengths
[Specific bullets — no generic praise]

## Issues to Address
[Numbered, priority order. Each item: what, where, how to fix]

## Minor / Optional
[Low-priority polish the author can take or leave]

## Publishing Checklist
- [ ] Title is specific and accurate
- [ ] Hook lands within 2–3 sentences
- [ ] Key takeaway is clear
- [ ] No unchecked technical claims
- [ ] Ending gives the reader a next step
```
