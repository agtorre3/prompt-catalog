import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = { 
        path: String,
        targetName: { type: String, default: "character_ids[]" },
        initial: Array // Add support for initial selected characters
    }
    
    connect() {
        this.selectedCharacters = new Set()
        this.resultsContainer = document.createElement('div')
        this.resultsContainer.className = 'absolute mt-1 bg-gray-100 w-full rounded-md shadow-lg'
        this.element.appendChild(this.resultsContainer)

        // Render initial tokens if present
        if (this.hasInitialValue && Array.isArray(this.initialValue)) {
            this.initialValue.forEach(character => {
                this.selectCharacter(character)
            })
        }
    }

    search(event) {
        clearTimeout(this.timeout)

        const input = event.target;
        const value = input.value;

        this.timeout = setTimeout(async() => {
            await this.performSearch(value)
        }, 300);    
    }

    async performSearch(value) {
        if (!value) {
            this.resultsContainer.innerHTML = ''
            return
        }

        try {
            const response = await fetch(`${this.pathValue}?query=${encodeURIComponent(value)}`, {
                method: 'GET',
                headers: {
                    'Accept': 'application/json',
                    'X-Requested-With': 'XMLHttpRequest'
                }
            });
            
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            
            const data = await response.json();
            this.updateTokens(data);
        } catch (error) {
            console.error('Error performing search:', error);
        }
    }

    updateTokens(data) {
        this.resultsContainer.innerHTML = ''
        
        if (data.length === 0) {
            const noResults = document.createElement('div')
            noResults.className = 'p-2 text-gray-500'
            noResults.textContent = 'No characters found'
            this.resultsContainer.appendChild(noResults)
            return
        }

        data.forEach(character => {
            const characterElement = document.createElement('div')
            characterElement.className = 'hover:bg-gray-200 cursor-pointer'
            characterElement.textContent = character.name
            characterElement.dataset.characterId = character.id
            
            characterElement.addEventListener('click', () => {
                this.selectCharacter(character)
                this.resultsContainer.innerHTML = ''
            })
            
            this.resultsContainer.appendChild(characterElement)
        })
    }

    selectCharacter(character) {
        if (this.selectedCharacters.has(character.id)) return

        this.selectedCharacters.add(character.id)
        
        const token = document.createElement('div')
        token.className = 'inline-flex items-center px-2 py-1 rounded-full bg-blue-100 text-blue-800 mr-2 mb-2'
        token.innerHTML = `
            ${character.name}
            <button type="button" class="ml-1 text-blue-600 hover:text-blue-800" data-character-id="${character.id}">
                ×
            </button>
        `
        
        token.querySelector('button').addEventListener('click', () => {
            this.selectedCharacters.delete(character.id)
            token.remove()
            this.updateHiddenInput()
        })
        
        const tokensContainer = this.element.querySelector('.selected-tokens') || this.createTokensContainer()
        tokensContainer.appendChild(token)
        
        this.updateHiddenInput()
        
        const searchInput = this.element.querySelector('input[type="text"]')
        if (searchInput) {
            searchInput.value = ''
        }
    }

    createTokensContainer() {
        const container = document.createElement('div')
        container.className = 'selected-tokens flex flex-wrap mt-2'
        this.element.appendChild(container)
        return container
    }

    updateHiddenInput() {
        // Remove all hidden inputs created by this controller
        // This will match all hidden inputs whose name starts with the base of targetNameValue (up to the first [ or end)
        const baseName = this.targetNameValue.split('[')[0];
        const allInputs = this.element.querySelectorAll('input[type="hidden"]');
        allInputs.forEach(input => {
            if (input.name.startsWith(baseName)) {
                input.remove();
            }
        });

        // Add one hidden input per selected character
        Array.from(this.selectedCharacters).forEach((characterId, index) => {
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = this.targetNameValue.includes('[INDEX]')
                ? this.targetNameValue.replace('INDEX', index)
                : this.targetNameValue;
            input.value = characterId;
            this.element.appendChild(input);
        });
    }
}
