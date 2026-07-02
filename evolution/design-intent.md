# Design Intent — waterphone rev A

- Master CAD: `cad/waterphone.scad` (sha256: 85e8df8884a8024146e42822c2843a10009e6c4219776541073ed12945e2f113) — a SCHEMATIC envelope, NOT dimensional authority. No design table exists (design.md asserts none).
- Function: Waterphone-style hybrid idiophone — a resonant metal bowl partly filled with water, a central neck/handle, and a ring of vertical rods around the rim. Rods are bowed (glassy sustain) or struck (bell attack); tilting the bowl moves the water, bending and smearing pitch. The design question is which rod materials/attachments/bowl forms/water fills give controllable bends without choking (design.md Mechanism).
- Environment: handheld/played wet instrument; water + metal + bowing. Leak, corrosion, joint fatigue, and sharp rod ends are the live hazards (risks.md).
- Target qty: 1 (concept prototype). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

This is an L2 CONCEPT packet — **no function-critical dimensions are asserted**.
All geometry is measurement-gated; the values below are the gates, not numbers.

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Bowl form/OD/depth/wall | TBD (pending_measurement) | after VAL-001 | resonance / water chamber | design.md Parametric Intent / VAL-001 |
| Rod material + length | TBD (pending_measurement) | after VAL-002 coupons | rod response | design.md / VAL-002 |
| Rod-to-rim attachment | TBD (pending_measurement) | after VAL-003 coupons | sustain, bowing noise, safety | design.md / VAL-003 |
| Water fill range | TBD (pending_measurement) | after VAL-004/005 | controllable pitch bend | design.md / VAL-004 |
| Fill/seal closure | TBD (pending_measurement) | leak-tested (VAL-006) | wet-play safety | bom.csv SEAL-001 / VAL-006 |

## Incidental (free for DFM)

- None asserted at concept stage — the packet publishes no dimensional or cosmetic geometry.

## Must-nots (DFM may never violate)

- Do NOT treat any number in `cad/waterphone.scad` as a design claim — every parameter is a labeled ASSUMPTION for scale only.
- Do NOT assert rod tuning, rod count, rod pitch/length, bowl dimensions, or fill volumes without measured, reviewed evidence (design.md Authority Boundary).
- Do NOT make a wet-play claim before the leak/seal gate (VAL-006) passes.
- Deburr/radius every rod end before handling (VAL-008 / risks.md).

## Material intent

- Preferred: stainless or bronze bowl; bowable metal rods (stainless/bronze/brass) — all family-level only, unmeasured (bom.csv / sourcing.csv).
- Forbidden: locking any dimension, alloy, or tuning before bench measurement.

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run. No design table, no measured data — concept envelope only. Nothing presented as shippable.
