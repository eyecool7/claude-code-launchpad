# Project Launch

Claude Code Launchpad for Vibe Coders

Project-tailored **Optimized PBS** — Plan · Build · Shield

[한국어](README.md)

---

## Optimized PBS

| Element | Meaning | Includes |
|---------|---------|----------|
| **Plan** | Project-tailored blueprint | CLAUDE.md, Rules, Skills, decisions.md, lessons.md |
| **Build** | Automated build system | Agents, Commands, Phase-by-phase build guide, TDD assessment |
| **Shield** | Ironclad security pipeline | 7 security hooks, /security scan, pre-commit validation |

> **Optimized** = Settings tailored to each project's stack, scale, and requirements

---

## Who Is This For?

You know you need a plan but don't know what to write, setup feels overwhelming, and you lose context every session. This tool is for you.

- You know a good project plan matters, but don't know what to write
- You want to start a Claude Code project but the initial setup feels overwhelming
  - You're debating whether CLAUDE.md should be 58 lines or 500
  - Subagents, team mode, skills, MCP — you don't know which to pick
  - You're not sure which skills and MCP servers your project actually needs
  - You don't know how to configure security settings properly
- You want a tool that doesn't stop at setup — one that guides every build session based on your plan
- You lose context every time a session changes and keep repeating mistakes

---

## How Does It Work?

Follow the 5 commands in order, and your project setup and build are complete.

0. **`/project-launch:guide`** — Onboarding: full workflow overview (first time)
1. **`/project-launch:plan`** — Plan creation: generate a project plan through a structured interview
2. **`/project-launch:refine`** — Plan refinement: complete the plan with deep technical review and skill/MCP discovery
3. **`/project-launch:setup`** — Project setup: auto-generate CLAUDE.md and config files from the plan
4. **`/project-launch:build`** — Project build: status analysis and build plan every session

**Plan (`project-plan.md`) data flow:**

| Step | What it does to the plan (`project-plan.md`) |
|------|------------------------------------------------|
| `plan` | Define Sections 1-5 + write Section 6 with agent/skill mapping |
| `refine` | Update Sections 3-6 with interview + search results |
| `setup` | Generate config files from plan + append Section 7 (setup results) |
| `build` | Preview build plan from Section 6 (read-only) |

---

## Key Features

### 1. 2-Pass Plan Design

Interview-based planning in claude.ai → deep technical review in Claude Code. Two passes produce a thorough, gap-free plan. Pass 1 structures product context, core features, workflows, and implementation order through a guided interview. Pass 2 adds technical depth — stack compatibility checks, dependency conflict detection, and skill/MCP recommendations. Each pass comes with a ready-made prompt (project-plan-prompt and project-refine-prompt), so you never have to write one from scratch.

### 2. 4-Step Plan/Setup/Build Automation

Run /plan → /refine → /setup → /build commands in sequence to complete the planning, setup, and build process with ease. The setup step auto-generates 20 files — CLAUDE.md, rules, skills, agents, commands, hooks, and settings — all driven by your plan. CLAUDE.md length, security settings, agent structure — the plan decides everything, ensuring a consistent project environment and delivering results faithful to your original vision.

### 3. Tier-Based Work Mode

Automatically determines the work mode based on project scale, equipping the right agent structure and skills. It analyzes your plan's feature count, phase structure, and parallelization potential to decide the tier. Higher tiers automatically add independent agents and inter-agent communication skills for more complex setups.

| Tier | Mode | Best For |
|------|------|----------|
| 1 | Sequential | 3 or fewer features, simple projects |
| 2 | Subagents | Independent work blocks, context savings needed |
| 3 | Agent Teams | Large-scale parallel sessions, inter-agent communication needed |

### 4. Skill & MCP Auto-Discovery

During the refine step, your plan's tech stack and requirements are analyzed to automatically search community catalogs for matching skills and MCP servers. Results are presented as a list, and only user-confirmed items get installed. Specialized skills for libraries like Remotion, Stripe, or react-pdf are discovered automatically.

### 5. Cross-Session Context Continuity

`decisions.md` accumulates technical decisions (stack changes, API choices, architecture shifts), while `lessons.md` captures build failure causes and fixes. Running `/project-launch:build` in a new session reads the full plan + accumulated records + `git log`, determines what's been completed, and presents today's tasks. Even after days away, there's no need to re-explain context from scratch.

### 6. Ironclad Security (Shield)

7 security hooks automatically guard your entire development process. API key leak detection (secret-guard), dangerous command blocking (command-guard), sensitive file modification alerts (security-trigger), destructive SQL prevention (db-guard), and pre-commit validation (pre-commit-check) work automatically. Run `/project-launch:security` anytime for CWE Top 25 security scanning. During setup, validation scripts also catch stack conflicts, missing environment configs, and security gaps.

---

## Installation

### Method 1: Claude Code Plugin (Recommended)

Add the marketplace inside Claude Code first.

```
/plugin marketplace add eyecool7/claude-code-project-launch
```

Then install the plugin.

```
/plugin install project-launch@eyecool7
```

### Method 2: Terminal CLI

Run in a regular terminal (zsh/bash).

```bash
claude plugin marketplace add eyecool7/claude-code-project-launch
claude plugin install project-launch@eyecool7

# Verify installation
claude plugin list
```

### Requirements

- Claude Code v1.0.33 or higher (`claude --version`)
- Update: `npm update -g @anthropic-ai/claude-code`

---

## Step-by-Step Guide

### Step 0. Guide (First Time)

Run `/project-launch:guide` → Full workflow overview and generated files description

### Step 1. Create Project Plan

Run `/project-launch:plan` → `project-plan-prompt.md` auto-generated → Paste prompt into claude.ai and complete `project-plan.md` through interview → Save `project-plan.md` in project root

> **Instructions shown when command runs:**
> 1. Open `project-plan-prompt.md` and fill in `[Project Name]` and `Project Overview`.
> 2. Paste the full prompt into **claude.ai** and complete the plan through conversation.
> 3. Save the finished plan as `project-plan.md` in the project root.
> 4. Run `/project-launch:refine` to proceed to the next step.

### Step 2. Refine Project Plan

Run `/project-launch:refine` → `project-refine-prompt.md` auto-generated → Paste prompt into Claude Code for technical review + skill/MCP search → Refine `project-plan.md` → Save in project root (overwrite)

> **Instructions shown when command runs:**
> 1. Open `project-refine-prompt.md` and paste the prompt into **Claude Code**.
> 2. Refine `project-plan.md` through conversation with Claude Code.
> 3. Save the refined plan back to `project-plan.md` in the project root.
> 4. Run `/project-launch:setup` to proceed to the next step.

### Step 3. Project Setup

Run `/project-launch:setup` → Plan-based skill/MCP search → Setup preview output/confirm → CLAUDE.md and config files auto-generated → **Setup results** auto-appended to `project-plan.md` (setup context preserved even after `/clear`)

> **Shows a setup preview for approval before executing:**
>
> ```
> 📁 Files to generate (22)
> ├── CLAUDE.md (~82 lines)
> ├── .claude/
> │   ├── rules/     → conventions, security, error-handling, testing, frontend
> │   ├── skills/    → project-directory, easy-refactoring, skill-discovery
> │   ├── agents/    → test-runner, code-reviewer, debugger, script-analyzer
> │   ├── commands/  → /check, /review, /commit-push-pr
> │   ├── hooks/     → session-start, edit-monitor, pre-commit-check
> │   │                + secret-guard, command-guard, security-trigger
> │   └── settings.json, lessons.md, decisions.md
> └── .mcp.json (none)
>
> 🔌 Additional skills: remotion-community (community install)
> 🤖 Work mode: Tier 2 — Subagents
> 🛡️ Security: 6 hooks active
> ⚠️ Compatibility: Remotion + Next.js bundler conflict (isolation required)
>
> Proceed with this setup?
> ```
>
> Approve to run setup → then `/clear` → `/project-launch:build` to start building.

### Step 4. Start Building

Run `/project-launch:build` → Plan-based status analysis + build plan output → Start building (even after days away, reads full plan + `decisions.md`, `lessons.md`, `git log` to determine where to continue)

> **Output example:**
> 📋 **Project Status**
>
> | Phase | Status | Notes |
> |-------|:------:|-------|
> | Phase 1: Foundation | ⬜ | Not started |
> | Phase 2: Script Parser | 🔒 | Starts after Phase 1 |
> | Phase 3: Content Generation | 🔒 | Starts after Phase 2 |
> | Phase 4: Deploy Integration | 🔒 | Starts after Phase 3 |
>
> **Current Phase:** Phase 1 — Foundation
>
> 🔧 **Session Build Order**
>
> | # | Task | Agent | Skill | TDD | Done When |
> |---|------|:-----:|-------|:---:|-----------|
> | 1 | Next.js + Tailwind + shadcn/ui init | — | dependencies | ❌ | `pnpm dev` runs successfully |
> | 2 | Create folder structure (`src/app`, `src/lib`, `src/remotion`) | — | project-directory | ❌ | Matches plan folder structure |
> | 3 | Shared type definitions (`src/types/index.ts`) | — | — | ✅ | Test first → `pnpm run typecheck` passes |
>
> **Ralph Loop:** Tasks 1,2,3 ✅ (mechanically verifiable)
>
> Proceed with this order?
>
> **Notes:** Section 7 — Remotion + Next.js bundler conflict (isolate in src/remotion/, exclude from Next.js build)

---

## What the Plan Covers

| Section | Contents | Required |
|---------|----------|:--------:|
| 1. Product Context | One-liner, background, core features + priorities, success criteria, out of scope | ✅ |
| 2. Workflow | User flows, LLM vs script separation, validation + failure handling | ✅ |
| 3. Tool Design | MCP server selection, skill selection, .mcp.json finalization | ✅ |
| 4. Implementation Design | Tech stack, agent structure, skill list, error strategy, dependencies | ✅ |
| 5. Technical Decisions | UI tools, data flow, URL structure, external services | ⚪ |
| 6. Implementation Order | Phase-by-phase execution plan — agent, skill, file location, verification mapping (synthesis of Sections 1-5) | ✅ |

---

## Output

### CLAUDE.md Design Philosophy

> *"Don't write what Claude already knows. Only keep rules unique to your project."*
> — Inspired by [Andrej Karpathy's Claude Code principles](https://github.com/forrestchang/andrej-karpathy-skills)

The generated CLAUDE.md follows this principle. Generic best practices that Claude follows by default (PR separation, retry on error, etc.) are excluded. Only **rules unique to this project** — stack conflict warnings, verification commands, key paths, record triggers — are kept within ~80 lines.

### Always Generated (24 files)

| Category | Files | Role |
|----------|-------|------|
| **CLAUDE.md** | 1 | Plan-based ~80 lines. Auto-loaded every session |
| **Rules** | conventions, security, error-handling, testing | Auto-load when working on matching files |
| **Skills** | project-directory, easy-refactoring, skill-discovery | File placement, refactoring, external skill search |
| **Agents** | test-runner, code-reviewer, debugger | Delegate testing, review, debugging |
| **Commands** | /check, /review, /commit-push-pr, /security | Typecheck+lint+test, code review, PR creation, security scan |
| **Hooks** | session-start, edit-monitor, pre-commit-check, secret-guard, command-guard, security-trigger | Session init, edit watch, pre-commit validation, secret detection, dangerous command blocking, sensitive file alerts |
| **Records** | decisions.md, lessons.md | Technical decisions + mistake/solution log |
| **Config** | settings.json | Permissions/hooks config |

### Conditionally Generated

| File | Condition |
|------|-----------|
| rules/frontend/ | Frontend project |
| rules/database.md | Backend + DB |
| skills/design-rules/ | Frontend project |
| skills/ui-ux-pro-max/ | Frontend (external skill, auto-installed) |
| skills/dependencies/ | Dependency conflicts detected |
| skills/{domain-skill}/ | Plan-defined skills |
| agents/{custom}.md | Tier 2+ agents (plan-defined) |
| skills/agent-teams/ | Tier 3 agent teams |
| .mcp.json | MCP servers selected |

---

## Project State After Setup

```
my-project/
├── CLAUDE.md                  ← ~80 lines. Auto-loaded every session
├── .claude/
│   ├── commands/              ← /review, /check, /commit-push-pr
│   ├── hooks/                 ← session-start, edit-monitor, pre-commit-check
│   │                             + secret-guard, command-guard, security-trigger
│   ├── rules/                 ← conventions, security, error-handling, testing (+conditional)
│   ├── skills/                ← project-directory, easy-refactoring, skill-discovery (+conditional)
│   ├── agents/                ← test-runner, code-reviewer, debugger (+conditional)
│   ├── decisions.md           ← Technical decision log
│   ├── lessons.md             ← Mistake/solution log
│   └── settings.json
├── .mcp.json                  ← MCP servers (optional)
└── project-plan.md            ← Kept for reference
```

**Auto-activated:**
- **Rules** — Error/security/test/convention rules auto-load when working on matching files
- **Skills** — File placement, refactoring, design workflows auto-discovered when relevant
- **Agents** — Complex testing/review/debugging delegated to dedicated agents in independent context
- **Decisions/Lessons** — Session alerts when records accumulate, preventing repeated mistakes
- **Skill Discovery** — Auto-search and suggest external skills when needed (user confirmation before install)

---

## Components

| Component | Description |
|-----------|-------------|
| Commands (6) | `/project-launch:guide`, `plan`, `refine`, `setup`, `build`, `security` |
| Templates (32) | CLAUDE.md, rules, skills, agents, commands, hooks (4 security included), settings, records generation + 2 prompts |
| Scripts (3) | analyze-project, validate-env, validate-setup |

---

## Plugin Structure

```
claude-code-project-launch/
├── .claude-plugin/marketplace.json
├── plugins/project-launch/
│   ├── .claude-plugin/plugin.json
│   ├── commands/          ← guide, plan, refine, setup, build
│   ├── templates/         ← Templates referenced during generation
│   └── scripts/           ← Analysis/validation scripts
├── README.md
├── README.en.md
└── LICENSE
```

---

## Acknowledgments

| Reference | Description |
|-----------|-------------|
| [Andrej Karpathy's Claude Code Skills](https://github.com/forrestchang/andrej-karpathy-skills) | CLAUDE.md design philosophy — conciseness, project-specific rules only |
| [Awesome Claude Skills](https://github.com/travisvn/awesome-claude-skills) (⭐ 7.9k) | Original skill catalog source |
| [Awesome Claude Code](https://github.com/hesreallyhim/awesome-claude-code) (⭐ 25.6k) | Comprehensive Claude Code resource collection |
| [vive-md](https://github.com/johunsang/vive-md) | Korean guide integrating the above sources. Used for skill/MCP discovery |
| [@trq212 (Thariq)](https://x.com/trq212) | Original spec-based development workflow concept |

---

## License

MIT
