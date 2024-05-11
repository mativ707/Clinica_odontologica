<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login - Clínica odontológica</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style>
            .login-bg {
                background-image: url('https://img.freepik.com/fotos-premium/consultorio-odontologico-higiene-dental-sillon-odontologico_152404-2191.jpg'); /* Reemplaza 'url_de_la_imagen' con la URL de tu imagen de fondo */
                background-size: cover;
                background-position: center;
            }
        </style>
    </head>
    <body class="bg-dark login-bg">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card border-0 rounded-lg mt-5" style="box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);">
                                    <div class="card-header bg-secondary">
                                        <h3 class="text-center font-weight-light my-4 text-white">Ingreso a la Clínica</h3>
                                    </div>
                                    <div class="card-body">
                                        <form action="SvLogin" method="POST">
                                            <div class="mb-3">
                                                <label for="inputEmail" class="form-label text-dark">Usuario</label>
                                                <input class="form-control" id="inputEmail" name="usuario" type="text" placeholder="Ingrese su usuario" required />
                                            </div>
                                            <div class="mb-3">
                                                <label for="inputPassword" class="form-label text-dark">Contraseña</label>
                                                <input class="form-control" id="inputPassword" name="contrasenia" type="password" placeholder="Ingrese su contraseña" required />
                                            </div>
                                            <div class="d-flex justify-content-center">
                                                <button class="btn btn-primary" type="submit">Ingresar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-secondary mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-white">&copy; <%= LocalDate.now().getYear() %> Clínica XYZ</div>
                            <div>
                                <a href="#" class="text-white">Política de Privacidad</a>
                                &middot;
                                <a href="#" class="text-white">Términos y Condiciones</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>



</html>
