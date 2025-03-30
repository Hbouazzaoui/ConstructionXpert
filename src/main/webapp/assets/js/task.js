document.addEventListener("DOMContentLoaded", function() {
    // Initialize update task modal
    const updateTaskModal = document.getElementById('updateTaskModal');
    if (updateTaskModal) {
        updateTaskModal.addEventListener('show.bs.modal', function(event) {
            const button = event.relatedTarget;

            // Extract data from button attributes
            const taskId = button.getAttribute('data-task-id');
            const projectId = button.getAttribute('data-project-id');
            const description = button.getAttribute('data-description');
            const startDate = button.getAttribute('data-start-date');
            const endDate = button.getAttribute('data-end-date');
            const resources = button.getAttribute('data-resources');

            // Update modal fields
            document.getElementById('updateTaskId').value = taskId;
            document.getElementById('updateProjectId').value = projectId;
            document.getElementById('updateDescription').value = description;
            document.getElementById('updateStartDate').value = startDate;
            document.getElementById('updateEndDate').value = endDate;
            document.getElementById('updateResources').value = resources;
        });
    }

    // Set minimum dates for date inputs
    const today = new Date().toISOString().split('T')[0];
    document.getElementById('start_date')?.setAttribute('min', today);
    document.getElementById('end_date')?.setAttribute('min', today);
    document.getElementById('updateStartDate')?.setAttribute('min', today);
    document.getElementById('updateEndDate')?.setAttribute('min', today);

    // Update end date minimum when start date changes
    document.getElementById('start_date')?.addEventListener('change', function() {
        document.getElementById('end_date').min = this.value;
    });

    document.getElementById('updateStartDate')?.addEventListener('change', function() {
        document.getElementById('updateEndDate').min = this.value;
    });
});