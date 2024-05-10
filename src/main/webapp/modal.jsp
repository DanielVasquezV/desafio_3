<!-- index.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>

<div id="errorModal" class="fixed inset-0 z-50 overflow-auto bg-gray-900 bg-opacity-50 flex">
    <div class="relative p-8 bg-white w-full max-w-md m-auto flex-col flex rounded-lg shadow-lg">
        <div class="flex justify-between items-center mb-4">
            <h5 class="text-lg font-semibold">Error</h5>
            <button type="button" class="text-gray-600 hover:text-gray-800 focus:outline-none" onclick="closeModal()">×</button>
        </div>
        <div class="mb-4">
            <p class="text-sm text-gray-600" id="errorMessage">El estudiante ya posee nota en la materia.</p>
        </div>
        <div class="flex justify-end">
            <button type="button" class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600 focus:outline-none" onclick="closeModal()">Cerrar</button>
        </div>
    </div>
</div>

<script>
    function closeModal() {
        document.getElementById('errorModal').classList.add("hidden");
        window.location.href = 'add_grade.jsp';
    }
</script>
</body>
</html>
