<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Waterphone Drawing Brief (L2 concept / pending measurement)

No dimensioned production drawings exist. The parametric envelope
`cad/waterphone.scad` is a schematic, ASSUMPTION-only preview — every value in
it is a placeholder, not a design claim. First real drawings may be authored
ONLY after the `validation.csv` gates return measured data.

## Required first drawings (after measurement)

- Bowl section: measured OD, depth, wall, rim band — after VAL-001 bowl-response
  characterization and a chosen bowl form/alloy.
- Neck/handle detail: grip + fill/service duties once tests decide which the
  neck carries.
- Rod-field layout: rim ring with rod count, spacing/ordering, and per-rod
  length — ONLY after rod-coupon response (VAL-002) and attachment trials
  (VAL-003); rod tuning is out of scope until measured.
- Rod-to-rim joint detail: selected joint type from coupon results.
- Fill/seal closure detail: after leak test (VAL-006).

## Authority Notes

- Rod tuning, rod count, rod pitch/length, bowl dimensions, and fill volumes are
  measurement-gated (design.md). Do NOT dimension them from the schematic
  `.scad` — its numbers are labeled assumptions for scale only.
- The workbook/design-table chain does not yet exist; the first design table is
  built after bench measurement (design.md Parametric Intent).
