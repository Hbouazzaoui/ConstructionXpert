document.addEventListener("DOMContentLoaded", function() {
    // Initialize update project modal
    const updateProjectModal = document.getElementById("updateProjectModal");
    if (updateProjectModal) {
        updateProjectModal.addEventListener("show.bs.modal", function(event) {
            const button = event.relatedTarget;

            // Retrieve data attributes
            const projectId = button.getAttribute("data-id");
            const projectName = button.getAttribute("data-name");
            const projectDescription = button.getAttribute("data-description");
            const startDate = button.getAttribute("data-start-date");
            const endDate = button.getAttribute("data-end-date");
            const budget = button.getAttribute("data-budget");

            // Populate the modal fields
            document.getElementById("projectId").value = projectId;
            document.getElementById("updateProjectName").value = projectName;
            document.getElementById("updateProjectDescription").value = projectDescription;
            document.getElementById("updateStartDate").value = startDate;
            document.getElementById("updateEndDate").value = endDate;
            document.getElementById("updateBudget").value = budget;
        });
    }

    // Set minimum dates for date inputs
    const today = new Date().toISOString().split('T')[0];
    document.getElementById('startDate')?.setAttribute('min', today);
    document.getElementById('endDate')?.setAttribute('min', today);
    document.getElementById('updateStartDate')?.setAttribute('min', today);
    document.getElementById('updateEndDate')?.setAttribute('min', today);

    // Update end date minimum when start date changes
    document.getElementById('startDate')?.addEventListener('change', function() {
        document.getElementById('endDate').min = this.value;
    });

    document.getElementById('updateStartDate')?.addEventListener('change', function() {
        document.getElementById('updateEndDate').min = this.value;
    });
});