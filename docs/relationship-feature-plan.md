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

## 5. Improved Rails-y Approach (AJAX Upsert & Association by ID)

### Rationale
- Keeps upsert logic in the RelationshipsController, not the PromptsController.
- PromptsController only associates existing relationships by ID.
- Follows Rails resourceful conventions and separation of concerns.

### Steps
1. **AJAX Upsert on Add:**
   - When the user clicks "Add New Relationship" in the form, Stimulus sends an AJAX POST to `RelationshipsController#create` with type and character IDs.
   - The controller upserts the relationship (and members), returns the relationship's ID and details as JSON.
   - The frontend adds the relationship (with DB ID) to the list and to a hidden field for the prompt form.
2. **Prompt Form Submission:**
   - Only relationship IDs are submitted with the prompt (via hidden field or nested params).
   - The PromptsController simply associates the prompt with the given relationship IDs (no upsert logic needed).

### Benefits
- Separation of concerns: Relationship creation/upsert logic is in its own controller.
- No duplicate upsert logic: Prompt just associates with existing relationships.
- Cleaner params: Only relationship IDs are passed with the prompt form.
- More interactive: User gets immediate feedback if a relationship already exists or is invalid.

---

**Reference this plan as you implement the relationship feature in the prompt form.** 