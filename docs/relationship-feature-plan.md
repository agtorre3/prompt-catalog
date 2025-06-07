# Relationship Feature Plan

## 1. Model Design

- **Prompt**
  - has many `prompt_relationships`
  - has many `relationships` through `prompt_relationships`
- **Relationship**
  - has many `relationship_members`
  - has many `characters` through `relationship_members`
  - has a `relationship_type` (friendly/romantic)
- **Character**
  - has many `relationship_members`
  - has many `relationships` through `relationship_members`
- **PromptRelationship**
  - join table between `Prompt` and `Relationship`
- **RelationshipMember**
  - join table between `Relationship` and `Character`

## 2. Frontend (Form)

- Add a section to create relationships:
  - Select relationship type (friendly/romantic)
  - Multi-select characters (2+)
  - Button to add relationship to a list
  - Show a preview/list of relationships added
- Store relationships in a JS array before form submission.
- On submit, relationships should be sent as part of the form data.

## 3. Backend (Controller)

- On form submit, receive relationships data.
- For each relationship:
  - Upsert (find or create) the relationship (by type and members).
  - Associate the relationship with the prompt.

## 4. Database

- Ensure unique index on relationships (type + members) for upsert.

---

**Reference this plan as you implement the relationship feature in the prompt form.** 