import os
from flask import Flask, render_template, send_from_directory, abort, request, jsonify
import markdown
from pathlib import Path
import re
import base64

app = Flask(__name__)

# Configuration
app.config['DOCS_FOLDER'] = 'docs'
app.config['MAX_CONTENT_LENGTH'] = 16 * 1024 * 1024  # 16MB max file size
app.config['APP_NAME'] = 'Study Buddy'

def extract_mermaid_from_markdown(markdown_content):
    """Extract mermaid diagrams from markdown before processing."""
    # Find all mermaid code blocks in markdown
    pattern = r'```mermaid\s*([\s\S]*?)\s*```'
    
    # Store found diagrams
    diagrams = []
    
    # Replace each mermaid block with a placeholder
    def replace_with_placeholder(match):
        diagram_content = match.group(1).strip()
        placeholder = f'<!-- MERMAID_DIAGRAM_{len(diagrams)} -->'
        diagrams.append(diagram_content)
        return placeholder
    
    processed_content = re.sub(pattern, replace_with_placeholder, markdown_content)
    
    return processed_content, diagrams

def inject_mermaid_diagrams(html_content, diagrams):
    """Inject mermaid diagrams back into the processed HTML."""
    for i, diagram in enumerate(diagrams):
        placeholder = f'<!-- MERMAID_DIAGRAM_{i} -->'
        html_content = html_content.replace(
            placeholder, 
            f'<div class="mermaid">{diagram}</div>'
        )
    return html_content

def process_mermaid_diagrams(html_content):
    """Convert Mermaid code blocks to proper format for rendering."""
    # First pattern to match: <pre><code class="language-mermaid">...</code></pre>
    pattern1 = r'<pre><code class="language-mermaid">(.*?)</code></pre>'
    
    # Second pattern to match: <pre><code>```mermaid\n...\n```</code></pre>
    pattern2 = r'<pre><code>```mermaid\s*(.*?)\s*```</code></pre>'
    
    # Third pattern for any class containing mermaid
    pattern3 = r'<pre><code[^>]*mermaid[^>]*>(.*?)</code></pre>'
    
    replacement = r'<div class="mermaid">\1</div>'
    
    # Apply all three replacements
    html_content = re.sub(pattern1, replacement, html_content, flags=re.DOTALL)
    html_content = re.sub(pattern2, replacement, html_content, flags=re.DOTALL)
    html_content = re.sub(pattern3, replacement, html_content, flags=re.DOTALL)
    
    return html_content

def get_markdown_content(file_path):
    """Read and convert markdown file to HTML with extended features."""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Extract mermaid diagrams before markdown processing
        processed_content, diagrams = extract_mermaid_from_markdown(content)
        
        # Configure Markdown extensions
        md = markdown.Markdown(extensions=[
            'fenced_code',           # Code blocks
            'tables',                # Tables
            'mdx_math',             # Math equations
            'attr_list',            # HTML attributes
            'def_list',             # Definition lists
            'footnotes',            # Footnotes
            'abbr',                 # Abbreviations
            'md_in_html',           # Markdown inside HTML
            'toc',                  # Table of contents
            'pymdownx.superfences',  # Nested code blocks
            'pymdownx.betterem',    # Better emphasis
            'pymdownx.caret',       # Superscript/subscript
            'pymdownx.mark',        # Highlighting
            'pymdownx.tilde',       # Strike-through
        ], extension_configs={
            'mdx_math': {
                'enable_dollar_delimiter': True,
                'use_gitlab_delimiters': True
            }
        })
        
        # Convert markdown to HTML
        html_content = md.convert(processed_content)
        
        # Inject mermaid diagrams back into the processed HTML
        html_content = inject_mermaid_diagrams(html_content, diagrams)
        
        # Process any remaining mermaid diagrams that might be in code blocks
        html_content = process_mermaid_diagrams(html_content)
        
        # Add a debug comment to see if diagrams are being detected
        if "mermaid" in content.lower() or diagrams:
            print(f"Found mermaid diagram in {file_path}")
            if diagrams:
                print(f"Extracted {len(diagrams)} Mermaid diagrams")
        
        return html_content
    except Exception as e:
        print(f"Error reading file {file_path}: {e}")
        return None

@app.route('/')
def index():
    """Show the main index page with list of subjects."""
    docs_path = Path(app.config['DOCS_FOLDER'])
    subjects = [d.name for d in docs_path.iterdir() if d.is_dir()]
    return render_template('index.html', subjects=subjects)

@app.route('/subject/<subject>')
def subject(subject):
    """Show the list of documents in a subject."""
    subject_path = Path(app.config['DOCS_FOLDER']) / subject
    if not subject_path.exists():
        abort(404)
    
    files = []
    for file_path in subject_path.rglob('*.md'):
        relative_path = file_path.relative_to(subject_path)
        files.append(str(relative_path))
    
    return render_template('subject.html', subject=subject, files=files)

@app.route('/view/<path:filepath>')
def view_document(filepath):
    """View a specific markdown document."""
    full_path = Path(app.config['DOCS_FOLDER']) / filepath
    if not full_path.exists() or not full_path.suffix == '.md':
        abort(404)
    
    content = get_markdown_content(full_path)
    if content is None:
        abort(500)
    
    # Extract subject from filepath (first directory)
    parts = filepath.split('/')
    subject = parts[0] if parts else ''
    
    return render_template('document.html', content=content, title=full_path.stem, subject=subject)

@app.route('/render-mermaid', methods=['POST'])
def render_mermaid():
    """API endpoint to render a Mermaid diagram directly."""
    data = request.get_json()
    if not data or 'diagram' not in data:
        return jsonify({"error": "No diagram provided"}), 400
    
    # Encode the diagram for use in URLs
    diagram_base64 = base64.b64encode(data['diagram'].encode('utf-8')).decode('utf-8')
    
    return jsonify({
        "svg_url": f"https://mermaid.ink/svg/{diagram_base64}",
        "png_url": f"https://mermaid.ink/img/{diagram_base64}"
    })

if __name__ == '__main__':
    app.run(debug=True) 