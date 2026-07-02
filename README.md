<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# Waterphone

**Status:** L2 V5 build-packet candidate

L2 V5 concept / pending-measurement build packet. This repo describes
a waterphone design study with a resonator bowl, central neck, tuned rim rods,
and internal water pitch-bend behavior, but it contains no fabricated CAD
geometry, DXF coordinates, measured tuning, acoustic values, or shop-ready
dimensions. The parametric `cad/waterphone.scad` is a schematic ASSUMPTION-only
envelope, not fabrication authority. The L2 packet adds a subsystem plan,
candidate cut-list, sourcing/validation/risk scaffolds, and clearer test gates
without promoting fabrication authority.

## Thesis

A waterphone is a hybrid idiophone built around a resonant metal bowl, a
central neck, and many vertical rods fixed around the rim. The rods can be
bowed for glassy sustained tones or struck for bell-like attacks. Water inside
the bowl moves as the instrument tilts, changing damping, coupling, and
apparent pitch in a continuously unstable way.

This packet keeps the first build intentionally low-stakes: it is a concept
and measurement plan for a stainless or bronze bowl instrument, not a promise
of a tuned scale.

## Intended Mechanics

- Resonator: stainless or bronze bowl with a sealed or serviceable water
  chamber.
- Neck: central handle/fill neck that also gives the player a stable grip.
- Rod field: vertical rim rods selected and trimmed only after measurement.
- Excitation: bowing, light striking, and hybrid scrape/strike gestures.
- Pitch-bend behavior: internal water sloshing changes the audible response as
  the bowl moves.
- Authority: all dimensions, rod pitches, chamber fill levels, and acoustic
  targets remain pending measurement.

## Packet Map

- `design.md` - concept mechanism and parametric intent.
- `bom.csv` - estimated material and subsystem list.
- `cut-list.csv` - candidate part ledger with all geometry pending
  measurement.
- `visual-output-register.csv` - V5 authority register.
- `sourcing.csv` - spec-first sourcing scaffold (pending measurement).
- `validation.csv` - measurement-gate scaffold (bowl/rod/wet/leak/safety).
- `risks.md` - concept-level risk register.
- `drawing-brief.md` - first-drawings brief + authority notes.
- `cad/waterphone.scad` - schematic build-envelope (bowl + neck + rod array); ASSUMPTION-only params, not fabrication authority.
- `cad/mcp-session-log.md` - QMD and CAD/OpenSCAD provenance.
- `evolution/` - StudioPipeline evolution-pipeline Stage 0 intake (manifest, design-intent, revisions).
- `decision-record.md` - design choices and open questions.

## Status Boundary

This is not a fabrication-ready instrument. Before fabrication authority can be
claimed, the design needs measured bowl response, rod material and tuning
tests, water-volume experiments, attachment trials, leak/safety checks, and
reviewed CAD/DXF or measured templates.
