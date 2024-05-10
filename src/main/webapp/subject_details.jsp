<%@ page import="sv.edu.udb.desafio_3.beans.EstudianteNota" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 08/05/2024
  Time: 7:29 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%if (request.getAttribute("estudianteNotas") == null){
%><jsp:forward page="/subjectDetails"/>
<%}%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE>
<html>
<head>
    <title>Control de estudiantes</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/f008f6fb10.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="assets/css/modal_styles.css">
</head>
<body class="">
<div class="w-fulll flex flex-col-reverse md:flex-row md:h-screen bg-[#F7EBEC] p-5 h-dvh">
    <!-- SIDEBAR -->
    <div class="sticky top-4 z-10 w-64 bg-white p-4 rounded-lg w-[20rem]">
        <div class="items-center justify-center lg:justify-start p-2 hidden md:flex text-[#59656F] text-2xl">
            <i class="fa-solid fa-book"></i>
            <h2 class="font-black ml-2 hidden lg:block">Gestión de notas</h2>
        </div>
        <div class="md:mt-5 p-2 flex justify-around md:block">
            <a class="flex p-4 items-center text-[#59656F] rounded-md my-1 justify-center cursor-pointer lg:justify-start" href="index.jsp">
                <i class="fa-solid fa-house"></i>
                <h3 class="ml-2 hidden lg:block">Inicio</h3>
            </a>
            <a class="flex p-4 items-center rounded-md my-1 text-[#59656F] justify-center lg:justify-start cursor-pointer hover:font-bold ease-in duration-100" href="add_student.jsp">
                <i class="fa-solid fa-user-tie"></i>
                <h3 class="ml-2 hidden lg:block">Añadir estudiantes</h3>
            </a>
            <a class="flex p-4 items-center rounded-md my-1 text-[#59656F] justify-center lg:justify-start cursor-pointer hover:font-bold ease-in duration-100" href="add_subject.jsp">
                <i class="fa-solid fa-clipboard"></i>
                <h3 class="ml-2 hidden hidden lg:block">Añadir materias</h3>
            </a>
            <a class="flex p-4 items-center rounded-md my-1 text-[#59656F] justify-center lg:justify-start cursor-pointer hover:font-bold ease-in duration-100" href="add_grade.jsp">
                <i class="fa-solid fa-pencil"></i>
                <h3 class="ml-2 hidden hidden lg:block">Añadir notas</h3>
            </a>
            <a class="flex p-4 items-center rounded-md my-1 text-[#59656F] justify-center lg:justify-start cursor-pointer hover:font-bold ease-in duration-100" href="students_view.jsp">
                <i class="fa-solid fa-id-card-clip"></i>
                <h3 class="ml-2 hidden hidden lg:block">Ver Estudiantes</h3>
            </a>
            <a class="flex p-4 items-center rounded-md my-1 bg-[#59656F] text-white justify-center lg:justify-start cursor-pointer hover:font-bold ease-in duration-100" href="subjects_view.jsp">
                <i class="fa-solid fa-book"></i>
                <h3 class="ml-2 hidden hidden lg:block">Ver materias</h3>
            </a>
        </div>
    </div>
    <!--CONTENIDO DE LA PÁGINA-->
    <main class="overflow-x-auto p-7 mb-4 md:bt-0 md:ml-2 bg-white md:w-5/6 rounded-lg h-full">
        <h2 class="text-4xl font-bold mb-4 text-[#59656F] underline">Detalles de Materia</h2>
        <%
            String idMateria = (String) request.getAttribute("materiaId");
            String nombreMateria = request.getParameter("name");
            List<EstudianteNota> estudianteNotas = (List<EstudianteNota>) request.getAttribute("estudianteNotas");
        %>
        <p class="font-semibold">Materia: <%= nombreMateria %></p>
        <div class="bg-white shadow-md rounded-md p-8 w-full border border-slate-200 mt-8">
            <p class="text-md font-bold mb-4 text-[#59656F] underline">Estudiantes y notas de la materia</p>
            <%
                if (estudianteNotas == null || estudianteNotas.isEmpty()) { %>
                    <p class="italic text-slate-400">No hay notas asignadas a los estudiantes</p>
                <%} else {
            %>
            <table class="min-w-full border">
                <thead>
                <tr class="bg-gray-100 border">
                    <th class="px-4 py-2">Nombres</th>
                    <th class="px-4 py-2">Apellidos</th>
                    <th class="px-4 py-2">Dirección</th>
                    <th class="px-4 py-2">Teléfono</th>
                    <th class="px-4 py-2">Nota</th>
                    <th class="px-4 py-2">Acciones</th>
                </tr>
                </thead>
                <tbody>
                <% for (EstudianteNota estudianteNota : estudianteNotas) { %>
                <tr class="border">
                    <td class="px-4 py-2 text-center"><%= estudianteNota.getNombre() %></td>
                    <td class="px-4 py-2 text-center"><%= estudianteNota.getApellidos() %></td>
                    <td class="px-4 py-2 text-center"><%= estudianteNota.getDireccion() %></td>
                    <td class="px-4 py-2 text-center"><%= estudianteNota.getTelefono() %></td>
                    <td class="px-4 py-2 text-center"><%= estudianteNota.getNota() %></td>
                    <td class="px-4 py-2 text-center">
                        <button class="font-semibold bg-[#AC9FBB] hover:opacity-90 text-white font-bold py-2 px-4 rounded" onclick="openEditModal('<%= estudianteNota.getId() %>', '<%= estudianteNota.getNota() %>', '<%= idMateria %>', '<%= nombreMateria %>')">Editar Nota</button>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
            <%
                }
            %>
        </div>
    </main>
</div>
<div id="editModal">
    <div class="modal-content">
        <div class="flex w-[100%] justify-end"><span class="close" onclick="closeEditModal()">&times;</span></div>
        <h2 class="text-center font-semibold text-lg mb-4">Editar Nota</h2>
        <form id="editForm" class="flex flex-col">
            <input type="hidden" id="estudianteId" name="estudianteId">
            <input type="hidden" id="materiaId" name="materiaId" value="<%= idMateria %>">
            <input type="hidden" id="materiaNombre" name="materiaNombre" value="<%= nombreMateria %>">
            <label for="nuevaNota">Establecer nueva nota:</label>
            <input required min="0" max="10" step="0.01" type="number" id="nuevaNota" name="nuevaNota">
            <button type="button" onclick="saveNota()">Guardar</button>
        </form>
    </div>
</div>

<script>
    // Función para abrir el modal y pasar los detalles del estudiante
    function openEditModal(estudianteId, nota, materiaId, materiaNombre) {
        document.getElementById("estudianteId").value = estudianteId;
        document.getElementById("nuevaNota").value = nota;
        document.getElementById("materiaId").value = materiaId;
        document.getElementById("materiaNombre").value = materiaNombre;
        document.getElementById("editModal").style.display = "block";
    }

    // Función para cerrar el modal
    function closeEditModal() {
        document.getElementById("editModal").style.display = "none";
    }

    // Función para guardar la nota editada
    function saveNota() {
        let estudianteId = document.getElementById("estudianteId").value;
        let nuevaNotaInput = document.getElementById("nuevaNota");
        let nuevaNota = parseFloat(nuevaNotaInput.value);
        let materiaId = document.getElementById("materiaId").value;
        let materiaNombre = document.getElementById("materiaNombre").value;

        if (!isValidNota(nuevaNota)) {
            nuevaNotaInput.setCustomValidity("Por favor, introduce una nota válida entre 0 y 10");
            nuevaNotaInput.reportValidity();
            return;
        } else {
            nuevaNotaInput.setCustomValidity("");
        }

        let form = document.createElement("form");
        form.method = "post";
        form.action = "/editGrade";

        let estudianteIdInput = document.createElement("input");
        estudianteIdInput.type = "hidden";
        estudianteIdInput.name = "estudianteId";
        estudianteIdInput.value = estudianteId;
        form.appendChild(estudianteIdInput);

        let nuevaNotaInputHidden = document.createElement("input");
        nuevaNotaInputHidden.type = "hidden";
        nuevaNotaInputHidden.name = "nuevaNota";
        nuevaNotaInputHidden.value = nuevaNota;
        form.appendChild(nuevaNotaInputHidden);

        let materiaIdInput = document.createElement("input");
        materiaIdInput.type = "hidden";
        materiaIdInput.name = "materiaId";
        materiaIdInput.value = materiaId;
        form.appendChild(materiaIdInput);

        let materiaNombreInput = document.createElement("input");
        materiaNombreInput.type = "hidden";
        materiaNombreInput.name = "materiaNombre";
        materiaNombreInput.value = materiaNombre;
        form.appendChild(materiaNombreInput);
        document.body.appendChild(form);
        form.submit();
    }

    function isValidNota(nota) {
        return !isNaN(nota) && nota >= 0 && nota <= 10;
    }
</script>
</body>
</html>