# Workshop Slides

This directory contains the presentation slides for the Cursor AI Workshop in multiple formats.

## Available Formats

- **`CursorWorkshop.pptx`** - PowerPoint presentation (6.3 MB)
  - Use for presenting with PowerPoint, Keynote, or Google Slides
  - Full animations and formatting
  - Best for live presentations

- **`CursorWorkshop.pdf`** - PDF document (350 KB)
  - Use for printing or sharing
  - Works on any device
  - Great for handouts

- **`CursorWorkshop.html`** - HTML presentation (152 KB)
  - Use for web-based presenting
  - Open in any browser
  - Use arrow keys to navigate
  - Press `P` for presenter mode

- **`SLIDES_MARP.md`** - Marp Markdown source
  - Editable source file
  - Use to customize slides
  - Can regenerate all formats

- **`SLIDES.md`** - Original markdown (reference)
  - Complete slide content
  - Easy to read
  - Can be viewed on GitHub

## How to Present

### Using PowerPoint/Keynote
1. Open `CursorWorkshop.pptx`
2. Enter presentation mode
3. Use arrow keys or click to navigate

### Using HTML (Recommended for Remote)
1. Open `CursorWorkshop.html` in a browser
2. Press `F` for fullscreen
3. Press `P` for presenter mode (shows notes)
4. Use arrow keys to navigate
5. Press `Esc` to exit fullscreen

### Using PDF
1. Open `CursorWorkshop.pdf`
2. Enter presentation mode in your PDF viewer
3. Navigate with arrow keys or page controls

## Customizing Slides

### Edit the Source
1. Open `SLIDES_MARP.md` in any text editor
2. Make your changes
3. Regenerate presentations (see below)

### Marp Syntax
The slides use Marp markdown with these features:

```markdown
---
# New slide with title

Regular content here

---
# Another slide
```

### Regenerate Presentations

After editing `SLIDES_MARP.md`, regenerate all formats:

```bash
# Generate PowerPoint
npm run slides:pptx

# Generate PDF
npm run slides:pdf

# Generate HTML
npm run slides:html

# Generate all formats at once
npm run slides:all
```

### Live Preview While Editing

```bash
# Start watch mode (auto-regenerates HTML on save)
npm run slides:watch
```

Then open `CursorWorkshop.html` in your browser and refresh to see changes.

## Slide Structure

The presentation contains approximately 50 slides organized into sections:

1. **Introduction** (Slides 1-10)
   - Welcome and objectives
   - What is Cursor
   - Core features overview

2. **AI-Powered Code Generation** (Slides 11-17)
   - Effective prompting
   - Generating components and functions
   - Lab 2 preview

3. **Refactoring & Understanding Code** (Slides 18-24)
   - Understanding legacy code
   - Smart refactoring
   - Lab 3 preview

4. **Debugging with AI** (Slides 25-31)
   - AI-powered debugging workflow
   - Common scenarios
   - Lab 4 preview

5. **Advanced Features** (Slides 32-38)
   - Composer mode
   - .cursorrules
   - Custom instructions
   - Labs 5 & 6 preview

6. **Best Practices** (Slides 39-45)
   - Do's and don'ts
   - Security considerations
   - Testing AI-generated code
   - Productivity tips

7. **Wrap-up** (Slides 46-50)
   - Recap
   - Next steps
   - Resources
   - Q&A
   - Quick reference

## Presentation Tips

### Timing
- 3-hour workshop = ~3-4 minutes per slide
- Adjust pace based on audience
- Allow time for questions
- Demos take longer than you think

### Engagement
- Ask questions throughout
- Encourage participation
- Share real examples
- Show live demos

### Technical Setup
- Test equipment beforehand
- Have backup presentations ready
- Keep slides open on second screen
- Have code examples ready

## Customization Ideas

### For Different Audiences

**Students:**
- Add more basic examples
- Slow down explanations
- Include more step-by-step instructions

**Professional Developers:**
- Skip basics quickly
- Add advanced examples
- Focus on real-world scenarios

**Teams:**
- Add company-specific examples
- Include team .cursorrules
- Add collaboration tips

### For Different Durations

**2-hour workshop:**
- Remove some advanced slides
- Shorten examples
- Skip optional topics

**Half-day workshop:**
- Add more examples
- Include team exercises
- Add case studies

## Troubleshooting

### Can't generate presentations?
```bash
# Make sure Marp is installed
npm install

# Try generating manually
npx @marp-team/marp-cli slides/SLIDES_MARP.md -o slides/output.pdf
```

### HTML slides not working?
- Make sure you're opening the HTML file (not the markdown)
- Try a different browser
- Check browser console for errors

### PowerPoint formatting issues?
- Marp generates basic PPTX
- Some advanced formatting may not transfer
- Edit in PowerPoint if needed

### Need different theme?
Edit the frontmatter in `SLIDES_MARP.md`:

```yaml
---
marp: true
theme: gaia  # or default, uncover
---
```

## Resources

- [Marp Documentation](https://marpit.marp.app/)
- [Marp CLI](https://github.com/marp-team/marp-cli)
- [Markdown Guide](https://www.markdownguide.org/)

## License

MIT License - Free to use and modify for your workshops.

---

**Need help?** Check the main README.md or INSTRUCTOR_GUIDE.md
