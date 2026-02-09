# Last Call
Project made for Hack the Coast 2026

# Last Call

**Last Call** is a game-first crisis management game about running emergency shelter intake during a surge night (extreme cold/heat, displacement, etc.). The player makes **irreversible** intake decisions under **scarcity**, **time pressure**, and **incomplete information**. The point is the system: even “good faith” choices can produce unequal outcomes because constraints and delays don’t affect everyone equally.

## Core Design Principles (Non-Negotiable)
- This is a **game**, not a tool, dashboard, or educational/awareness product.
- **Scarcity** is real (limited beds, staff capacity, supplies).
- **Irreversibility**: intake decisions cannot be undone.
- **Incomplete information**: player only sees plausible, partial traits.
- **Delayed consequences**: impacts show up later (often at night), not instantly.
- Equity/inclusion emerges **mechanically**, not via lectures or moral messaging.
- Failure should feel **uncomfortable but fair** (traceable to choices, not random punishment).

## Core Game Loop
1. People arrive with partial, ambiguous information.
2. Player chooses one action: **Admit / Deny / Delay**.
3. Resources update immediately (beds/staff/supplies).
4. Consequences resolve later via a delayed event system.
5. The system trends toward collapse; player fights to keep it functional.

## Day Cycle Structure
- **Morning (Intake):** fast admit/deny/delay decisions under pressure.
- **Day (Strain):** make a small number of **system-level policy choices** (no chores/micromanagement).
  - Examples: staff focus (intake vs care), rationing (strict vs generous), bed policy (overcrowd vs enforce).
  - Goal: choose **where the system fails**, not “fix everything.”
- **Night (Resolve):** no input; delayed outcomes trigger and system state updates.

## Player Role & Movement
- Third-person player character represents an **intake coordinator**.
- Movement is used to enforce **time/bottlenecks** (walking between stations), not to “solve” problems directly.
- Player does **not** perform chores (clean/cook/etc.) or hero actions.

## People Generation
- People are generated with **visible** traits (shown) and **hidden** traits (used for outcomes).
  - Visible examples: age band, presenting condition, group size, wait time.
  - Hidden examples: risk thresholds, vulnerability to delay, future system cost.
- Randomness is asymmetric: not all cases are “fair” or obvious.

## Delayed Outcomes / Events (Hybrid Model)
- Outcomes are resolved later to prevent instant optimization and to make harm legible over time.
- Use a hybrid:
  - **Decision-seeded events** (probabilities scale with admitted profiles + policies + shelter stress).
  - **Global random events** (external shocks like delivery delays), with severity scaled by shelter stress.
- Outcomes are operational, non-graphic, and shelter-relevant (e.g., medical escalation, sleep disruption, illness spread, staff burnout, admin failures).

## Staff / Volunteers
- Staff/volunteers exist as **capacity modifiers** (numbers + fatigue), not controllable units.
- No individual task assignment; player only sets high-level focus/policy.
- Overload can cause staff loss later; occasional arrivals are unpredictable.

## Objective / End Condition
- There is no “perfect win.” **Success is fragile**: keep the system functioning as long as possible.
- The game ends on **system collapse** (e.g., staff depleted, intake throughput < arrivals, queue overflow, critical capacity failure).
- No moral scoring; outcomes should feel earned and traceable.

## Explicit Non-Goals
- Tutorials or preachy dialogue about inequality/accessibility.
- Rewind/undo, “correct answer” moral choices, or comfort features.
- Complex economies (currency/income) or heavy micromanagement.
- Multiple modes/scenarios; keep scope intentionally small.
