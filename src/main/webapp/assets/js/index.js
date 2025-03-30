const themeToggle = document.getElementById('themeToggle');
const body = document.body;

// Check for saved theme preference in localStorage
if (localStorage.getItem('theme') === 'dark') {
    body.classList.add('dark-mode');
    themeToggle.innerHTML = '<i class="fas fa-sun"></i>'; // Show sun icon for dark mode
} else {
    themeToggle.innerHTML = '<i class="fas fa-moon"></i>'; // Show moon icon for light mode
}

// Toggle theme on button click
themeToggle.addEventListener('click', () => {
    body.classList.toggle('dark-mode');
    if (body.classList.contains('dark-mode')) {
        localStorage.setItem('theme', 'dark');
        themeToggle.innerHTML = '<i class="fas fa-sun"></i>'; // Show sun icon
    } else {
        localStorage.setItem('theme', 'light');
        themeToggle.innerHTML = '<i class="fas fa-moon"></i>'; // Show moon icon
    }
});

// Existing Modal Functions
function fillModal(id, resourceName, resourceType, supplier, quantity) {
    document.getElementById('resourceModalLabel').innerText = 'Edit Resource';
    document.getElementById('resourceId').value = id;
    document.getElementById('resourceName').value = resourceName;
    document.getElementById('resourceType').value = resourceType;
    document.getElementById('supplier').value = supplier;
    document.getElementById('quantity').value = quantity;
    document.getElementById('resourceForm').action = '<%= request.getContextPath() %>/resource?action=updateResource';
}

function resetModal() {
    document.getElementById('resourceModalLabel').innerText = 'Add New Resource';
    document.getElementById('resourceId').value = '';
    document.getElementById('resourceName').value = '';
    document.getElementById('resourceType').value = '';
    document.getElementById('supplier').value = '';
    document.getElementById('quantity').value = '';
    document.getElementById('resourceForm').action = '<%= request.getContextPath() %>/resource?action=insertResource';
}