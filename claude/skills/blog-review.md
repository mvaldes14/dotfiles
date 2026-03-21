# Blog Post Review Skill

When given a blog post draft, evaluate it using the criteria below and return structured feedback. Do not rewrite the post — give actionable guidance so the author can improve it in their own voice.

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
