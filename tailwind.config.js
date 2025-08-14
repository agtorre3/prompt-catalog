/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/views/**/*.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      fontFamily: {
        'garamond': ['Garamond Original Pro', 'serif'],
        'garamond-bold': ['Garamond Original Pro', 'serif'],
        'garamond-italic': ['Garamond Original Pro', 'serif'],
        'torin': ['NCT Torin', 'sans-serif'],
        'torin-bold': ['NCT Torin', 'sans-serif'],
        'torin-italic': ['NCT Torin', 'sans-serif'],
        'gordita': ['Gordita', 'sans-serif'],
        'gordita-medium': ['Gordita', 'sans-serif'],
        'gordita-bold': ['Gordita', 'sans-serif'],
        'gordita-black': ['Gordita', 'sans-serif'],
        'gordita-italic': ['Gordita', 'sans-serif'],
      },
    },
  },
  plugins: [],
}
