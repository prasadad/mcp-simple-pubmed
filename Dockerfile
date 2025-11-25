FROM python:3.10-slim

WORKDIR /app

# Copy all repo files to /app
COPY . /app

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose the default MCP HTTP port
EXPOSE 8080

# Required environment variables; these will be set at runtime by Smithery
ENV PUBMED_EMAIL="adprasad.amballa@gmail.com"
ENV PUBMED_API_KEY="96894d143d4d6ea3e6ef634a1d1e11935808"

# Run MCP in HTTP mode on startup
CMD ["python", "-m", "mcp_simple_pubmed", "--host", "0.0.0.0", "--port", "8080"]
