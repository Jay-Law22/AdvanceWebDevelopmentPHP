# Use Material for MkDocs to build and preview Markdown documentation.
FROM squidfunk/mkdocs-material:9

WORKDIR /docs

# Copy the documentation configuration and Markdown source files.
COPY mkdocs.yml /docs/mkdocs.yml
COPY docs/ /docs/docs/

EXPOSE 8000

# Run the documentation preview server inside the container.
CMD ["serve", "--dev-addr=0.0.0.0:8000"]