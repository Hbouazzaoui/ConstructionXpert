const themeToggle = document.getElementById('themeToggle');
const body = document.body;

// Check for saved theme preference
const currentTheme = localStorage.getItem('theme');
if (currentTheme === 'dark') {
    body.classList.add('dark-mode');
    themeToggle.innerHTML = '<i class="fas fa-sun"></i>';
} else {
    themeToggle.innerHTML = '<i class="fas fa-moon"></i>';
}

themeToggle.addEventListener('click', () => {
    body.classList.toggle('dark-mode');
    if (body.classList.contains('dark-mode')) {
        localStorage.setItem('theme', 'dark');
        themeToggle.innerHTML = '<i class="fas fa-sun"></i>';
    } else {
        localStorage.setItem('theme', 'light');
        themeToggle.innerHTML = '<i class="fas fa-moon"></i>';
    }
});

// Modal Functions
function fillModal(id, name, type, supplier, quantity) {
    document.getElementById('resourceModalLabel').textContent = 'Edit Resource';
    document.getElementById('resourceId').value = id;
    document.getElementById('resourceName').value = name;
    document.getElementById('resourceType').value = type;
    document.getElementById('supplier').value = supplier;
    document.getElementById('quantity').value = quantity;

    // Update form action for editing
    document.getElementById('resourceForm').action = "<%= request.getContextPath() %>/resource?action=updateResource";
}

function resetModal() {
    document.getElementById('resourceModalLabel').textContent = 'Add New Resource';
    document.getElementById('resourceForm').reset();
    document.getElementById('resourceId').value = '';

    // Reset form action for adding new resource
    document.getElementById('resourceForm').action = "<%= request.getContextPath() %>/resource?action=insertResource";
}