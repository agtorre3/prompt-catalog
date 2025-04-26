import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = { path: String }
    
    connect() {
        this.debouncedSearch = this.debounce(this.performSearch.bind(this), 300)
    }

    search(event) {
        const input = event.target;
        const value = input.value;
        this.debouncedSearch(value);
    }

    debounce(func, wait) {
        let timeout;
        return function executedFunction(...args) {
            const later = () => {
                clearTimeout(timeout);
                func(...args);
            };
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    }

    async performSearch(value) {
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
        // Implement token update logic here
        console.log('Received data:', data);
    }
}
