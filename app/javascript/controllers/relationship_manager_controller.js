import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["typeRadio", "characterTokenizer", "relationshipList", "relationshipsInput"]
  static values = {
    characters: Array,
    initialRelationships: Array
  }

  connect() {
    this.relationships = this.initialRelationshipsValue || [];
    this.renderRelationships();
    this.updateInput();
  }

  addRelationship() {
    const type = this.typeRadioTargets.find(r => r.checked)?.value;
    const tokenizerElement = this.characterTokenizerTarget;
    const tokenizerController = this.application.getControllerForElementAndIdentifier(tokenizerElement, "multi-select-tokenizer");
    const characterIds = tokenizerController ? Array.from(tokenizerController.selectedCharacters) : [];
    
    if (!type) {
      alert("Please select a relationship type.");
      return;
    }
    if (characterIds.length < 2) {
      alert("Please select at least two characters.");
      return;
    }

    const data = {
      relationship: {
        relationship_type: type,
        relationship_members_attributes: characterIds.map(id => ({ character_id: id }))
      }
    };

    fetch('/relationships', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify(data)
    })
    .then(response => response.json())
    .then(data => {
      if (data.errors) {
        alert(Object.values(data.errors).flat().join(', '));
        return;
      }
      this.relationships.push({
        id: data.id,
        type: data.relationship_type,
        character_ids: data.characters.map(c => c.id)
      });
      this.renderRelationships();
      this.updateInput();
      // Clear selection
      this.typeRadioTargets.forEach(r => r.checked = false);
      if (tokenizerController) {
        tokenizerController.selectedCharacters.clear();
        const tokensContainer = tokenizerElement.querySelector('.selected-tokens');
        if (tokensContainer) tokensContainer.innerHTML = '';
        const searchInput = tokenizerElement.querySelector('input[type="text"]');
        if (searchInput) searchInput.value = '';
      }
    })
    .catch(error => {
      console.error('Error:', error);
      alert('An error occurred while creating the relationship.');
    });
  }

  renderRelationships() {
    this.relationshipListTarget.innerHTML = '';
    this.relationships.forEach((rel, idx) => {
      const names = rel.character_ids.map(id => this.characterName(id)).join(' / ');
      const typeLabel = rel.type === 'friendly' ? 'Friendly' : 'Romantic';
      const symbol = rel.type === 'friendly' ? '&' : '/';
      const li = document.createElement('li');
      li.innerHTML = `${names.replace(/\//g, ` ${symbol} `)} (${typeLabel}) <button type="button" data-action="click->relationship-manager#removeRelationship" data-index="${idx}" class="ml-2 text-red-500">Remove</button>`;
      this.relationshipListTarget.appendChild(li);
    });
  }

  removeRelationship(event) {
    const idx = parseInt(event.target.dataset.index);
    this.relationships.splice(idx, 1);
    this.renderRelationships();
    this.updateInput();
  }

  updateInput() {
    this.relationshipsInputTarget.value = JSON.stringify(this.relationships);
  }

  characterName(id) {
    const c = this.charactersValue.find(c => c.id === id);
    return c ? c.name : '';
  }

  arraysEqual(a, b) {
    if (a.length !== b.length) return false;
    const sortedA = [...a].sort();
    const sortedB = [...b].sort();
    return sortedA.every((v, i) => v === sortedB[i]);
  }
} 