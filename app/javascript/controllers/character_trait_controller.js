import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["characterSelect", "traitSelect", "traitsList"]
  static values = {
    initialTraits: Array
  }

  connect() {
    this.addCharacterTraitButton = document.getElementById("add-character-trait-btn")
    this.addCharacterTraitButton.addEventListener("click", this.createCharacterTrait.bind(this))
    
    // Initialize existing traits
    if (this.hasInitialTraitsValue) {
      this.initialTraitsValue.forEach(trait => {
        this.addCharacterTraitToForm({
          id: trait.id,
          name: trait.name
        })
      })
    }
  }

  async createCharacterTrait(event) {
    event.preventDefault()
    
    const characterId = document.getElementById("character-trait-select").value
    const traitId = document.querySelector("select[name='character_trait[trait_id]']").value

    if (!characterId || !traitId) {
      alert("Please select both a character and a trait")
      return
    }

    try {
      const response = await fetch("/character_traits", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
        },
        body: JSON.stringify({
          character_id: characterId,
          trait_id: traitId
        })
      })

      const data = await response.json()

      if (data.success) {
        this.addCharacterTraitToForm(data.character_trait)
        // Reset the selects
        this.characterSelectTarget.value = ""
        this.traitSelectTarget.value = ""
      } else {
        alert("Error: " + data.errors.join(", "))
      }
    } catch (error) {
      console.error("Error:", error)
      alert("An error occurred while adding the character trait")
    }
  }

  addCharacterTraitToForm(characterTrait) {
    // Create hidden input for the character trait
    const hiddenInput = document.createElement("input")
    hiddenInput.type = "hidden"
    hiddenInput.name = "prompt[character_trait_ids][]"
    hiddenInput.value = characterTrait.id

    // Create visual representation of the trait
    const traitElement = document.createElement("div")
    traitElement.className = "flex items-center justify-between bg-gray-100 rounded p-2 mb-2"
    traitElement.dataset.characterTraitId = characterTrait.id
    
    const traitText = document.createElement("span")
    traitText.textContent = characterTrait.name
    
    const removeButton = document.createElement("button")
    removeButton.type = "button"
    removeButton.className = "text-red-600 hover:text-red-800"
    removeButton.textContent = "×"
    removeButton.onclick = () => {
      traitElement.remove()
      hiddenInput.remove()
    }

    traitElement.appendChild(traitText)
    traitElement.appendChild(removeButton)
    
    // Add both the hidden input and visual element to the form
    this.traitsListTarget.appendChild(hiddenInput)
    this.traitsListTarget.appendChild(traitElement)
  }
} 