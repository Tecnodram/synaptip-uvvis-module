# Repository Security Model

> **Exploratory prototype documentation**

## Security objective

Preserve scientific traceability while preventing accidental publication of sensitive, private, or premature material.

## Private local material

Private local material includes:

- `Proyecto.docx`
- raw photos
- exploratory notes
- unvalidated measurements
- internal observations
- early concept iterations
- raw exports

These materials support engineering work but are not automatically publication-safe.

## Public repository material

Public material may include:

- sanitized documentation
- OpenSCAD parametric models
- reproducible engineering workflows
- generalized geometry descriptions
- validation summaries when evidence-backed
- educational interoperability documentation
- Git-safe screenshots and diagrams

## Blocking rules

The repository must not expose:

- sensitive personal information
- raw institutional information
- unpublished research details
- original raw photos
- private measurements not yet validated
- hidden metadata from source files
- manufacturer proprietary material
- unsafe laboratory procedures

## Operational controls

- `Documents/` remains private local material.
- `Photos/` remains private local material.
- private source file extensions are blocked in `.gitignore`.
- public derivatives must be reviewed before inclusion.
- future validation outputs must be clearly distinguished from hypotheses or raw observations.

