# Create GitHub Issue — SigNoz platform-pod

Help the user create a well-structured GitHub issue in `SigNoz/platform-pod` following team templates and label conventions. Walk through the steps below in order.

---

## Step 1 — Determine ticket type

Ask the user: **"What type of ticket is this?"**

Present the options as a numbered list:
1. Discussion
2. Task
3. Incident
4. Documentation
5. Access request
6. Billing
7. Alert
8. Support
9. Outpost integration
10. Disk modification
11. Retention change
12. Exception request
13. Termination
14. Release

Wait for the user's answer before continuing.

---

## Step 2 — Get a brief description

Ask: **"Give me a brief description of what this ticket is about."**

Based on the description, infer which labels from the approved set are appropriate. Use judgment — a ticket can have multiple labels.

**Approved labels:**
`discussion`, `access`, `community`, `cost`, `compliance`, `debt`, `billing`, `automation`, `bug`, `enhancement`, `documentation`, `task`, `incident`, `security`

Note: Some templates also carry their own type-specific label (e.g. `incident`, `access`) — always include that base label plus any additional labels inferred from the description.

---

## Step 3 — Draft the ticket using the correct template

Use the template below that matches the ticket type. Fill in all fields with your best suggestions based on the description. Use `<!-- suggestion: ... -->` markers inside fields where you're making an inference the user should verify.

### Template: Discussion
```
title: (discussion) <title>
labels: discussion [+ inferred labels]

## Topic Overview
<your draft>

## Current State
<your draft>

## Problems or Challenges
<your draft>

## Proposed Changes/Solutions
<your draft>

## Stakeholders
<your draft>

## Decision Log
- [ ] Decision 1: [Description]
```

### Template: Task
```
title: (task) <title>
labels: task [+ inferred labels]

## Description
<your draft>

## Additional Information
<your draft>
```

### Template: Incident
```
title: (incident) <title>
labels: incident [+ inferred labels]

**Description:** <your draft>
**Impact:** <your draft>
**Start Time:** <ask user or leave blank>
**End Time:** <ask user or leave blank>
**Additional Information:** <your draft>
```

### Template: Documentation
```
title: (documentation) <title>
labels: documentation [+ inferred labels]

**Name:** <document name>
**Description:** <your draft>
```

### Template: Access
```
title: (access) <title>
labels: access [+ inferred labels]

**Purpose:** <your draft>
**Duration:** <your draft or ask>
**Permissions:** <your draft>
**Additional Information:** <your draft>
```

### Template: Billing
```
title: (billing) <title>
labels: billing [+ inferred labels]

**Name:** <customer/deployment name>
**Reference:** <link — ask user>
**Request Type:** <Invoice generation | Refund | Discount | Catalogue modification>
**Description:** <your draft>
**Amount:** <if applicable>
**Additional Information:** <your draft>
```

### Template: Alert
```
title: (alert) <title>
labels: alert [+ inferred labels]

**Type of Alert:** <your draft>
**Description:** <your draft>
**Additional Information:** <your draft>
```

### Template: Support
```
title: (support) <title>
labels: support [+ inferred labels]

**Name:** <customer/deployment name>
**Type:** <support type>
**Reference:** <link — ask user>
**Description:** <your draft>
**Additional Information:** <your draft>
```

### Template: Outpost
```
title: (outpost) <title>
labels: outpost [+ inferred labels]

**Platform:** <platform name>
**Description:** <your draft>
```

### Template: Disk
```
title: (disk) <title>
labels: support, cost, scalability [+ inferred labels]

**Name:** <deployment name>
**New Disk Type:** <pd-balanced | pd-ssd | hd-balanced>
**Confirmation:** [ ] License is ACTIVATED
```

### Template: Retention
```
title: (retention) <title>
labels: retention [+ inferred labels]

**Deployment Name:** <name>
**Reference:** <link — ask user>
**Logs Retention Period:** <your draft>
**Updated Logs Pricing:** <your draft>
**Traces Retention Period:** <your draft>
**Updated Traces Pricing:** <your draft>
**Metrics Retention Period:** <your draft>
**Updated Metrics Pricing:** <your draft>
**Additional Information:** <your draft>
**Confirmations:** [ ] Pricing verified  [ ] License ACTIVATED
```

### Template: Exception
```
title: (exception) <title>
labels: exception [+ inferred labels]

**Purpose:** <your draft>
**Policy:** <select from: Data Management | Cryptography | Secure Development | Access Control | Operations Security>
**Additional Information:** <your draft>
```

### Template: Termination
```
title: (termination) <title>
labels: termination [+ inferred labels]

**Name:** <customer/deployment>
**Reference:** <link — ask user>
**Description:** <your draft>
**Additional Information:** <your draft>
```

### Template: Release
```
title: (release) <title>
labels: release [+ inferred labels]

**Description:** <your draft>
**Why:** <your draft>
**Additional Information:** <your draft>
```

---

## Step 4 — Show the preview

Present the full drafted ticket to the user in a clean code block. Include:
- The proposed **title**
- The proposed **labels** (and a one-line rationale for each inferred label)
- The full **body** with your filled-in suggestions

Ask: **"Does this look right? Any changes before I create it?"**

Make any requested adjustments and re-show before proceeding.

---

## Step 5 — Create the ticket

Only after the user explicitly confirms, run:

```bash
gh issue create \
  --repo SigNoz/platform-pod \
  --title "<title>" \
  --label "<label1>,<label2>" \
  --body "<body>"
```

Report the created issue URL back to the user.

---

## Notes
- Never create the issue before showing the preview and getting confirmation.
- If a required field (like a reference URL) is missing, ask for it rather than leaving it blank.
- Title format is always `(type) Short descriptive title` — keep it concise.
- Project assignment (`SigNoz/21`) is handled automatically by the template labels on the GitHub side; you don't need to set it via CLI.
