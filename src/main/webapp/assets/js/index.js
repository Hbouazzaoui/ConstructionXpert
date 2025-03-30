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
document.addEventListener("DOMContentLoaded", function() {
    var elements = document.querySelectorAll(".animatable");
    elements.forEach(function(element) {
        element.classList.remove("hidden");
        element.classList.add("animate");
    });
});

document.addEventListener("DOMContentLoaded", function() {
    // Get all elements with the 'animatable' class
    const animatables = document.querySelectorAll('.animatable');

    // Add show class to each with a delay
    animatables.forEach((el, index) => {
        setTimeout(() => {
            el.classList.remove('hidden');
            el.classList.add('show', 'animate');
        }, 150 * index);
    });

    // Project modal functions (keep these if you need them)
    window.openProjectModal = function(imageUrl, title, description) {
        const modal = document.getElementById('projectModal');
        const modalContent = document.getElementById('projectModalContent');
        document.getElementById('projectTitle').textContent = title;
        document.getElementById('projectDescription').textContent = description;
        modalContent.style.backgroundImage = `url(${imageUrl})`;
        modal.style.display = 'flex';
    };

    window.closeProjectModal = function() {
        document.getElementById('projectModal').style.display = 'none';
    };
});