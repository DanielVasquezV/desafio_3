
<%@ page import="java.util.List" %>
<%@ page import="sv.edu.udb.desafio_3.beans.Materia" %><%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 08/05/2024
  Time: 5:50 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%if (request.getAttribute("materias") == null){
%><jsp:forward page="/fetchSubject"/>
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
        <h2 class="text-4xl font-bold mb-4 text-[#59656F] underline">Materias</h2>
        <%
            List<Materia> materias = (List<Materia>) request.getAttribute("materias");
        %>
        <div class="bg-white shadow-md rounded-md p-8 w-full border border-slate-200 mt-8">
            <%
                if (materias == null || materias.isEmpty()) { %>
            <p class="italic text-slate-400">No hay materias registradas</p>
            <%} else {
            %>
            <table class="min-w-full">
                <thead>
                <tr class="bg-gray-100">
                    <th class="px-4 py-2">Nombre de materia</th>
                    <th class="px-4 py-2">Acciones</th>
                </tr>
                </thead>
                <tbody>
                    <%
                        for (Materia materia : materias) {
                    %>
                        <tr>
                            <td class="border px-4 py-2"><%= materia.getMateria() %></td>
                            <td class="border px-4 py-2 flex justify-center items-center gap-4">
                                <a href="subject_details.jsp?idMateria=<%= materia.getIdMateria() %>&name=<%= materia.getMateria() %>" class="self-center font-semibold bg-[#AC9FBB] hover:opacity-90 text-white font-bold py-2 px-4 rounded">
                                    Ver más
                                </a>
                                <button class="font-semibold bg-[#AC9FBB] hover:opacity-90 text-white font-bold py-2 px-4 rounded" onclick="openEditModal('<%=materia.getIdMateria()%>', '<%=materia.getMateria()%>')">Editar</button>
                                <form action="delete" method="post" class="flex items-center m-0">
                                    <input type="hidden" id="id" name="id" value="<%= materia.getIdMateria() %>">
                                    <input type="hidden" id="tipo" name="tipo" value="materia">
                                    <button class="self-center font-semibold bg-red-400 hover:opacity-90 text-white font-bold py-2 px-4 rounded">Eliminar</button>
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
        <h2 class="text-center font-semibold text-lg mb-4">Editar Materia</h2>
        <form id="editForm">
            <input type="hidden" id="materiaId" name="materiaId"/>
            <label for="nombre">Nombre:</label>
            <input class="mb-4" required type="text" id="nombre" name="nombre"/>
            <button type="button" onclick="saveNota()">Guardar</button>
        </form>
    </div>
</div>
<script>
    // Función para abrir el modal y pasar los detalles del estudiante
    function openEditModal(materiaId, materiaNombre) {
        document.getElementById("materiaId").value = materiaId;
        document.getElementById("nombre").value = materiaNombre;
        document.getElementById("editModal").style.display = "block";
    }

    // Función para cerrar el modal
    function closeEditModal() {
        document.getElementById("editModal").style.display = "none";
    }

    // Función para guardar la nota editada
    function saveNota() {
        let materiaId = document.getElementById("materiaId").value;
        let materiaNombre = document.getElementById("nombre").value;

        let form = document.createElement("form");
        form.method = "post";
        form.action = "/editSubject";

        let materiaIdInput = document.createElement("input");
        materiaIdInput.type = "hidden";
        materiaIdInput.name = "id";
        materiaIdInput.value = materiaId;
        form.appendChild(materiaIdInput);

        let materiaNombreInput = document.createElement("input");
        materiaNombreInput.type = "hidden";
        materiaNombreInput.name = "nombre";
        materiaNombreInput.value = materiaNombre;
        form.appendChild(materiaNombreInput);

        document.body.appendChild(form);
        form.submit();
    }
</script>
</body>
</html>
