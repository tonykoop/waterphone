<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Risks — Waterphone (L2 concept / pending measurement)

All entries are concept-level; no measured build exists. Every mitigation is a
planned gate in `validation.csv`, not a proven result.

## Safety

| Risk | Severity | Mitigation |
|---|---|---|
| Sharp rod ends / burrs (bowing + handling) | high (hand contact) | Deburr and radius every rod end; tactile-inspect (VAL-008) before play. |
| Water + metal: slip / spill during play | medium | Leak-tested seal (VAL-006); wipe-down plan; no electronics near wet chamber. |
| Cut/weld hazards forming bowl and rim | medium | Standard metal-shop PPE; cool-down between welds; deburr formed edges. |
| Rosin/bow fine-motion strain | low | Balanced grip via neck; limit session length during trials. |

## Structural / durability

| Risk | Severity | Mitigation |
|---|---|---|
| Rod-to-rim joint fatigue / loosening | high | Coupon-test joint types for sustain + durability (VAL-003) before full field. |
| Leak at fill/seal over time | high | Seal + soak test (VAL-006); serviceable closure. |
| Corrosion from water contact | medium | Corrosion-safe finish/passivation validated against bowing response (VAL-007). |

## Acoustic-failure modes

| Mode | Effect | Recovery |
|---|---|---|
| Rod choke (attachment kills sustain) | dead rods | change joint type / isolation (VAL-003). |
| Water fill smears/chokes response | uncontrollable bend | document controllable fill range (VAL-004/005). |
| Bowing noise from loose joints | scratchy tone | tighten/isolate joints; re-test. |

## Authority boundary

No rod tuning, rod count/pitch, bowl dimensions, or fill volumes are asserted.
Do not fabricate, weld, machine, or purchase final stock without measured,
reviewed evidence per `validation.csv` and `design.md`.
