#!/bin/bash

# Function to check if a file or directory exists
file_exists() {
    if [ -e "$1" ]; then
        return 0  # File or directory exists
    else
        return 1  # File or directory does not exist
    fi
}

# Create README.md if it doesn't exist
if ! file_exists README.md; then
    touch README.md
    echo "Created README.md"
fi

# Create LICENSE if it doesn't exist
if ! file_exists LICENSE; then
    touch LICENSE
    echo "Created LICENSE"
fi

# Add .env to .gitignore if not already present
if ! grep -qF ".env" .gitignore; then
    echo ".env" >> .gitignore
    echo "Added .env to .gitignore"
fi

# Create missing directories if they don't exist
directories=("backend/app/routes" "backend/app/models" 
"backend/app/services" "backend/tests" "frontend/static/css" 
"frontend/static/js" "frontend/static/img" 
"frontend/templates/includes")

for dir in "${directories[@]}"; do
    if ! file_exists "$dir"; then
        mkdir -p "$dir"
        echo "Created $dir"
    fi
done

# Create necessary Python files if they don't exist
python_files=("backend/app/__init__.py" 
"backend/app/config.py" "backend/app/routes/__init__.py" 
"backend/app/routes/user_routes.py" 
"backend/app/routes/transaction_routes.py" 
"backend/app/models/__init__.py" "backend/app/models/user.py" 
"backend/app/models/transaction.py" 
"backend/app/services/__init__.py" 
"backend/app/services/user_service.py" 
"backend/app/services/transaction_service.py" 
"backend/tests/test_user_routes.py" 
"backend/tests/test_transaction_routes.py" 
"backend/tests/test_services.py")

for file in "${python_files[@]}"; do
    if ! file_exists "$file"; then
        touch "$file"
        echo "Created $file"
    fi
done

# Create necessary HTML and CSS/JS files if they don't exist
html_files=("frontend/templates/base.html" 
"frontend/templates/index.html" 
"frontend/templates/login.html" 
"frontend/templates/dashboard.html" 
"frontend/templates/pending_transactions.html")
css_files=("frontend/static/css/styles.css")
js_files=("frontend/static/js/scripts.js")
img_files=("frontend/static/img/.gitkeep")

# Concatenate all file arrays
all_files=("${html_files[@]}" "${css_files[@]}" 
"${js_files[@]}" "${img_files[@]}")

for file in "${all_files[@]}"; do
    if ! file_exists "$file"; then
        touch "$file"
        echo "Created $file"
    fi
done


# Set executable permissions for the script
chmod +x setup_project.sh

# Inform user that setup is complete
echo "Project setup complete."

