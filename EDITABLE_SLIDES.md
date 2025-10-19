# Creating Editable PowerPoint Slides

## The Problem

Marp generates PowerPoint slides as **rendered images/shapes**, not editable text. This means:
- ❌ Can't edit text in PowerPoint
- ❌ Can't copy slides to existing presentations
- ❌ New slides appear blank when inserted

## Solutions

### Option 1: Use HTML for Presenting (Recommended) ⭐

The HTML version is **fully functional** and better for presenting:

```bash
# Open in browser
open slides/CursorWorkshop.html
```

**Features:**
- ✅ Arrow keys to navigate
- ✅ Press 'F' for fullscreen
- ✅ Press 'P' for presenter mode with notes
- ✅ Works on any device
- ✅ Smooth transitions
- ✅ No installation needed

**Why This is Better:**
- Modern, professional presentation
- Works everywhere (even mobile)
- Built-in presenter mode
- Easy to share (just send the HTML file)
- Editable by updating markdown source

---

### Option 2: Create Editable PowerPoint with Pandoc

This creates **native PowerPoint** with editable text boxes.

#### Step 1: Install Pandoc

```bash
# Mac
brew install pandoc

# Ubuntu/Debian
sudo apt-get install pandoc

# Windows
# Download from: https://pandoc.org/installing.html
```

#### Step 2: Generate Editable PowerPoint

```bash
# Use the provided script
npm run slides:editable

# Or manually
bash scripts/create-editable-pptx.sh
```

This creates: `slides/CursorWorkshop-Editable.pptx`

**Result:**
- ✅ Fully editable text
- ✅ Native PowerPoint format
- ✅ Can insert into existing presentations
- ⚠️ Basic formatting (style in PowerPoint)

---

### Option 3: Manual Approach

If you need specific styling, manually recreate key slides:

1. Open `slides/CursorWorkshop.html` in browser
2. View each slide
3. Recreate important ones in PowerPoint
4. Keep markdown as source of truth
5. Update both when content changes

---

## Comparison

| Format | Editable | Insertable | Best Use |
|--------|----------|------------|----------|
| Marp PPTX | ❌ No | ❌ No | Standalone viewing |
| Marp HTML | ✅ Via markdown | N/A | **Presenting (recommended)** |
| Pandoc PPTX | ✅ Yes | ✅ Yes | **Corporate templates** |
| Manual PPTX | ✅ Yes | ✅ Yes | Custom branding |

---

## Recommended Workflow

### For This Workshop:

**Primary:** Use HTML for presenting
```bash
open slides/CursorWorkshop.html
# Press F for fullscreen, P for presenter mode
```

**Backup:** Generate editable PPTX if required
```bash
npm run slides:editable
```

### For Corporate/Branded Presentations:

1. Use Pandoc to create editable PPTX
2. Apply your company template
3. Maintain markdown as source
4. Regenerate when content updates
5. Re-apply template styling

---

## Step-by-Step: Editable PowerPoint

### 1. Generate Editable Version

```bash
npm run slides:editable
```

**Output:** `slides/CursorWorkshop-Editable.pptx`

### 2. Open in PowerPoint

```bash
# Mac
open slides/CursorWorkshop-Editable.pptx

# Windows
start slides/CursorWorkshop-Editable.pptx

# Linux
libreoffice slides/CursorWorkshop-Editable.pptx
```

### 3. Style as Needed

The slides will have basic formatting. Apply:
- Your color scheme
- Your fonts
- Your company logo
- Your slide master

### 4. Save as Template

Save the styled version as a PowerPoint template (.potx) for future use.

---

## Why Marp PPTX Isn't Editable

Marp converts markdown → HTML → PowerPoint by:
1. Rendering each slide as an image or shape
2. Placing it in PowerPoint
3. No underlying text structure

This is intentional - Marp prioritizes:
- ✅ Consistent rendering
- ✅ Complex layouts
- ✅ Code syntax highlighting
- ✅ Markdown flexibility

But sacrifices:
- ❌ PowerPoint editability

---

## Best Practices

### Use Markdown as Source of Truth

```
SLIDES_MARP.md (source)
    ↓
Generate → CursorWorkshop.html (presenting)
    ↓
Generate → CursorWorkshop-Editable.pptx (if needed)
    ↓
Style in PowerPoint → CursorWorkshop-Final.pptx
```

### Version Control

```bash
# Track markdown in git
git add slides/SLIDES_MARP.md

# Don't track generated files
echo "slides/*.pptx" >> .gitignore
echo "slides/*.pdf" >> .gitignore

# Regenerate when needed
npm run slides:all
```

---

## Troubleshooting

### "Pandoc not found"

```bash
# Install pandoc first
brew install pandoc  # Mac
sudo apt install pandoc  # Linux
```

### "Slides are blank in PowerPoint"

This happens with **Marp-generated** PPTX. Use:
- HTML for presenting, OR
- Pandoc-generated editable PPTX

### "Formatting is lost"

Pandoc creates basic slides. Style them in PowerPoint:
1. Apply slide master
2. Add company branding
3. Adjust fonts/colors
4. Save as template

### "Can't insert into existing presentation"

Only **Pandoc-generated** or manually created slides can be inserted:

```bash
# Generate editable version
npm run slides:editable

# Now you can copy slides from:
slides/CursorWorkshop-Editable.pptx
```

---

## Quick Commands

```bash
# Present with HTML (recommended)
open slides/CursorWorkshop.html

# Create editable PowerPoint
npm run slides:editable

# Generate all formats
npm run slides:all

# Watch and live-reload HTML
npm run slides:watch
```

---

## Recommendations by Use Case

### Workshop Delivery
👉 **Use HTML** (`CursorWorkshop.html`)
- Professional presenter mode
- Works on any device
- No PowerPoint needed

### Corporate Environment (Branded Template Required)
👉 **Use Pandoc** (`npm run slides:editable`)
- Create editable PPTX
- Apply company template
- Insert into existing deck

### Client Presentation (Need to Send File)
👉 **Use PDF** (`CursorWorkshop.pdf`)
- Universal format
- Preserves formatting
- Can't be edited (feature, not bug)

### Quick Edits/Updates
👉 **Edit Markdown** (`SLIDES_MARP.md`)
- Update source
- Regenerate all formats
- Markdown is source of truth

---

## Summary

**The Right Tool for the Job:**

| Need | Use | Command |
|------|-----|---------|
| Present workshop | HTML | `open slides/CursorWorkshop.html` |
| Edit in PowerPoint | Pandoc PPTX | `npm run slides:editable` |
| Share handouts | PDF | Already generated |
| Update content | Markdown | Edit `SLIDES_MARP.md` |
| Insert into deck | Pandoc PPTX | `npm run slides:editable` |

**Bottom Line:**
- Marp PPTX = Not editable (by design)
- HTML = Best for presenting
- Pandoc PPTX = Editable when needed

---

Questions? Check the main README or INSTRUCTOR_GUIDE.md
