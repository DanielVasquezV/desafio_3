<%--
  Created by IntelliJ IDEA.
  User: Daniel
  Date: 08/05/2024
  Time: 10:54 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE>
<html>
<head>
    <title>Control de estudiantes</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/f008f6fb10.js" crossorigin="anonymous"></script>
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
            <a class="flex p-4 items-center rounded-md my-1 bg-[#59656F] text-white justify-center lg:justify-start cursor-pointer hover:font-bold ease-in duration-100" href="add_grade.jsp">
                <i class="fa-solid fa-pencil"></i>
                <h3 class="ml-2 hidden hidden lg:block">Añadir notas</h3>
            </a>
            <a class="flex p-4 items-center rounded-md my-1 text-[#59656F] justify-center lg:justify-start cursor-pointer hover:font-bold ease-in duration-100" href="subjects_view.jsp">
                <i class="fa-solid fa-id-card-clip"></i>
                <h3 class="ml-2 hidden hidden lg:block">Ver materias</h3>
            </a>
        </div>
    </div>
    <!--CONTENIDO DE LA PÁGINA-->
    <main class="overflow-x-auto p-7 mb-4 md:bt-0 md:ml-2 bg-white md:w-5/6 rounded-lg h-full">
        <h2 class="text-4xl font-bold mb-4 text-[#59656F] underline">Añadir una nota</h2>
        <!--MENSAJE DE ÉXITO
        <div class="mx-[1rem] bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative" role="alert">
            <strong class="font-bold">¡Éxito!</strong>
            <span class="block sm:inline">Su solicitud se ha completado correctamente.</span>
        </div>
        MENSAJE DE ERROR
        <div class="mx-[1rem] bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
            <strong class="font-bold">¡Error!</strong>
            <span class="block sm:inline">Hubo un problema con su solicitud.</span>
        </div> -->
        <div class="bg-white shadow-md rounded-md p-8 w-full border border-slate-200 mt-8">
            <form action="" method="">
                <div class="flex gap-3 items-center" >
                    <div class="flex items-center my-[1.5rem] w-[90%]">
                        <div class="mr-4">
                            <i class="fa-solid fa-user text-gray-400"></i>
                        </div>
                        <select name="" id="" class="flex-1 p-2 border border-slate-200 rounded" required>
                            <option class="border-b border-gray-300 focus:outline-none focus:border-[#AC9FBB]" value="" selected disabled>Seleccione un estudiante</option>
                        </select>
                    </div>
                    <div class="flex items-center my-[1.5rem] w-[90%]">
                        <div class="mr-4">
                            <i class="fa-solid fa-clipboard text-gray-400"></i>
                        </div>
                        <select name="" id="" class="flex-1 p-2 border border-slate-200 rounded" required>
                            <option class="border-b border-gray-300 focus:outline-none focus:border-[#AC9FBB]" value="" selected disabled>Seleccione una materia</option>
                        </select>
                    </div>
                </div>
                <div class="flex items-center mt-[3rem] mb-[3rem]">
                    <div class="mr-4">
                        <i class="fa-solid fa-file-pen text-gray-400"></i>
                    </div>
                    <input required type="number" id="nota" name="nota" min="0" max="10" step="0.01" placeholder="Ingrese la nota" class="border-b border-gray-300 focus:outline-none focus:border-[#AC9FBB] flex-1">
                </div>
                <button type="submit" class="font-semibold bg-[#AC9FBB] text-white py-2 px-4 rounded-md focus:outline-none hover:opacity-90 transition w-full">Enviar</button>
            </form>
        </div>
    </main>
</div>
</body>
</html>
