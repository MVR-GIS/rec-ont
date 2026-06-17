# Recreation SDSFIE Crosswalk

**Status:** v2 review draft
**Date:** 2026-06-17
**Sources:** Recreation v2 artifacts; SDSFIE 5.0 Gold Draft vocabulary, ontology, and enumerations

## Purpose

This is the operator-facing crosswalk for teams that start with a SDSFIE geospatial database and need to map records into the recreation ontology.

Use the tables below as: "If you have this SDSFIE class or coded value, use this recreation ontology term."

The companion file `12-recreation-sdsfie-crosswalk.ttl` remains the machine-readable assertion layer. It still records the formal SKOS predicates from recreation terms to SDSFIE anchors.

## Scope Boundary

The recreation ontology is derived first from formal USACE guidance, especially `EP 1130-2-550`. SDSFIE alignment is secondary.

That means this crosswalk is meant to help with mapping from existing SDSFIE data into the current recreation ontology. It is not a rule that every SDSFIE recreation family must become a USACE recreation class.

## How To Use This Crosswalk

1. Start with the most specific SDSFIE class or coded value available in the source database.
2. Prefer the listed `recs:*Feature` class for the spatial record.
3. When an optional `rec:*` concept is listed, use it to type what the feature represents.
4. If the row says `Review`, do not auto-map it. Keep the source term visible and resolve it in an implementation profile or data-cleanup pass.

## Match Labels

| Label | Meaning for the team |
| --- | --- |
| `Default` | Use this recreation term unless the source record clearly says otherwise. |
| `Conditional` | Use this term only when the source semantics match the note in the row. |
| `Review` | No single safe default target exists in the current ontology. |

## Direct SDSFIE Feature-Class Mappings

| If your SDSFIE source is | Use this recreation spatial class | Optional recreation concept | Match | Notes |
| --- | --- | --- | --- | --- |
| `sd:Campground` | `recs:CampgroundFeature` |  | `Default` | Direct campground-to-campground mapping. |
| `sd:Campsite` | `recs:CampsiteFeature` |  | `Default` | Direct campsite-to-campsite mapping. |
| `sd:RecreationTrail` | `recs:TrailFeature` | `rec:Trail` or a narrower trail concept | `Default` | Use the trail line class. Do not confuse this with point-based trail-associated features. |
| `sd:RecreationTrailFeature` | `recs:TrailAssociatedFeature` |  | `Default` | Use for point features associated with a trail. |
| `sd:ParkingArea` | `recs:ParkingAreaFeature` |  | `Default` | Direct parking-area mapping. |
| `sd:Marina` | `recs:MarinaFeature` |  | `Conditional` | Use when the source record is functioning as a recreation marina, not just a general harbor facility. |
| `sd:RecreationBoundary` | `recs:RecreationAreaFeature` | `rec:RecreationArea` | `Conditional` | Use when the SDSFIE feature is the boundary of a recreation area. Do not use this as the default for `recs:ProjectBoundaryFeature`. |
| `sd:Playground` | `recs:RecreationAmenityFeature` | `rec:Playground` | `Conditional` | The ontology keeps playground primarily as an amenity concept rather than a dedicated spatial subclass. |

## SDSFIE Recreation Feature Type Mappings

Use these rows when the source record is stored as a generic SDSFIE recreation feature and the coded value carries the real meaning.

| If your SDSFIE source is | Use this recreation spatial class | Optional recreation concept | Match | Notes |
| --- | --- | --- | --- | --- |
| `sd:RecreationFeature` + `sde:RecreationFeatureUseType_boatRamp` | `recs:BoatRampFeature` |  | `Default` | This is the correct recreational boat-ramp path. Do not remap these to `sd:BoatRamp`. |
| `sd:RecreationFeature` + `sde:RecreationFeatureUseType_picnicSite` | `recs:PicnicAreaFeature` |  | `Default` | SDSFIE stores picnic-site meaning in the coded value rather than a standalone class. |
| `sd:RecreationFeature` + `sde:RecreationFeatureUseType_restroom` | `recs:RestroomFeature` | `rec:FlushRestroom` | `Default` | SDSFIE restroom is flush-water oriented in this crosswalk. |
| `sd:RecreationFeature` + `sde:RecreationFeatureUseType_vaultToilet` | `recs:RestroomFeature` | `rec:VaultToilet` | `Default` | Use the restroom feature class and type the represented concept as vault toilet. |
| `sd:RecreationFeature` + `sde:RecreationFeatureUseType_museumOrVisitorCenter` | `recs:VisitorCenterFeature` |  | `Conditional` | Use when the source record is functioning as a visitor center. If the source is really a museum, review first. |
| `sd:RecreationFeature` + `sde:RecreationFeatureUseType_swimmingDesignatedBeach` | `recs:SwimmingAreaFeature` |  | `Conditional` | Good fit when the source is a designated swimming beach or area. |
| `sd:RecreationFeature` + `sde:RecreationFeatureUseType_waterActivitySite` | `recs:SwimmingAreaFeature` |  | `Conditional` | Use only when the source is specifically a swimming area. Otherwise review. |
| `sd:RecreationFeature` + `sde:RecreationFeatureUseType_picnicShelter` | `recs:RecreationAmenityFeature` | `rec:PicnicShelter` | `Conditional` | The current ontology has the picnic shelter concept, but not a dedicated picnic-shelter spatial subclass. |

## SDSFIE Trail Use Value Mappings

Use these rows when the source feature is `sd:RecreationTrail` and the trail-use value further narrows the represented concept.

| If your SDSFIE source is | Use this recreation spatial class | Optional recreation concept | Match | Notes |
| --- | --- | --- | --- | --- |
| `sd:RecreationTrail` + `sde:RecreationTrailUseType_hike` | `recs:TrailFeature` | `rec:HikingTrail` | `Conditional` | Keep the spatial class as trail feature and carry the hiking semantics in the represented concept. |
| `sd:RecreationTrail` + `sde:RecreationTrailUseType_bike` | `recs:TrailFeature` | `rec:BikeTrail` | `Conditional` | Keep the spatial class as trail feature and carry the bike semantics in the represented concept. |
| `sd:RecreationTrail` + `sde:RecreationTrailUseType_equestrianOrPack` | `recs:TrailFeature` | `rec:EquestrianTrail` | `Conditional` | SDSFIE combines equestrian and pack use under one value. |

## SDSFIE Sources That Need Review Instead Of Auto-Mapping

| SDSFIE source | Why it needs review | Current recreation guidance |
| --- | --- | --- |
| `sd:RecreationFeature` with no useful type value | Too generic to choose among facility, amenity, water-access, or area patterns. | Review the source semantics before choosing `recs:RecreationFacilityFeature`, `recs:RecreationAmenityFeature`, `recs:WaterAccessFeature`, or another class. |
| `sd:BoatRamp` | SDSFIE scopes this class to non-recreational ramps. | For recreational ramps, use `sd:RecreationFeature` with `sde:RecreationFeatureUseType_boatRamp`, then map to `recs:BoatRampFeature`. |
| `sd:FishingFeature` | Broader than the current fishing-pier concept. | Map to `recs:FishingPierFeature` only when the source record is specifically a fishing pier or platform. |
| `sd:DockOrWharf` | Can represent several different recreation meanings. | Review against `recs:FuelDockFeature`, `recs:FishingPierFeature`, `rec:BoatSlip`, or `rec:PumpOutStation` based on source semantics. |
| `sd:LandUse` | Related, but not equivalent, to USACE recreation land classification. | Use only as reviewed support for `recs:LandClassificationAreaFeature`. |
| `sd:RestrictedArea` | Only some water-surface zones are actually restrictive zones. | Use only as reviewed support for `recs:WaterSurfaceZoneFeature`. |
| `sd:GolfCourseFeature`, `sd:HuntingFeature`, and similar SDSFIE recreation families outside current USACE formal-guidance scope | These are part of broader SDSFIE recreation coverage, but not default USACE recreation ontology targets. | Do not add or auto-map these into the current USACE recreation ontology without separate formal-guidance support and review. |

## Implementation Rule

Use this markdown as the quick operator lookup. Use `12-recreation-sdsfie-crosswalk.ttl` when you need the formal reviewed SKOS assertions behind it.
