#!/bin/bash

# Create a temporary directory for processing
mkdir -p temp_dsa_pdf

# Create the main markdown file
cat > temp_dsa_pdf/combined_dsa.md << 'EOL'
# Data Structures and Algorithms Comprehensive Guide

## Table of Contents
1. [Introduction](#introduction)
2. [Complexity Analysis](#complexity-analysis)
3. [Arrays and Linked Lists](#arrays-and-linked-lists)
4. [Stacks and Queues](#stacks-and-queues)
5. [Trees](#trees)
6. [Graphs](#graphs)
7. [Hashing](#hashing)
8. [Searching Algorithms](#searching-algorithms)
9. [Sorting Algorithms](#sorting-algorithms)
10. [Recursion](#recursion)
11. [Dynamic Programming](#dynamic-programming)
12. [Greedy Algorithms](#greedy-algorithms)
13. [Concurrency](#concurrency)

## Introduction
EOL

# Copy the README content
cat docs/data-structures-and-algorithms/README.md >> temp_dsa_pdf/combined_dsa.md

# Add each module's content
echo -e "\n## Complexity Analysis" >> temp_dsa_pdf/combined_dsa.md
cat docs/data-structures-and-algorithms/complexity-analysis.md >> temp_dsa_pdf/combined_dsa.md

echo -e "\n## Arrays and Linked Lists" >> temp_dsa_pdf/combined_dsa.md
cat docs/data-structures-and-algorithms/arrays-and-linked-lists.md >> temp_dsa_pdf/combined_dsa.md

echo -e "\n## Stacks and Queues" >> temp_dsa_pdf/combined_dsa.md
cat docs/data-structures-and-algorithms/stacks-and-queues.md >> temp_dsa_pdf/combined_dsa.md

echo -e "\n## Trees" >> temp_dsa_pdf/combined_dsa.md
cat docs/data-structures-and-algorithms/trees.md >> temp_dsa_pdf/combined_dsa.md

echo -e "\n## Graphs" >> temp_dsa_pdf/combined_dsa.md
cat docs/data-structures-and-algorithms/graphs.md >> temp_dsa_pdf/combined_dsa.md

echo -e "\n## Hashing" >> temp_dsa_pdf/combined_dsa.md
cat docs/data-structures-and-algorithms/hashing.md >> temp_dsa_pdf/combined_dsa.md

echo -e "\n## Searching Algorithms" >> temp_dsa_pdf/combined_dsa.md
cat docs/data-structures-and-algorithms/searching.md >> temp_dsa_pdf/combined_dsa.md

echo -e "\n## Sorting Algorithms" >> temp_dsa_pdf/combined_dsa.md
cat docs/data-structures-and-algorithms/sorting.md >> temp_dsa_pdf/combined_dsa.md

echo -e "\n## Recursion" >> temp_dsa_pdf/combined_dsa.md
cat docs/data-structures-and-algorithms/recursion.md >> temp_dsa_pdf/combined_dsa.md

echo -e "\n## Dynamic Programming" >> temp_dsa_pdf/combined_dsa.md
cat docs/data-structures-and-algorithms/dynamic-programming.md >> temp_dsa_pdf/combined_dsa.md

echo -e "\n## Greedy Algorithms" >> temp_dsa_pdf/combined_dsa.md
cat docs/data-structures-and-algorithms/greedy-algorithms.md >> temp_dsa_pdf/combined_dsa.md

echo -e "\n## Concurrency" >> temp_dsa_pdf/combined_dsa.md
cat docs/data-structures-and-algorithms/concurrency.md >> temp_dsa_pdf/combined_dsa.md

# Install required packages if not already installed
if ! command -v pandoc &> /dev/null; then
    echo "Installing pandoc..."
    sudo dnf install -y pandoc
fi

if ! command -v wkhtmltopdf &> /dev/null; then
    echo "Installing wkhtmltopdf..."
    sudo dnf install -y wkhtmltopdf
fi

# Convert markdown to PDF with proper styling
pandoc temp_dsa_pdf/combined_dsa.md \
    --pdf-engine=wkhtmltopdf \
    --standalone \
    --toc \
    --toc-depth=3 \
    --highlight-style=tango \
    --variable=geometry:margin=1in \
    --variable=documentclass:article \
    --variable=fontsize:11pt \
    --variable=mainfont:DejaVuSerif \
    --variable=monofont:DejaVuSansMono \
    -o DSA_Comprehensive_Guide.pdf

# Clean up
rm -rf temp_dsa_pdf

echo "PDF generation complete! Check DSA_Comprehensive_Guide.pdf" 