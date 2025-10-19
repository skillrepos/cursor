#!/bin/bash

# Create Editable PowerPoint from Markdown
# This uses Pandoc to create native PowerPoint with editable text

echo "Creating editable PowerPoint presentation..."

# Check if pandoc is installed
if ! command -v pandoc &> /dev/null; then
    echo "❌ Pandoc not found. Installing..."

    # Detect OS and install
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Installing pandoc via Homebrew..."
        brew install pandoc
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "Installing pandoc via apt..."
        sudo apt-get update && sudo apt-get install -y pandoc
    else
        echo "Please install pandoc manually: https://pandoc.org/installing.html"
        exit 1
    fi
fi

# Clean up the markdown for Pandoc (remove Marp-specific syntax)
echo "Preparing markdown..."

# Create a pandoc-friendly version by removing only the YAML front matter
awk 'BEGIN {in_yaml=0; yaml_count=0}
     /^---$/ {yaml_count++; if(yaml_count<=2) {in_yaml=(yaml_count==1); next}}
     !in_yaml {print}' slides/SLIDES_MARP.md > slides/SLIDES_PANDOC.md

# Convert to PowerPoint
echo "Converting to PowerPoint..."
pandoc slides/SLIDES_PANDOC.md \
    -o slides/CursorWorkshop-Editable.pptx \
    --slide-level=2 \
    --reference-doc=slides/reference.pptx 2>/dev/null || \
pandoc slides/SLIDES_PANDOC.md \
    -o slides/CursorWorkshop-Editable.pptx \
    --slide-level=2

# Clean up temp file
rm slides/SLIDES_PANDOC.md

echo "✅ Created: slides/CursorWorkshop-Editable.pptx"
echo ""
echo "This PowerPoint has:"
echo "  ✓ Editable text boxes"
echo "  ✓ Native PowerPoint format"
echo "  ✓ Can be inserted into existing presentations"
echo ""
echo "Note: Formatting may be basic. Style it in PowerPoint as needed."
