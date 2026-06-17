# SDSFIE And USACE Recreation Gap Analysis

**Status:** v2 review draft
**Date:** 2026-06-01
**Audience:** Civil Works, recreation, GIS, and data governance reviewers
**Companion artifacts:** `12-recreation-sdsfie-crosswalk.md`; `../sdsfie/sdsfie-usace-recreation-gap-analysis.xlsx`
**Workbook generator:** `../sdsfie/tools/generate_usace_recreation_gap_analysis.py`

## Purpose

This artifact explains the SDSFIE-to-USACE recreation alignment in plain language. It documents what matched, what partially matched, and what should not be forced into a default SDSFIE mapping.

The recreation ontology integrates SDSFIE concepts where they fit, while building a clean conceptual model for future recreation operations. SDSFIE remains the external spatial data standard; the recreation ontology clarifies managed recreation entities, amenities, water access assets, and GIS representations.

## Workbook Artifact

The companion workbook is `../sdsfie/sdsfie-usace-recreation-gap-analysis.xlsx`.

It follows the same review pattern as the SDSFIE and DoD real-property workbook:

- `Summary`
- `SDSFIE_to_USACE`
- `USACE_to_SDSFIE`
- `SDSFIE_candidate_pool`
- `USACE_target_pool`

The workbook includes reviewed match rows, direction-specific broader/narrower semantics, implementation guidance, and reviewer disposition columns.

## Plain-Language Rule

SDSFIE usually answers: "What GIS feature class or coded value would this be stored under?"

The recreation ontology answers: "What managed recreation thing is this, and how is it represented in GIS?"

When those answers line up, we map them. When SDSFIE is broader, narrower, or only related, we document that difference instead of hiding it.

## Foundational Scope Boundary

This gap analysis follows the same scope discipline as the recreation ontology itself:

- The USACE recreation model is derived first from formal USACE guidance, especially `EP 1130-2-550`.
- SDSFIE alignment is a secondary activity. SDSFIE can supply useful anchors, but it does not by itself define what must become a USACE recreation class family.
- The growing SDSFIE enhancement effort is related work, but it is not the same problem as documenting the USACE recreation conceptual model.

This matters for recreation terms that exist in SDSFIE but are weak or absent in the USACE foundation:

- `hunting` does appear in `EP 1130-2-550`, but as a recreation use, permit, and management context rather than as a foundational facility or feature-class family.
- `golf` appears only incidentally in the EP as a special-events sports example, not as golf-course facility or feature guidance.
- Therefore SDSFIE classes such as `sd:GolfCourseFeature`, `sd:HuntingFeature`, and similar recreation-domain feature families should not be pulled into the USACE recreation ontology by default just because they exist in SDSFIE.

The practical rule is simple: derive the USACE model from formal USACE guidance, then align with SDSFIE where the concepts genuinely overlap. Do not merge that activity with broader SDSFIE enhancement work.

## Summary

The machine-readable crosswalk currently contains these reviewed mapping assertions:

| Result | Count | Plain-language interpretation |
| --- | ---: | --- |
| Exact match | 6 | Strong alignments that can usually be treated as equivalent at the mapped concept level. |
| Close match | 13 | Good alignments with some difference in grain, scope, or class-versus-code modeling. |
| Broad match | 6 | SDSFIE is broader than the recreation concept. |
| Narrow match | 2 | SDSFIE has narrower coded values below a broader recreation concept. |
| Related match | 11 | Useful relationship, but not equivalence or hierarchy. |
| No default mapping | 1 | The recreation concept should not be automatically mapped to SDSFIE without source-specific evidence. |

Counts are mapping assertions, not unique recreation terms. A term can have more than one useful SDSFIE relationship.

## Strong Matches

These mappings are straightforward enough to use as default alignment candidates.

| USACE recreation concept | SDSFIE anchor | Decision | Why it is strong |
| --- | --- | --- | --- |
| `recs:CampgroundFeature` | `sd:Campground` | Exact | Both represent a campground spatial feature. |
| `recs:CampsiteFeature` | `sd:Campsite` | Exact | Both represent an individual campsite feature. |
| `recs:TrailFeature` | `sd:RecreationTrail` | Exact | Both represent a recreation trail path or route. SDSFIE separately uses `sd:RecreationTrailFeature` for point features associated to the trail. |
| `recs:ParkingAreaFeature` | `sd:ParkingArea` | Exact | SDSFIE explicitly supports recreation-area parking without forcing pavement-management segmentation. |
| `rec:FlushRestroom` | `sde:RecreationFeatureUseType_restroom` | Exact | SDSFIE's restroom value is flush-water oriented. |
| `rec:VaultToilet` | `sde:RecreationFeatureUseType_vaultToilet` | Exact | SDSFIE has a specific vault toilet recreation feature type value. |

## Good Matches With Caveats

These alignments are useful, but the caveat should stay visible in implementation profiles.

| USACE recreation concept | SDSFIE anchor | Decision | Caveat |
| --- | --- | --- | --- |
| `recs:RecreationAreaFeature` | `sd:RecreationBoundary` | Close | SDSFIE stores the boundary; recreation keeps the managed recreation area as a separate business entity. |
| `recs:MarinaFeature` | `sd:Marina` | Close | SDSFIE treats marina as a harbor facility; recreation also treats it as a managed recreation and water access facility. |
| `recs:BoatRampFeature` | `sde:RecreationFeatureUseType_boatRamp` | Close | Recreational boat ramps belong under SDSFIE `RecreationFeature` with the boat ramp value, not `sd:BoatRamp`. |
| `recs:PicnicAreaFeature` | `sde:RecreationFeatureUseType_picnicSite` | Close | SDSFIE models this as a coded value rather than a feature class. |
| `recs:SwimmingAreaFeature` | `sde:RecreationFeatureUseType_swimmingDesignatedBeach` | Close | Works when the source feature is a designated beach; other swimming areas need review. |
| `recs:TrailAssociatedFeature` | `sd:RecreationTrailFeature` | Close | Both model point features associated with a trail. Recreation keeps the class platform-independent and carries detailed feature typing through linked concepts rather than mirroring every SDSFIE trail-feature enumerant as an OWL class. |
| `recs:VisitorCenterFeature` | `sde:RecreationFeatureUseType_museumOrVisitorCenter` | Close | SDSFIE combines museums and visitor centers. |
| `rec:Playground` | `sd:Playground` | Close | SDSFIE's class is spatial/entity oriented; recreation keeps playground as an amenity concept. |
| `rec:HikingTrail`, `rec:BikeTrail`, `rec:EquestrianTrail` | SDSFIE trail use values | Close | SDSFIE trail use values can type an implementation of `recs:TrailFeature`. |

## Broad Or Narrow Fits

These are useful for crosswalks, but they should not be treated as clean equivalence.

| USACE recreation concept | SDSFIE anchor | Decision | Plain-language reading |
| --- | --- | --- | --- |
| `recs:RecreationFacilityFeature` | `sd:RecreationFeature` | Broad | SDSFIE's generic recreation feature bucket is broader than the recreation facility role. |
| `recs:RecreationAmenityFeature` | `sd:RecreationFeature` | Broad | SDSFIE's generic recreation feature bucket is broader than the recreation amenity role. |
| `recs:DayUseAreaFeature` | `sd:RecreationFeature` | Broad | SDSFIE has no clean day-use-area feature class. |
| `recs:FishingPierFeature` | `sd:FishingFeature` | Broad | SDSFIE fishing feature is broader than a fishing pier. |
| `recs:FuelDockFeature` | `sd:DockOrWharf` | Broad | SDSFIE dock/wharf is broader than a fuel-service asset. |
| `recs:SwimmingAreaFeature` | `sde:RecreationFeatureUseType_waterActivitySite` | Broad | A water activity site is broader than a designated swimming area. |
| `rec:Restroom` | restroom and vault toilet SDSFIE values | Narrow | SDSFIE separates narrower coded values below the broader recreation restroom concept. |
| `rec:Trail` | hike, bike, and equestrian/pack trail use values | Narrow | SDSFIE trail use values are narrower than the general recreation trail class. |

## Related But Not Equivalent

These links are useful background or migration evidence, but they should not drive automatic class substitution.

| USACE recreation concept | SDSFIE anchor | Decision | Why not equivalent |
| --- | --- | --- | --- |
| `recs:WaterAccessFeature` | `sd:RecreationFeature` | Related | Water access is a facet across several recreation assets, not a single SDSFIE feature class. |
| `recs:FishingPierFeature` | `sd:DockOrWharf` | Related | A fishing pier may be dock-like infrastructure, but the recreation use is more specific. |
| `rec:BoatSlip` | `sd:DockOrWharf` | Related | A slip is a managed mooring location, not necessarily the dock or wharf structure. |
| `rec:PumpOutStation` | `sd:DockOrWharf` | Related | A pump-out station may sit on dock infrastructure, but is a service asset. |
| `recs:LandClassificationAreaFeature` | `sd:LandUse` | Related | USACE recreation land classifications are source governance concepts, not simply SDSFIE land use. |
| `recs:WaterSurfaceZoneFeature` | `sd:RestrictedArea` | Related | Only restrictive water-surface zones fit this relation. Other zone types need source-specific review. |

## Misses And Intentional Non-Matches

These are the important gaps to show reviewers. They are not errors; they are places where forcing a SDSFIE mapping would reduce clarity.

| Recreation need | SDSFIE candidate | Gap decision | Why we do not force it |
| --- | --- | --- | --- |
| `recs:ProjectBoundaryFeature` | `sd:RecreationBoundary` | No default mapping | A project boundary is not automatically a recreation area boundary. |
| Recreational boat ramps | `sd:BoatRamp` | Intentional non-match | SDSFIE scopes `sd:BoatRamp` to non-recreational ramps and directs recreational ramps to `sd:RecreationFeature` with the boat ramp value. |
| Day-use areas | `sd:RecreationFeature` | Partial gap | SDSFIE has only the generic recreation feature anchor; recreation keeps day-use area as a facility concept. |
| Water access assets | `sd:RecreationFeature`, `sd:DockOrWharf`, type values | Partial gap | Water access is a modeling facet across ramps, marinas, piers, beaches, docks, and services. |
| Boat slips | `sd:DockOrWharf` | Partial gap | SDSFIE can describe dock/wharf infrastructure, but not the managed mooring-unit concept by default. |
| Pump-out stations | `sd:DockOrWharf` | Partial gap | Dock location is related; pump-out service semantics are not captured by the SDSFIE dock class alone. |
| Recreation land classification | `sd:LandUse` | Partial gap | SDSFIE land use is related, but USACE land allocation/classification terms are source governance categories. |
| Water-surface zoning | `sd:RestrictedArea` | Partial gap | Restricted area applies only to zones that restrict access or activity. |
| Visitor centers | `sde:RecreationFeatureUseType_museumOrVisitorCenter` | Grain mismatch | SDSFIE combines museum and visitor center into one value. |
| Restrooms | `sde:RecreationFeatureUseType_restroom`, `sde:RecreationFeatureUseType_vaultToilet` | Grain mismatch | SDSFIE separates flush restroom and vault toilet values; recreation also keeps a broader restroom class. |
| SDSFIE recreation families outside current USACE formal-guidance scope | `sd:GolfCourseFeature`, `sd:HuntingFeature`, related typed feature families | Scope boundary | These may matter to broader SDSFIE recreation enhancement, but the current USACE recreation ontology is derived first from formal USACE guidance. `golf` is not foundational in `EP 1130-2-550`, and `hunting` appears there as activity and permit context rather than as a facility-feature family. |

## Civilian Review Takeaway

The recreation ontology integrates SDSFIE concepts where appropriate, especially where SDSFIE gives a clear feature or coded-value anchor. It also records gaps where SDSFIE's flat feature model is too broad, too narrow, or aimed at a different storage convention, so future implementation work can preserve both SDSFIE alignment and recreation model clarity.

The practical rule is:

- Exact and close matches are good default candidates.
- Broad, narrow, and related matches require review in an implementation profile.
- No-default-mapping rows should not be automated without source-specific evidence.
- SDSFIE remains the external spatial standard; recreation remains the clearer conceptual model for managed recreation operations.
