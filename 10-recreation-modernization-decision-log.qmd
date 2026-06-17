# Recreation Modernization Decision Log

| Topic | Decision | Rationale |
| --- | --- | --- |
| RecreationFacility | Preserve with narrower role | Business/domain role for managed recreation facilities; not a spatial feature or geometry. |
| RecreationAmenity | Preserve with clearer role | Supporting asset role associated with facilities; amenities may have their own spatial representations. |
| BoatRamp | Split entity and feature | `rec:BoatRamp` is the managed asset; `recs:BoatRampFeature` is the GIS representation. |
| RecreationArea class A/B/C | Reclassify | Treat as source-backed classification concepts unless implementation requires OWL classes. |
| CampAreaClass A/B/C/D/E | Reclassify | Treat as fee/development classification concepts rather than subclasses of Campground. |
| LandClassification and LandAllocation | Reclassify | Preserve as SKOS classification values linked from recreation areas. |
| Trail | Preserve with spatial representation | `rec:Trail` is a managed linear recreation asset; `recs:TrailFeature` is the line representation. |
| Trail-associated point features | Add generic point-feature pattern | `recs:TrailAssociatedFeature` captures point features linked to a trail and typed by source or standard concepts; `recs:TrailheadFeature` is the explicit trailhead class. This avoids collapsing trail line representations and trail-associated point records into one class family. |
| Feature terminology | Retain established naming and document dual use | `Feature` may mean a modeled notable element or class name inherited from source/community practice, and it may also mean a GIS feature or spatial record. Do not rename solely to remove the ambiguity; disambiguate with explicit definitions, notes, representation metadata, and role concepts. |
| Marina | Preserve and facet | Business facility and water access asset; spatial representation may include multiple geometry records. |
| FuelDock and generic dock semantics | Defer broad generalization | Generic dock semantics require physical-realm and implementation review before broad inheritance. |
| Legacy schema fields | Use as migration evidence | Existing fields inform crosswalks and implementation profiles but do not define target ontology semantics. |
| Spatial extension | Rebuild | Spatial features must use explicit representation relationships, not only `skos:related`. |
