<%@ page import="java.util.List" %>
<%@ page import="sv.edu.udb.desafio_3.beans.Student" %><%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 08/05/2024
  Time: 5:50 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%if (request.getAttribute("estudiantes") == null){
%><jsp:forward page="/fetchStudent"/>
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
            <a class="flex p-4 items-center rounded-md my-1 bg-[#59656F] text-white justify-center lg:justify-start cursor-pointer hover:font-bold ease-in duration-100" href="students_view.jsp">
                <i class="fa-solid fa-id-card-clip"></i>
                <h3 class="ml-2 hidden hidden lg:block">Ver Estudiantes</h3>
            </a>
            <a class="flex p-4 items-center rounded-md my-1 text-[#59656F] justify-center lg:justify-start cursor-pointer hover:font-bold ease-in duration-100" href="subjects_view.jsp">
                <i class="fa-solid fa-book"></i>
                <h3 class="ml-2 hidden hidden lg:block">Ver materias</h3>
            </a>
        </div>
    </div>
    <!--CONTENIDO DE LA PÁGINA-->
    <main class="overflow-x-auto p-7 mb-4 md:bt-0 md:ml-2 bg-white md:w-5/6 rounded-lg h-full">
        <h2 class="text-4xl font-bold mb-4 text-[#59656F] underline">Estudiantes</h2>
        <%
            List<Student> estudiantes = (List<Student>) request.getAttribute("estudiantes");
        %>

        <div class="bg-white shadow-md rounded-md p-8 w-full border border-slate-200 mt-8">
            <%
                if (estudiantes == null || estudiantes.isEmpty()) { %>
            <p class="italic text-slate-400">No hay estudiantes registrados</p>
            <%} else {
            %>
            <table class="min-w-full">
                <thead>
                <tr class="bg-gray-100">
                    <th class="px-4 py-2">Nombres</th>
                    <th class="px-4 py-2">Apellidos</th>
                    <th class="px-4 py-2">Dirección</th>
                    <th class="px-4 py-2">Teléfono</th>
                    <th class="px-4 py-2">Acciones</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (Student estudiante : estudiantes) {
                %>
                <tr>
                    <td class="border px-4 py-2"><%=estudiante.getNombres()%></td>
                    <td class="border px-4 py-2"><%=estudiante.getApellidos()%></td>
                    <td class="border px-4 py-2"><%=estudiante.getDireccion()%></td>
                    <td class="border px-4 py-2"><%=estudiante.getTelefono()%></td>
                    <td class="border px-4 py-2 flex justify-center gap-4 h-[3.5rem]">
                        <button class="font-semibold bg-[#AC9FBB] hover:opacity-90 text-white font-bold py-2 px-4 rounded" onclick="openEditModal('<%=estudiante.getIdEstudiante()%>', '<%=estudiante.getNombres()%>', '<%=estudiante.getApellidos()%>', '<%=estudiante.getDireccion()%>', '<%=estudiante.getTelefono()%>')">Editar</button>
                        <form action="delete" method="post" class="h-fit">
                            <input type="hidden" name="id" id="id" value="<%=estudiante.getIdEstudiante()%>">
                            <input type="hidden" name="tipo" id="tipo" value="estudiante">
                            <button type="submit" class="self-center font-semibold bg-red-400 hover:opacity-90 text-white font-bold py-2 px-4 rounded">
                                Eliminar
                            </button>
                        </form>
                    </td>
                </tr>
                <%
                }
                %>
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
        <h2 class="text-center font-semibold text-lg mb-4">Editar Estudiante</h2>
        <form id="editForm" class="flex flex-col gap-4">
            <input type="hidden" id="estudianteId" name="estudianteId">
            <div class="container">
                <label for="nombres">Nombres:</label>
                <input type="text" id="nombres" name="nombres" pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+" title="Ingrese solo letras" required>
            </div>
            <div class="container">
                <label for="apellidos">Apellidos:</label>
                <input type="text" id="apellidos" name="apellidos" pattern="[A-Za-záéíóúÁÉÍÓÚ\s]+" title="Ingrese solo letras" required>
            </div>
            <div class="container">
                <label for="direccion">Dirección:</label>
                <input type="text" id="direccion" name="direccion" pattern="[A-Za-z0-9áéíóúÁÉÍÓÚ\s]+" title="Ingrese solo letras y números" required>
            </div>
            <div class="container">
                <label for="telefono">Telefono:</label>
                <input type="text" id="telefono" name="telefono" pattern="[0-9]{4}-[0-9]{4}" title="Ingrese un número de teléfono válido (formato: 0000-0000)" required>
            </div>
            <button type="button" onclick="saveNota()">Guardar cambios</button>
        </form>
    </div>
</div>
<script>
    // Función para abrir el modal y pasar los detalles del estudiante
    function openEditModal(estudianteId, estudianteNombre, estudianteApellido, estudianteDireccion, estudianteTelefono) {
        document.getElementById("estudianteId").value = estudianteId;
        document.getElementById("nombres").value = estudianteNombre;
        document.getElementById("apellidos").value = estudianteApellido;
        document.getElementById("direccion").value = estudianteDireccion;
        document.getElementById("telefono").value = estudianteTelefono;
        document.getElementById("editModal").style.display = "block";
    }

    // Función para cerrar el modal
    function closeEditModal() {
        document.getElementById("editModal").style.display = "none";
    }

    // Función para guardar la nota editada
    function saveNota() {
        let estudianteId = document.getElementById("estudianteId").value;
        let estudianteNombres = document.getElementById("nombres").value;
        let estudianteApellidos = document.getElementById("apellidos").value;
        let estudianteDireccion = document.getElementById("direccion").value;
        let estudianteTelefono = document.getElementById("telefono").value;

        let form = document.createElement("form");
        form.method = "post";
        form.action = "/editStudent";

        let estudianteIdInput = document.createElement("input");
        estudianteIdInput.type = "hidden";
        estudianteIdInput.name = "estudianteId";
        estudianteIdInput.value = estudianteId;
        form.appendChild(estudianteIdInput);

        let nombresInput = document.createElement("input");
        nombresInput.type = "hidden";
        nombresInput.name = "nombres";
        nombresInput.value = estudianteNombres;
        form.appendChild(nombresInput);

        let apellidosInput = document.createElement("input");
        apellidosInput.type = "hidden";
        apellidosInput.name = "apellidos";
        apellidosInput.value = estudianteApellidos;
        form.appendChild(apellidosInput);

        let direccionInput = document.createElement("input");
        direccionInput.type = "hidden";
        direccionInput.name = "direccion";
        direccionInput.value = estudianteDireccion;
        form.appendChild(direccionInput);

        let telefonoInput = document.createElement("input");
        telefonoInput.type = "hidden";
        telefonoInput.name = "telefono";
        telefonoInput.value = estudianteTelefono;
        form.appendChild(telefonoInput);

        document.body.appendChild(form);
        form.submit();
    }
</script>
</body>

</html>
