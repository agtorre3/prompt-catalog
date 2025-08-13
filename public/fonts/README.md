# Font Files Setup

To use the Garamond Original Pro font in your application, you need to add the font files to this directory.

## Required Font Files

### Garamond Original Pro
Place the following font files in this directory:

- `Garamond-Original-Pro-Regular.woff2` (Regular weight)
- `Garamond-Original-Pro-Regular.woff` (Regular weight, fallback)
- `Garamond-Original-Pro-Regular.ttf` (Regular weight, fallback)
- `Garamond-Original-Pro-Italic.woff2` (Italic style)
- `Garamond-Original-Pro-Italic.woff` (Italic style, fallback)
- `Garamond-Original-Pro-Italic.ttf` (Italic style, fallback)
- `Garamond-Original-Pro-Bold.woff2` (Bold weight)
- `Garamond-Original-Pro-Bold.woff` (Bold weight, fallback)
- `Garamond-Original-Pro-Bold.ttf` (Bold weight, fallback)
- `Garamond-Original-Pro-Bold-Italic.woff2` (Bold italic style)
- `Garamond-Original-Pro-Bold-Italic.woff` (Bold italic style, fallback)
- `Garamond-Original-Pro-Bold-Italic.ttf` (Bold italic style, fallback)

### NCT Torin
Place the following font files in this directory:

- `NCT-Torin-Regular.woff2` (Regular weight)
- `NCT-Torin-Regular.woff` (Regular weight, fallback)
- `NCT-Torin-Regular.ttf` (Regular weight, fallback)
- `NCT-Torin-Italic.woff2` (Italic style)
- `NCT-Torin-Italic.woff` (Italic style, fallback)
- `NCT-Torin-Italic.ttf` (Italic style, fallback)
- `NCT-Torin-Bold.woff2` (Bold weight)
- `NCT-Torin-Bold.woff` (Bold weight, fallback)
- `NCT-Torin-Bold.ttf` (Bold weight, fallback)
- `NCT-Torin-Bold-Italic.woff2` (Bold italic style)
- `NCT-Torin-Bold-Italic.woff` (Bold italic style, fallback)
- `NCT-Torin-Bold-Italic.ttf` (Bold italic style, fallback)

## Font Sources

You can obtain these font files from:
- Adobe Fonts (formerly Typekit)
- Direct purchase from Adobe
- Your design team or brand guidelines

## Usage

Once the font files are in place, you can use the font in your application with:

### CSS Classes
```css
/* Garamond Original Pro */
.font-garamond { /* Regular weight */ }
.font-garamond-bold { /* Bold weight */ }
.font-garamond-italic { /* Italic style */ }

/* NCT Torin */
.font-torin { /* Regular weight */ }
.font-torin-bold { /* Bold weight */ }
.font-torin-italic { /* Italic style */ }
```

### Tailwind Classes
```html
<!-- Garamond Original Pro -->
<h1 class="font-garamond text-4xl">Your Title</h1>
<h2 class="font-garamond-bold text-2xl">Your Subtitle</h2>
<p class="font-garamond-italic">Emphasized text</p>

<!-- NCT Torin -->
<h3 class="font-torin text-2xl">Modern Header</h3>
<p class="font-torin-bold">Bold text</p>
<em class="font-torin-italic">Italic emphasis</em>
```

### Direct CSS
```css
/* Garamond Original Pro */
.your-header {
  font-family: 'Garamond Original Pro', serif;
  font-weight: 700;
}

/* NCT Torin */
.modern-text {
  font-family: 'NCT Torin', sans-serif;
  font-weight: 400;
}
```
